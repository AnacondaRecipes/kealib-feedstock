#!/bin/bash

mkdir build && cd build
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_RPATH=$PREFIX/lib \
      -D HDF5_INCLUDE_DIR=$PREFIX/include \
      -D HDF5_LIB_PATH=$PREFIX/lib \
      ..

make -j${CPU_COUNT}
make install

if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make test
fi

