#!/bin/bash
set -e
cd /tmp/output
rm -rf *
cmake -D WITH_PYTHON_INSTALL=OFF -D WITH_PLAYER=OFF -D WITH_PYTHON_MODULE=ON -D PYTHON_VERSION=3.5 -D CMAKE_C_FLAGS=-w -D CMAKE_CXX_FLAGS=-w -D WITH_INTERNATIONAL=OFF ../blender
exec make -j16 install
