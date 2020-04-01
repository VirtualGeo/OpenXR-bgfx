set(BGFX_INSTALL_DIR "E:/tmp/proto-bgfx/bgfx.cmake/bgfx-install")
add_definitions(-DUSE_BGFX)


if("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsStore")
    set(BGFX_ROOT_DIR ${BGFX_INSTALL_DIR}/${PLATFORM_TARGET}_uwp)
else()
    set(BGFX_ROOT_DIR ${BGFX_INSTALL_DIR}/${PLATFORM_TARGET})
endif()

include_directories(${BGFX_ROOT_DIR}/include ${BGFX_ROOT_DIR}/include/compat/msvc)
set(BGFX_LIB_DIR ${BGFX_ROOT_DIR}/lib)
link_directories(${BGFX_LIB_DIR})


#set(LIBS ${LIBS})
#set(DEBUG_LIBS ${DEBUG_LIBS} bgfxd.lib bxd.lib bimgd.lib astc-codecd.lib)
#set(RELEASE_LIBS ${RELEASE_LIBS} bgfx.lib bx.lib bimg.lib astc-codec.lib)

list(APPEND DEBUG_LIBS bgfxd.lib bxd.lib bimgd.lib astc-codecd.lib)
list(APPEND RELEASE_LIBS bgfx.lib bx.lib bimg.lib astc-codec.lib)