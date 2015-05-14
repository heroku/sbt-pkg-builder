#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/play-common.sh

SCALA_VERSIONS="2.10.5 2.11.6"
for SCALA_VERSION in $SCALA_VERSIONS; do
  SBT_VERSIONS="0.13.8"
  for SBT_VERSION in $SBT_VERSIONS; do
    PLAY_VERSIONS="2.4.0-RC3"
    for PLAY_VERSION in $PLAY_VERSIONS; do
      create_play24_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
    done
  done

  SCALA_MAJOR_VERSION=$(expr "${SCALA_VERSION}" : "\(2.1[0-9]\)")
  $BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play-2.4_${SCALA_MAJOR_VERSION}" $@
done
