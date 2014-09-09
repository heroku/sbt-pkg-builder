#!/bin/bash

./bin/build-play23.sh

SCALA_VERSIONS="2.9 2.10 2.11"
for SCALA_VERSION in $SCALA_VERSIONS; do
  PLAY_VERSIONS="2.0 2.1 2.2 2.3"
  for PLAY_VERSION in $PLAY_VERSIONS; do
    CACHE_FILE="sbt-cache-play_${PLAY_VERSION}_${SCALA_VERSION}.tar.gz"
    if [ -f $CACHE_FILE ]; then
      echo "Uploading $CACHE_FILE..."
      s3cmd put --acl-public \
        --access_key="$AWS_ACCESS_KEY" \
        --secret_key="$AWS_SECRET_KEY" \
        $CACHE_FILE \
        s3://lang-jvm.s3.amazonaws.com/sbt/stage/
    fi
  done
done
