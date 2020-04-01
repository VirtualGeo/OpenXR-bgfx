include_directories(openxr_preview/include)
SET(OPENXR_ROOT_DIR "packages/OpenXR.Loader.1.0.6.2")
if("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsStore")
	set(OPENXR_LIB_DIR "${OPENXR_ROOT_DIR}/native/${PLATFORM_TARGET}_uwp/release")
else()
	set(OPENXR_LIB_DIR "${OPENXR_ROOT_DIR}/native/${PLATFORM_TARGET}/release")
endif()
link_directories(${OPENXR_LIB_DIR}/lib)
set(OPENXR_LIB openxr_loader.lib)
set(CONTENT_FILES ${CONTENT_FILES} ${OPENXR_LIB_DIR}/bin/openxr_loader.dll)


#set(LIBS ${LIBS} ${OPENXR_LIB})
list(APPEND LIBS ${OPENXR_LIB})