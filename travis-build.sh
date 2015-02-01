#!/bin/bash

# Travis only needs to build the latest
./bin/build-play24.sh

mv *.tar.gz builds/
