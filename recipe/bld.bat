mkdir build && cd build

cmake -G "Ninja"^
    -DCMAKE_BUILD_TYPE=Release^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%^
    -DCMAKE_INSTALL_LIBDIR=lib^
    %SRC_DIR%

if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
