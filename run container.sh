#!/bin/sh

docker rm CT-NG >&- 2>&-
docker run -it --name=CT-NG ct-ng
