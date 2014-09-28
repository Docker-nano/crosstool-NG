crosstool-NG container
======================

This is a [Docker](http://docker.com) container for [crosstool-NG](http://crosstool-ng.org) with configurable [uClibc](http://www.uclibc.org) for building toolchains. It was created to support the [Docker nano](https://github.com/Docker-nano) project.

Building
--------

To build the default toolchain follow these steps.

1. `./build\ image.sh` – Build the Docker image.
2. `./build\ toolchain.bash` – Build the toolchain.

The compressed toolchain tarball is copied to your working directory.

Customizing
-----------

The following commands are available within the container.

* `toolchain-build` – Build the toolchain.
* `crosstool-configure` – Configure crosstool-NG.
* `uclibc-configure` – Configure uClibc.

