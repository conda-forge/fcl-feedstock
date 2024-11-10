#!/bin/sh

mkdir build && cd build

if [ "${target_platform}" == "osx-arm64" ] || [ "${target_platform}" == "linux-aarch64" ] || [ "${target_platform}" == "linux-ppc64le" ]; then
	USE_SSE="OFF"
else
	USE_SSE="ON"
fi

cmake $SRC_DIR \
	${CMAKE_ARGS} \
	-G Ninja \
	-B build \
	-DBUILD_TESTING=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DFCL_USE_X64_SSE=$USE_SSE

cmake --build build --parallel

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
	ctest --test-dir build --output-on-failure
fi

cmake --build build --parallel --target install
