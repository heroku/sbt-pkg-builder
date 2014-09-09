#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/play-common.sh

SCALA_VERSION="2.10"
SBT_VERSIONS="0.13.0 0.13.1 0.13.2 0.13.3 0.13.4 0.13.5"
for SBT_VERSION in $SBT_VERSIONS; do
  PLAY_VERSIONS="2.2.0 2.2.1 2.2.2 2.2.3 2.2.4"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    create_play22_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play_2.2_${SCALA_VERSION}" $@
