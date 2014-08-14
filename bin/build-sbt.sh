#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)

SCALA_VERSIONS="2.10 2.11"
for SCALA_VERSION in $SCALA_VERSIONS; do
  $BIN_DIR/build.sh "sbt-cache-base-0.13_${SCALA_VERSION}" "play" ".*_${SCALA_VERSION}" $@
done
