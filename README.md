esp32-mruby-handson-docker
===========================

What's this
-----------

This is `Dockerfile` to build running environment ESP32 board
for ESP32 x mruby/c handson seminar.

Note
----

Following commands are example.

How to build
------------

```bash
$ docker build -t someone:esp32-mruby-handson .
```

How to run
----------

```bash
$ docker run -it --device=/dev/(tty for target device):/dev/ttyUSB0 someone:esp232-mruby-handson
```

LICENSE
-------

MIT License.
