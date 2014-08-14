#!/bin/bash

rm sbt-cache-*.tar.gz

docker build --rm -t heroku/sbt-pkg-builder .

docker rm sbt-pkg-builder
docker run --name="sbt-pkg-builder" -it heroku/sbt-pkg-builder

CONTAINER_ID=`docker ps -a | grep sbt-pkg-builder | awk '{print $1}'`

docker cp $CONTAINER_ID:/app/sbt-cache-play-2.3_2.10.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-play-2.3_2.11.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-play-2.2_2.10.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-play-2.1_2.10.tar.gz .
docker cp $CONTAINER_ID:/app/sbt-cache-play-2.0_2.9.tar.gz .

docker cp $CONTAINER_ID:/app/sbt-cache-base.tar.gz .
