#!/bin/bash

cd trunk
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_RPATH=$PREFIX/lib \
      -D HDF5_INCLUDE_DIR=$PREFIX/include \
      -D HDF5_LIB_PATH=$PREFIX/lib \
      .

make
make install
make test

# hack so the old 1.4.6 .so still exists for old builds. Remove in next version...
if [ `uname` == Darwin ]; then
    ln -s $PREFIX/lib/libkea.1.4.7.dylib $PREFIX/lib/libkea.1.4.6.dylib
else
    ln -s $PREFIX/lib/libkea.so.1.4.7 $PREFIX/lib/libkea.so.1.4.6
fi
