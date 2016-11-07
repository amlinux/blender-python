#!/bin/bash

build_env=$(docker images -q blender-build-env)
if [ -z "$build_env" ] ; then
    docker build -t blender-build-env env || exit $?
fi

mkdir -p output
docker run -v $(pwd)/output:/tmp/output -v $(pwd)/lib:/tmp/lib blender-build-env /tmp/lib/build.sh &&
docker build -t blender .
