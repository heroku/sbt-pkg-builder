#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/play-common.sh

PLAY_VERSIONS="2.0 2.0.1 2.0.2 2.0.3 2.0.4"
for PLAY_VERSION in $PLAY_VERSIONS; do
  create_play20_app "$GEN_DIR" "$PLAY_VERSION"
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play_2.0_${SCALA_VERSION}" $@
