rrallë |erlang| |aur1| |aur2|
======

**Rrallë** (IPA: [raːɫ], stylized as *rrallë*) is a random quote
fetching console utility. Written in Erlang.

|screenshot|

Installing
----------

+ Install from AUR - `rralle-bin  <https://aur.archlinux.org/packages/rralle-bin/>`__, `rralle <https://aur.archlinux.org/packages/rralle/>`__
+ Use latest pre-built binary from `releases <https://github.com/q60/rralle/releases>`__

Building and installing manually
--------------------------------

You need *Erlang* to use **rrallë**, you also need *GNU make* and `rebar3 <https://github.com/erlang/rebar3>`__ to build it.

.. code-block:: sh

    make
    sudo make install

Running
-------

.. code-block:: sh

    rralle

Uninstalling
------------

.. code-block:: sh

    sudo make uninstall

.. |screenshot| image:: https://i.imgur.com/knPN9W7.jpg
.. |erlang| image:: https://img.shields.io/badge/-Erlang-8c002f?style=for-the-badge&logo=erlang
.. |aur1| image:: https://img.shields.io/aur/version/rralle?logo=archlinux&style=for-the-badge&label=rralle
    :target: https://aur.archlinux.org/packages/rralle/
.. |aur2| image:: https://img.shields.io/aur/version/rralle-bin?logo=archlinux&style=for-the-badge&label=rralle-bin
    :target: https://aur.archlinux.org/packages/rralle-bin/
