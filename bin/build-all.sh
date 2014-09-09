#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/play-common.sh
. ${BIN_DIR}/sbt-common.sh

PLAY_VERSIONS="2.0 2.0.1 2.0.2 2.0.3 2.0.4"
for PLAY_VERSION in $PLAY_VERSIONS; do
  create_play20_app "$GEN_DIR" "$PLAY_VERSION"
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play_2.0_${SCALA_VERSION}" $@

SCALA_VERSION="2.10"
SBT_VERSIONS="0.12.2 0.12.3 0.12.4"
for SBT_VERSION in $SBT_VERSIONS; do
  PLAY_VERSIONS="2.1.0 2.1.1 2.1.2 2.1.3 2.1.4 2.1.5"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    create_play21_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play_2.1_${SCALA_VERSION}" $@

SCALA_VERSION="2.10"
SBT_VERSIONS="0.13.0 0.13.1 0.13.2 0.13.3 0.13.4 0.13.5"
for SBT_VERSION in $SBT_VERSIONS; do
  PLAY_VERSIONS="2.2.0 2.2.1 2.2.2 2.2.3 2.2.4"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    create_play22_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play_2.2_${SCALA_VERSION}" $@

SCALA_VERSIONS="2.10.4 2.11.1"
for SCALA_VERSION in $SCALA_VERSIONS; do
  SBT_VERSIONS="0.13.5"
  for SBT_VERSION in $SBT_VERSIONS; do
    PLAY_VERSIONS="2.3.0 2.3.1 2.3.2 2.3.3 2.3.4"
    for PLAY_VERSION in $PLAY_VERSIONS; do
      create_play23_app "$GEN_DIR" "$PLAY_VERSION" "$SCALA_VERSION" "$SBT_VERSION"
    done
  done

  SCALA_MAJOR_VERSION=$(expr "${SCALA_VERSION}" : "\(2.1[0-9]\)")
  $BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-play_2.3_${SCALA_MAJOR_VERSION}" $@
done

SCALA_VERSIONS="2.9.1 2.10.4 2.11.1"
for SCALA_VERSION in $SCALA_VERSIONS; do
  SBT_VERSIONS="0.11.2 0.11.3 0.12.1 0.12.2 0.12.3 0.12.4 0.13.0 0.13.1 0.13.2 0.13.3 0.13.4 0.13.5"
  for SBT_VERSION in $SBT_VERSIONS; do
    create_minimal_app "$GEN_DIR" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-base" $@
