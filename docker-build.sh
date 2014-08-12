#!/bin/bash

rm sbt-*cache.tar.gz

docker build --rm -t heroku/sbt-pkg-builder .

docker rm sbt-pkg-builder
docker run --name="sbt-pkg-builder" -it heroku/sbt-pkg-builder

CONTAINER_ID=`docker ps -a | grep sbt-pkg-builder | awk '{print $1}'`

docker cp $CONTAINER_ID:/app/sbt-cache-play-2.3.0.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-play-2.3.1.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-play-2.3.2.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-base.tar.gz .
