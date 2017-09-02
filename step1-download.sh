#!/bin/bash
set -e
build_env=$(docker images -q blender-build-env)
docker build -t blender-build-env env
