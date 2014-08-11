#!/bin/bash

docker build --rm -t heroku/sbt-pkg-builder .

docker run -it heroku/sbt-pkg-builder

CONTAINER_ID=`docker ps -l -q`

docker cp $CONTAINER_ID:/app/sbt-play-cache.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache.tar.gz .
