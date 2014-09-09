#!/usr/bin/env bash

create_play20_app() {
  local genDir=$1
  local playVersion=$2
  local scalaVersion="0.11.3"
  local sbtVersion="2.9"

  playDir=$genDir/play${playVersion}_${scalaVersion}_${sbtVersion}
  mkdir -p $playDir/project

cat > $playDir/project/build.properties <<EOF
sbt.version=${sbtVersion}
EOF

  cat > $playDir/project/Build.scala <<EOF
import sbt._
import Keys._
import PlayProject._

object ApplicationBuild extends Build {

    val appName         = "sample-app"
    val appVersion      = "1.0-SNAPSHOT"

    val appDependencies = Seq(
      // Add your project dependencies here,
    )

    val main = PlayProject(appName, appVersion, appDependencies, mainLang = SCALA).settings(
      // Add your own project settings here
    )

}
EOF

  cat > $playDir/project/plugings.sbt <<EOF
resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"

addSbtPlugin("play" % "sbt-plugin" % "${playVersion}")
EOF
}

create_play21_app() {
  local genDir=$1
  local playVersion=$2
  local scalaVersion=$3
  local sbtVersion=$4

  playDir=$genDir/play${playVersion}_${scalaVersion}_${sbtVersion}
  mkdir -p $playDir/project

  cat > $playDir/project/build.properties <<EOF
sbt.version=${sbtVersion}
EOF

  cat > $playDir/project/Build.scala <<EOF
import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {

  val appName         = "sample-app"
  val appVersion      = "1.0-SNAPSHOT"

  val appDependencies = Seq(
    // Add your project dependencies here,
    jdbc,
    anorm
  )


  val main = play.Project(appName, appVersion, appDependencies).settings(
    // Add your own project settings here
  )
}
EOF

  cat > $playDir/project/plugings.sbt <<EOF
resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"

addSbtPlugin("play" % "sbt-plugin" % "${playVersion}")
EOF
}

create_play22_app() {
  local genDir=$1
  local playVersion=$2
  local scalaVersion=$3
  local sbtVersion=$4

  playDir=$genDir/play${playVersion}_${scalaVersion}_${sbtVersion}
  mkdir -p $playDir/project

  cat > $playDir/project/build.properties <<EOF
sbt.version=${sbtVersion}
EOF

  cat > $playDir/build.sbt <<EOF
name := "sample-app"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache
)

play.Project.playScalaSettings
EOF

  cat > $playDir/project/plugings.sbt <<EOF
resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"

addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "${playVersion}")
EOF
}

create_play23_app() {
  local genDir=$1
  local playVersion=$2
  local scalaVersion=$3
  local sbtVersion=$4

  playDir=$genDir/play${playVersion}_${scalaVersion}_${sbtVersion}
  mkdir -p $playDir/project

  cat > $playDir/project/build.properties <<EOF
sbt.version=${sbtVersion}
EOF

  cat > $playDir/build.sbt <<EOF
name := """sample-play"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "${scalaVersion}"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache,
  javaWs
)
EOF

  cat > $playDir/project/plugings.sbt <<EOF
resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"

addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "${playVersion}")
EOF
}
