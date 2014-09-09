#!/bin/bash

# Travis only needs to build the latest
./bin/build-play23.sh

mkdir -p builds

mv *.tar.gz builds
