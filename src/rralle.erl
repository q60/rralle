-module(rralle).

-export([main/1]).


main(_) ->
    application:ensure_all_started(hackney),
    Parameters = "method=getQuote&format=text&lang=en",
    {ok, Code, _, ClientRef} = hackney:get("https://api.forismatic.com/api/1.0/?" ++ Parameters,
                                           [],   %% headers
                                           <<>>, %% payload
                                           []),  %% options
    case Code of
        200 -> %% if request succeeded
            {ok, Text} = hackney:body(ClientRef),
            Quote = string:strip(binary:bin_to_list(Text)),
            case re:run(Quote, "\\(.+\\)$") of
                {match, [Captured]} ->
                    {AuthorStart, AuthorLen} = Captured,
                    Author = string:slice(Quote, AuthorStart + 1, AuthorLen - 2),
                    QuoteFormed = string:slice(Quote, 0, AuthorStart),
                    io:format("\"\x1B[94m\x1B[1m~s\x1B[0m\"~n\x1B[93m~s\x1B[0m~n",
                              [wrap(string:strip(QuoteFormed), 40),
                               string:strip(Author)]);
                nomatch ->
                    io:format("\"\x1B[94m\x1B[1m~s\x1B[0m\"~n", [wrap(Quote, 40)])
            end;
        _ -> %% else ...
            io:format("\x1B[94m\x1B[1mHTTP error:\x1B[0m \x1B[91m~B\x1B[0m~n", [Code]),
            halt(1) %% exiting with non-zero status
    end.

wrap(Str, MaxLen) ->
    wrap(0, string:tokens(Str, " "), [], MaxLen). %% splitting string

wrap(Acc, [H | T], Res, MaxLen) ->
    if
        Acc >= MaxLen ->
            %% resetting line length counter, adding newline char
            wrap(string:len(H), T, Res ++ ["\n"] ++ [H], MaxLen);
        true ->
            %% incrementing counter by length of current word
            wrap(Acc + string:len(H), T, Res ++ [H], MaxLen)
    end;

wrap(_, [], Res, _) ->
    lists:flatten(lists:join(" ", Res)). %% flattening list of strings
