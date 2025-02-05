#!/bin/bash

mkdir -p build
cd build

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D CMAKE_INSTALL_RPATH=$PREFIX/lib \
      -D HDF5_INCLUDE_DIR=$PREFIX/include \
      -D HDF5_LIB_PATH=$PREFIX/lib \
      -D HDF5_ROOT=$PREFIX \
      ..

make -j${CPU_COUNT}
make install

make test

