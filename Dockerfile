FROM ubuntu:14.04
MAINTAINER Bilge <bilge@scriptfusion.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive\
	apt-get install -y build-essential gperf bison flex texinfo wget gawk libtool automake libncurses5-dev

RUN cd /tmp &&\
	wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.20.0.tar.xz 2>&1 &&\
	tar xf crosstool-ng-*.tar* &&\
	cd crosstool-ng-* &&\
	./configure && make && make install clean &&\
	rm -rf /tmp/*
