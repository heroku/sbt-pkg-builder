#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)

PLAY_VERSIONS="2.3.0 2.3.1 2.3.2"
for VERSION in $PLAY_VERSIONS; do
  $BIN_DIR/build.sh "sbt-cache-play-$VERSION" "nothing" "play$VERSION" $@
done
