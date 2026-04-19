#!/usr/bin/env bash
# Builds OpenCV from source using MSYS2 UCRT64 (GCC + Ninja).
# Run once from any MSYS2/Git-Bash terminal:  bash build_opencv.sh

set -e

OPENCV_SRC="C:/Users/USER/opencv/sources"
OPENCV_BUILD="C:/Users/USER/opencv/build_mingw"
OPENCV_INSTALL="C:/Users/USER/opencv/install_mingw"

CC="C:/msys64/ucrt64/bin/gcc.exe"
CXX="C:/msys64/ucrt64/bin/g++.exe"

echo "==> Configuring OpenCV..."
cmake -S "$OPENCV_SRC" -B "$OPENCV_BUILD" \
    -G "Ninja" \
    -DCMAKE_C_COMPILER="$CC" \
    -DCMAKE_CXX_COMPILER="$CXX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$OPENCV_INSTALL" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_DOCS=OFF \
    -DWITH_CUDA=OFF \
    -DWITH_LAPACK=OFF \
    -DWITH_OPENBLAS=OFF

echo "==> Building OpenCV (this takes several minutes)..."
cmake --build "$OPENCV_BUILD" --config Release --parallel

echo "==> Installing OpenCV to $OPENCV_INSTALL..."
cmake --install "$OPENCV_BUILD"

echo ""
echo "Done. Now run:  bash build.sh"
