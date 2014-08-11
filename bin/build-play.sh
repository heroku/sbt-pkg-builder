#!/bin/bash

BIN_DIR=$(cd $(dirname $0); pwd)
$BIN_DIR/build.sh "sbt-play-cache" "nothing" $@
