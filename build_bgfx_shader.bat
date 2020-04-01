SET BGFX_SRC=E:/tmp/proto-bgfx/bgfx.cmake/bgfx/src
SET BGFX_SHADERC_EXE=E:/tmp/proto-bgfx/bgfx.cmake/vs2019/Debug/shaderc.exe

call %BGFX_SHADERC_EXE% -f vs_instancing.sc -i %BGFX_SRC% -o Assets/vs_instancing.bin --platform windows --type vertex --profile vs_5_0 -O 3
call %BGFX_SHADERC_EXE% -f fs_instancing.sc -i %BGFX_SRC% -o Assets/fs_instancing.bin --platform windows --type fragment --profile ps_5_0 -O 3