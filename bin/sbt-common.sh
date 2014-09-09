#!/usr/bin/env bash

create_minimal_app() {
  local genDir=$1
  local scalaVersion=$2
  local sbtVersion=$3

  playDir=$genDir/play2.0_${scalaVersion}_${sbtVersion}
  mkdir -p $playDir/project

  cat > $playDir/project/build.properties <<EOF
sbt.version=${sbtVersion}
EOF

  cat > $playDir/build.sbt <<EOF
name := """scala-getting-started"""

version := "1.0"

scalaVersion := "${scalaVersion}"
EOF
}
