cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)
project(vicon-datastream-sdk
	VERSION 1.10.20200407.123216 #same as Vicon SDK
)

#useful for debugging
#SET(CMAKE_VERBOSE_MAKEFILE ON)

#Vicon SDK file gcc.mk defines this as minimum required version
set (CMAKE_CXX_STANDARD_REQUIRED 14)

SET (LIB_TYPE SHARED) #SHARED / STATIC

if(${LIB_TYPE} STREQUAL SHARED)
	set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
	set(THREADS_PREFER_PTHREAD_FLAG TRUE)
	find_package(Threads REQUIRED)
endif()

SET (VICON_ROOT "${CMAKE_SOURCE_DIR}/../current_Vicon_source/Vicon/CrossMarket")
SET (DataStream_ROOT "${VICON_ROOT}/DataStream")
SET (BOOST "${CMAKE_SOURCE_DIR}/../../Boost/target/Linux64")
SET (VICON_STRING_TEST "${CMAKE_SOURCE_DIR}/..")

# Declare a cpp library
add_library(ViconDataStreamSDK_CPP ${LIB_TYPE} ""
)

file(GLOB_RECURSE VICON_SRC FOLLOW_SYMLINKS ${VICON_ROOT} "${VICON_ROOT}/*.cpp")

file(GLOB_RECURSE VICON_H FOLLOW_SYMLINKS ${VICON_ROOT} "${VICON_ROOT}/*.h")

target_include_directories(ViconDataStreamSDK_CPP PRIVATE
	${BOOST}/include
	${VICON_ROOT}
	${DataStream_ROOT}
	${DataStream_ROOT}/ViconDataStreamSDK_CPP
	${VICON_STRING_TEST}
)

target_sources(ViconDataStreamSDK_CPP
	PUBLIC
		${DataStream_ROOT}/ViconDataStreamSDK_CPP/IDataStreamClientBase.h
		${DataStream_ROOT}/ViconDataStreamSDK_CPP/DataStreamClient.h
		${DataStream_ROOT}/ViconDataStreamSDK_CPP/DataStreamRetimingClient.h
		${VICON_STRING_TEST}/ViconStringTest.h
	PRIVATE
		${VICON_H}
		${VICON_SRC}
		${VICON_STRING_TEST}/ViconStringTest.cpp
)

if(${LIB_TYPE} STREQUAL SHARED)
	target_link_libraries(ViconDataStreamSDK_CPP
		PRIVATE Threads::Threads
		PRIVATE "${BOOST}/libboost.so"
		-Wl,--as-needed
		-Wl,--no-undefined
		-Wl,--no-allow-shlib-undefined
	)
endif()

if (CMAKE_COMPILER_IS_GNUCXX AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.5.0)
    message(FATAL_ERROR "Not tested with gcc version lower than gcc-7.5.0. Change CMakeLists.txt if you can assure a lower version works!")
endif()

if(CMAKE_COMPILER_IS_GNUCXX)
	#taken from Vicon SDK file gcc.mk
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-sign-compare -Wno-unknown-pragmas -Wno-parentheses -Winvalid-pch -Wno-unused-variable -Wno-reorder -Wno-unused-but-set-variable -Wno-unused-function -Wno-deprecated-declarations -Wno-attributes")

	## More Platform independend than -flto
	#include(CheckIPOSupported)
	#check_ipo_supported() # fatal error if IPO is not supported
	#set_property(TARGET ViconDataStreamSDK_CPP PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)

	target_compile_options(ViconDataStreamSDK_CPP PRIVATE
		## Own Options
		-fPIC
		-std=c++14
		-flto
		## Taken from Vicon SDK file gcc.mk
		-m64 #x86_64
		-mfpmath=sse
		#-msse2
		## Unsafe optimization. Comment out if problems occur.
		-mavx2
		-funroll-loops
		-Ofast
	)

	if(UNIX AND (${LIB_TYPE} STREQUAL SHARED))
		#possible error source: this sets .so RUNPATH, not RPATH.
		#RUNPATH is possibly used after LD_LIBRARY_PATH system variable.
		set_target_properties(ViconDataStreamSDK_CPP PROPERTIES
			BUILD_WITH_INSTALL_RPATH TRUE
			INSTALL_RPATH "$ORIGIN/."
		)
	endif()
endif()

