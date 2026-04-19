#!/usr/bin/env bash
# Builds the project against the GCC-compiled OpenCV.

set -e

CC="C:/msys64/ucrt64/bin/gcc.exe"
CXX="C:/msys64/ucrt64/bin/g++.exe"
OPENCV_INSTALL="C:/Users/USER/opencv/install_mingw"
OPENCV_BIN="C:/Users/USER/opencv/install_mingw/x64/mingw/bin"

cmake -S . -B build \
    -G "Ninja" \
    -DCMAKE_C_COMPILER="$CC" \
    -DCMAKE_CXX_COMPILER="$CXX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DOpenCV_DIR="$OPENCV_INSTALL"

cmake --build build

# Make OpenCV DLLs findable at runtime
export PATH="$OPENCV_BIN:$PATH"
echo ""
echo "Build done. Run:  PATH=\"$OPENCV_BIN:\$PATH\" ./build/opencv_app.exe"
