#!/bin/bash
set -e
mkdir -p output
docker run -v $(pwd)/output:/tmp/output -v $(pwd)/lib:/tmp/lib blender-build-env /tmp/lib/build.sh
