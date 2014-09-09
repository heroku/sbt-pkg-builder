#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/play-common.sh

SCALA_VERSION="2.10"
SBT_VERSIONS="0.12.2 0.12.3 0.12.4"
for SBT_VERSION in $SBT_VERSIONS; do
  PLAY_VERSIONS="2.1.0 2.1.1 2.1.2 2.1.3 2.1.4 2.1.5"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    create_play21_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play-2.1_${SCALA_VERSION}" $@
