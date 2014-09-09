#!/bin/bash

if [ "Darwin" == `uname` ]; then
  boot2docker start > /dev/null 2>&1
  export DOCKER_HOST="tcp://`boot2docker ip`:2375"
fi

rm sbt-cache-*.tar.gz

docker build --rm -t heroku/sbt-pkg-builder .

docker rm sbt-pkg-builder
docker run --name="sbt-pkg-builder" -it heroku/sbt-pkg-builder

CONTAINER_ID=`docker ps -a | grep sbt-pkg-builder | awk '{print $1}'`

echo "Copying sbt-cache-base.tar.gz..."
docker cp $CONTAINER_ID:/app/sbt-cache-base.tar.gz .

SCALA_VERSIONS="2.9 2.10 2.11"
for SCALA_VERSION in $SCALA_VERSIONS; do
  PLAY_VERSIONS="2.0 2.1 2.2 2.3"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    echo "Copying sbt-cache-play-${PLAY_VERSION}_${SCALA_VERSION}.tar.gz..."
    docker cp $CONTAINER_ID:/app/sbt-cache-play_${PLAY_VERSION}_${SCALA_VERSION}.tar.gz .
  done
done
