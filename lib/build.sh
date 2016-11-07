#!/bin/bash

cd /tmp/output || exit $?
rm -rf *
cmake -D WITH_PYTHON_INSTALL=OFF -D WITH_PLAYER=OFF -D WITH_PYTHON_MODULE=ON -D PYTHON_VERSION=3.4 -D CMAKE_C_FLAGS=-w -D CMAKE_CXX_FLAGS=-w -D WITH_INTERNATIONAL=OFF -D WITH_BOOST=OFF ../blender || exit $?
exec make -j16 install
