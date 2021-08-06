NAME = rralle
TARGET = _build/default/bin/rralle

.PHONY: build test

all: build test

build:
	rebar3 get-deps
	rebar3 escriptize

test:
	$(TARGET)

install:
	install -Dm755 "$(TARGET)" "$(DESTDIR)/usr/bin/$(NAME)"

uninstall:
	rm -rfv "$(DESTDIR)/usr/bin/$(NAME)"
