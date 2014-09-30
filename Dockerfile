FROM debian:6
MAINTAINER Bilge <bilge@scriptfusion.com>

WORKDIR	/root

# Install dependencies.
RUN	apt-get update && DEBIAN_FRONTEND=noninteractive\
	apt-get install -y build-essential gperf bison flex texinfo wget gawk libtool automake libncurses5-dev

# Download and compile crosstool-NG.
RUN	wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.20.0.tar.xz 2>&1 &&\
	tar xf crosstool-ng-*.tar* &&\
	cd crosstool-ng-* &&\
	./configure && make && make install &&\
	rm -rf ../crosstool-ng*

# Download and unpack uClibc.
RUN	wget http://www.uclibc.org/downloads/uClibc-0.9.33.2.tar.xz 2>&1 &&\
	tar xf uClibc-*.tar* &&\
	rm *.tar*

# Internal wiring.
RUN	mkdir crosstool-NG /etc/crosstool-ng /etc/uclibc &&\
	ln -s uClibc-* uClibc &&\
	ln -s /root/crosstool-NG/.config /etc/crosstool-ng/crosstool-ng.conf &&\
	ln -s /root/uClibc/.config /etc/uclibc/uclibc.conf

COPY	in/toolchain-build	/usr/local/bin/
COPY	in/crosstool-configure	/usr/local/bin/
COPY	in/uclibc-configure	/usr/local/bin/
COPY	in/crosstool-ng.conf	/root/crosstool-NG/.config
COPY	in/uclibc.conf		/root/uClibc/.config
