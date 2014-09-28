#!/bin/bash

if docker run -a STDOUT --cidfile=.cid ct-ng toolchain-build; then
	container=$(cat .cid)

	docker cp $container:/root/toolchain . &&\
	docker rm $container
fi

rm .cid
