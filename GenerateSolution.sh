#!/bin/sh
mkdir build
mkdir build/x64_uwp
cd build/x64_uwp
cmake ../.. -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0

cd ../..

mkdir build/arm64_uwp
cd build/arm64_uwp
cmake ../.. -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 -A arm64