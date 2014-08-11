#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)

$BIN_DIR/build-play.sh $@
$BIN_DIR/build-sbt.sh $@
