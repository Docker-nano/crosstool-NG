#!/bin/sh

cd ~

# Install dependencies.
apt-get update && DEBIAN_FRONTEND=noninteractive\
	apt-get install -y build-essential gperf bison flex texinfo wget gawk libtool automake libncurses5-dev help2man

# Download and compile crosstool-NG.
wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.22.0.tar.xz 2>&1 &&\
	tar xf crosstool-ng-*.tar* &&\
	(
		cd crosstool-ng &&\
		./configure && make && make install &&\
		rm -rf ../crosstool-ng-*
	)
# Download and unpack uClibc.
wget --no-check-certificate https://www.uclibc.org/downloads/uClibc-0.9.33.2.tar.xz 2>&1 &&\
tar xf uClibc-*.tar* &&\
rm *.tar*

# Internal wiring.
mkdir crosstool-NG /etc/uclibc &&\
	ln -s uClibc-* uClibc &&\
	ln -s /etc/crosstool-ng/crosstool-ng.conf crosstool-NG/.config
	ln -s /root/uClibc/.config /etc/uclibc/uclibc.conf

cd -

cp	in/toolchain-build		/usr/local/bin/

(cd /etc && mkdir crosstool-ng uclibc)
cp	in/crosstool-ng.conf	/etc/crosstool-ng/crosstool-ng.conf
cp	in/uclibc.conf			/etc/uclibc/uclibc.conf
