#!/bin/bash

./bin/build-all.sh

echo "Uploading sbt-cache-base.tar.gz..."
s3cmd put --acl-public \
  --access_key="$AWS_ACCESS_KEY" \
  --secret_key="$AWS_SECRET_KEY" \
  sbt-cache-base.tar.gz \
  s3://lang-jvm.s3.amazonaws.com/sbt/stage/

SCALA_VERSIONS="2.9 2.10 2.11"
for SCALA_VERSION in $SCALA_VERSIONS; do
  PLAY_VERSIONS="2.0 2.1 2.2 2.3"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    echo "Uploading sbt-cache-play-${PLAY_VERSION}_${SCALA_VERSION}.tar.gz..."
    s3cmd put --acl-public \
      --access_key="$AWS_ACCESS_KEY" \
      --secret_key="$AWS_SECRET_KEY" \
      sbt-cache-play_${PLAY_VERSION}_${SCALA_VERSION}.tar.gz \
      s3://lang-jvm.s3.amazonaws.com/sbt/stage/
  done
done
