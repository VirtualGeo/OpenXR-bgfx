cmake_minimum_required(VERSION 3.10)
project(OpenXR-bgfx)

# detect target with CMAKE variable (not sure it's a robust method) (x86/x64/arm/arm64)
if("${CMAKE_GENERATOR_PLATFORM}" STREQUAL "")
	set(PLATFORM_TARGET "${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}")
else()
	set(PLATFORM_TARGET "${CMAKE_GENERATOR_PLATFORM}")
endif()

message(STATUS "PLATFORM_TARGET = ${PLATFORM_TARGET}")

set(APP_MANIFEST_NAME Package.appxmanifest)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Generate manifest
set(EXE_NAME ${PROJECT_NAME})
set(SHORT_NAME ${EXE_NAME})
set(PACKAGE_GUID "6514377e-dfd4-4cdb-80df-4e0366346efc")
if("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsStore")
	configure_file(
		cmake/Package_vc14.store.appxmanifest.in
			${CMAKE_CURRENT_BINARY_DIR}/${APP_MANIFEST_NAME}
			@ONLY)
endif()

# Source
file(GLOB SOURCE_FILES "*.cpp")
file(GLOB HEADER_FILES "*.h")

# Content to publish
set(CONTENT_FILES "")
set(DEBUG_CONTENT_FILES "")
set(RELEASE_CONTENT_FILES "")
if("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsStore")
	set(CONTENT_FILES ${CONTENT_FILES}
		${CMAKE_CURRENT_BINARY_DIR}/${APP_MANIFEST_NAME}
	)
	file(GLOB ASSET_FILES "Assets/*")
endif()

# Libs to link with
SET(LIBS )
SET(DEBUG_LIBS )
SET(RELEASE_LIBS )

# Window/Dx deps
list(APPEND LIBS d3d11.lib dxgi.lib WindowsApp.lib OneCore.lib)
#set(LIBS ${LIBS} d3d11.lib dxgi.lib WindowsApp.lib OneCore.lib)

include(cmake/OpenXR_CMakeImport.cmake)
include(cmake/bgfx_CMakeImport.cmake)

# Configure solution
set(RESOURCE_FILES ${CONTENT_FILES} ${DEBUG_CONTENT_FILES} ${RELEASE_CONTENT_FILES} ${ASSET_FILES} TemporaryKey.pfx)

set_property(SOURCE ${CONTENT_FILES} PROPERTY VS_DEPLOYMENT_CONTENT 1)
set_property(SOURCE ${ASSET_FILES} PROPERTY VS_DEPLOYMENT_CONTENT 1)
set_property(SOURCE ${ASSET_FILES} PROPERTY VS_DEPLOYMENT_LOCATION "Assets")
set_property(SOURCE ${DEBUG_CONTENT_FILES} PROPERTY VS_DEPLOYMENT_CONTENT $<CONFIG:Debug>)
set_property(SOURCE ${RELEASE_CONTENT_FILES} PROPERTY VS_DEPLOYMENT_CONTENT $<CONFIG:Release>)

source_group("Source Files" FILES ${SOURCE_FILES})
source_group("Header Files" FILES ${HEADER_FILES})
source_group("Resource Files" FILES ${RESOURCE_FILES})

add_executable(${EXE_NAME} WIN32 ${SOURCE_FILES} ${HEADER_FILES} ${RESOURCE_FILES})
set_property(TARGET ${EXE_NAME} PROPERTY VS_WINRT_COMPONENT TRUE)


target_link_libraries(${EXE_NAME} PUBLIC ${LIBS} )

foreach(LIB ${DEBUG_LIBS})
	target_link_libraries(${EXE_NAME} PUBLIC $<$<CONFIG:Debug>:${LIB}>)
endforeach()

foreach(LIB ${RELEASE_LIBS})
	target_link_libraries(${EXE_NAME} PUBLIC $<$<CONFIG:Release>:${LIB}>)
endforeach()

set_property(TARGET ${EXE_NAME} PROPERTY CXX_STANDARD 17)
