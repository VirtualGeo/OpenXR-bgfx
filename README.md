# OpenXR-bgfx
Base on https://github.com/microsoft/OpenXR-MixedReality<br>
This example require an Hololens 2 device or the emulator

# Build
To deploy on Hololens 2 device you need to target arm64_uwp

> mkdir build/arm64_uwp<br>
> cd build/arm64_uwp<br>
> cmake ../.. -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 -A arm64<br>

For the emulator target x64_uwp

> mkdir build/x64_uwp<br>
> cd build/x64_uwp<br>
> cmake ../.. -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0<br>

# Dependencies

To render with BGFX you need a modified version available in the proto-hololens branch in the https://github.com/VirtualGeo/bgfx repository

> git clone --recurse-submodules https://github.com/VirtualGeo/bgfx.cmake<br>
> cd bgfx.cmake/bgfx<br>
> git checkout proto-hololens<br>

Back to the bgfx.cmake directory and generate solution.<br>
To deploy on the hololens device :

> mkdir build/arm64_uwp<br>
> cd build/arm64_uwp<br>
> cmake ../.. -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 -DBGFX_BUILD_EXAMPLES=OFF -DBGFX_BUILD_TOOLS=OFF -DCMAKE_INSTALL_PREFIX=../../bgfx-install/arm64_uwp -A arm64<br>
> cmake --build .<br>
> cmake --install ../../bgfx-install/arm64_uwp<br>


To deploy on the hololens emulator :

> mkdir build/x64_uwp<br>
> cd build/x64_uwp<br>
> cmake ../.. -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 -DBGFX_BUILD_EXAMPLES=OFF -DBGFX_BUILD_TOOLS=OFF -DCMAKE_INSTALL_PREFIX=../../bgfx-install/x64_uwp<br>
> cmake --build .<br>
> cmake --install ../../bgfx-install/x64_uwp<br>
