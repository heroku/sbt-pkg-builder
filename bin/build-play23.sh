#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/play-common.sh

SCALA_VERSIONS="2.10.4 2.11.5"
for SCALA_VERSION in $SCALA_VERSIONS; do
  SBT_VERSIONS="0.13.7"
  for SBT_VERSION in $SBT_VERSIONS; do
    PLAY_VERSIONS="2.3.5 2.3.6 2.3.7"
    for PLAY_VERSION in $PLAY_VERSIONS; do
      create_play23_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
    done
  done

  SCALA_MAJOR_VERSION=$(expr "${SCALA_VERSION}" : "\(2.1[0-9]\)")
  $BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play-2.3_${SCALA_MAJOR_VERSION}" $@
done
