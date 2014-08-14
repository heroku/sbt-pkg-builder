#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)

SCALA_VERSIONS="2.9 2.10 2.11"
for SCALA_VERSION in $SCALA_VERSIONS; do
  PLAY_VERSIONS="2.0 2.1 2.2"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    $BIN_DIR/build.sh "sbt-cache-play-${PLAY_VERSION}_${SCALA_VERSION}" \
                      "nothing" "play${PLAY_VERSION}.[0-9]_${SCALA_VERSION}" $@
  done
done
