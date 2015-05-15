#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/sbt-common.sh

SCALA_VERSIONS="2.9.1 2.10.5 2.11.6"
for SCALA_VERSION in $SCALA_VERSIONS; do
  SBT_VERSIONS="0.11.3 0.12.4 0.13.5 0.13.8"
  for SBT_VERSION in $SBT_VERSIONS; do
    create_minimal_app "$GEN_DIR" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-base" $@
