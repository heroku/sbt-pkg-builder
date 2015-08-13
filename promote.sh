#!/bin/bash

set -e

SRC=${1:?}
DEST=${2:?}
FORCE=${3:-"false"}

TARBALLS="sbt-cache-base sbt-cache-play-2.0_2.9 sbt-cache-play-2.1_2.10 sbt-cache-play-2.2_2.10 sbt-cache-play-2.3_2.10 sbt-cache-play-2.3_2.11 sbt-cache-play-2.4_2.10 sbt-cache-play-2.4_2.11"
for TARBALL in $TARBALLS; do
  if [ -n "$(aws s3 ls s3://lang-jvm/sbt/${SRC}/${TARBALL}.tar.gz --profile lang-jvm)" ]; then
    if [ "$FORCE" == "true" ] || [ -z "$(aws s3 ls s3://lang-jvm/sbt/${DEST}/${TARBALL}.tar.gz --profile lang-jvm)" ]; then
      aws s3 cp s3://lang-jvm/sbt/${SRC}/${TARBALL}.tar.gz s3://lang-jvm/sbt/${DEST}/${TARBALL}.tar.gz --profile lang-jvm --acl public-read
    else
      echo "Skipping $TARBALL. Already exists."
    fi
  fi
done
