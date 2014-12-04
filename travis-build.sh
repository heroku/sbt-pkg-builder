#!/bin/bash

# Travis only needs to build the latest
./bin/build-play23.sh

mv *.tar.gz builds/
