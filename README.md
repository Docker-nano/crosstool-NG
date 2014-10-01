crosstool-NG container
======================

This is a [Docker](http://docker.com) container for [crosstool-NG](http://crosstool-ng.org) with configurable [uClibc](http://www.uclibc.org) for building toolchains. It was created to support the [Docker nano](https://github.com/Docker-nano) project.

Building
--------

To build the default toolchain follow these steps.

1. `./build\ image` – Build the Docker image locally and tag as *ct-ng*.
2. `./build\ toolchain` – Build the toolchain from the local *ct-ng* image.

The compressed toolchain tarball is copied to your working directory.

Customizing the build
---------------------

The build can be customized from within the container. To enter the container run `run container`. The following commands are available within the container.

* `crosstool-configure` – Configure crosstool-NG.
* `uclibc-configure` – Configure uClibc.
* `toolchain-build` – Build the toolchain.

To copy the toolchain to the host run `pull toolchain` from the host. The following scripts are available on the host.

* `run container` – Removes any previous container started by this script and runs a new interactive container named *CT-NG*.
* `pull configs` – Copies crosstool-NG and uClibc configurations from the *CT-NG* container.
* `pull toolchain` – Copies the toolchain from the *CT-NG* container.

If you wish to build the modified toolchain outside the container you must first `pull configs` then follow the steps in [Building](#building) to rebuild the image.

