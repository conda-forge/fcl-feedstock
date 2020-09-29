#!/bin/sh

mkdir build && cd build

if [ "${target_platform}" == "linux-aarch64" ] || [ "${target_platform}" == "linux-ppc64le" ]; then
	$USE_SSE="-DFCL_USE_X64_SSE=OFF"
fi

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_LIBDIR=lib \
	  $USE_SSE \
      $SRC_DIR

make -j${CPU_COUNT}
make install
