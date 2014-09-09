#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
GEN_DIR=${BIN_DIR}/../projects/generated
mkdir -p ${GEN_DIR}

. ${BIN_DIR}/sbt-common.sh

SCALA_VERSIONS="2.9.1 2.10.4 2.11.1"
for SCALA_VERSION in $SCALA_VERSIONS; do
  SBT_VERSIONS="0.11.2 0.11.3 0.12.1 0.12.2 0.12.3 0.12.4 0.13.0 0.13.1 0.13.2 0.13.3 0.13.4 0.13.5"
  for SBT_VERSION in $SBT_VERSIONS; do
    create_minimal_app "$GEN_DIR" "$SCALA_VERSION" "$SBT_VERSION"
  done
done
$BIN_DIR/build.sh "$GEN_DIR" "sbt-cache-base" $@
