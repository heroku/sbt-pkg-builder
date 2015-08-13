#!/bin/bash

DRY_RUN=$3
ARCHIVE_NAME=$2
PROJECTS_DIR=$1

if [ -z "$ARCHIVE_NAME" ]; then
  echo "Archive name must be provided as first arg!"
  echo "You probably just want to run one of the build-*.sh scripts..."
  exit 1
fi

if [ -d target ] ; then
  rm -rf target
fi

HOME_DIR=$(cd $(dirname $0)/..; pwd)
BUILD_DIR=$HOME_DIR/target

mkdir $BUILD_DIR
cd $BUILD_DIR

mkdir -p .ivy2/cache .sbt

SBT_JAR="sbt-launch.jar"
SBT_URL="http://dl.bintray.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.9/$SBT_JAR"
curl -O --location $SBT_URL

SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled"
SBT_OPTS="$SBT_OPTS -XX:MaxPermSize=256M -Dfile.encoding=UTF8"
SBT_OPTS="$SBT_OPTS -Duser.home=$BUILD_DIR -Dsbt.global.base=$BUILD_DIR/.sbt"
SBT_OPTS="$SBT_OPTS -Dsbt.ivy.home=$BUILD_DIR/.ivy2 -Divy.default.ivy.user.dir=$BUILD_DIR/.ivy2"

PROJECT_DIRS=`ls $PROJECTS_DIR`
for DIR in $PROJECT_DIRS; do
  echo "Resolving $DIR"
  cp -r $PROJECTS_DIR/$DIR $DIR
  cd $DIR
  if [ -z "$DRY_RUN" ]; then
    java $SBT_OPTS -jar $BUILD_DIR/$SBT_JAR update
  fi
  cd - >/dev/null 2>&1
  rm -rf $DIR
done

rm -rf $PROJECTS_DIR/*

mkdir -p $HOME_DIR/builds

echo "Packing .ivy2 and .sbt dirs into $ARCHIVE_NAME.tar.gz ..."
tar cfz $ARCHIVE_NAME.tar.gz .ivy2 .sbt

echo "Moving $ARCHIVE_NAME.tar.gz ..."
mv $ARCHIVE_NAME.tar.gz $HOME_DIR/builds
ls -al $HOME_DIR/builds

echo "done"
