#!/bin/bash
set -e
docker run -v $(pwd)/output:/tmp/output -v $(pwd)/google:/tmp/google -v $(pwd)/lib:/tmp/lib blender-build-env /tmp/lib/export-archive.sh
