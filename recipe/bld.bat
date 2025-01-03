@echo on

cmake %SRC_DIR% ^
    %CMAKE_ARGS% ^
    -G Ninja ^
    -B build ^
    -DBUILD_TESTING=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DFCL_STATIC_LIBRARY=OFF

if errorlevel 1 exit 1

cmake --build build --parallel --config Release
if errorlevel 1 exit 1

ctest --test-dir build --output-on-failure --build-config Release
if errorlevel 1 exit 1

cmake --build build --parallel --config Release --target install
if errorlevel 1 exit 1
