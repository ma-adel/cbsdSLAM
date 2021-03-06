cmake_minimum_required(VERSION 2.8.3)
project(depth_features_slam)

# Set to false if default version of opencv is required
# default version is 2.4.8 shipped with ROS
# Otherwise opencv 3.2.0 is used.
set(USE_OPENCV3 1)
add_definitions( -DUSE_OPENCV3=${USE_OPENCV3})

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
   add_definitions(-DCOMPILEDWITHC11)
   message(STATUS "Using flag -std=c++11.")
elseif(COMPILER_SUPPORTS_CXX0X)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
   add_definitions(-DCOMPILEDWITHC0X)
   message(STATUS "Using flag -std=c++0x.")
else()
   message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

## Add support for C++11, supported in ROS Kinetic and newer
# add_definitions(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages

if(${USE_OPENCV3})
set(OpenCV_DIR "/home/adel/workspace/external/opencv3/opencv/release/")
endif()
find_package(OpenCV REQUIRED)

find_package(MRPT REQUIRED base;bayes;obs;gui;slam;vision;topography)
find_package(Eigen3 REQUIRED)
set(FLIRT_DIR /home/adel/workspace/external/flirtlib/build/)
find_package(FLIRT REQUIRED)


## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${OpenCV_INCLUDE_DIRS}
  "/usr/include/eigen3/"
${FLIRT_INCLUDE_DIRS}
)


include_directories(src include)	

file(GLOB SOURCES src/*.cpp)
file(GLOB TESTS tests/*.cpp)

add_executable(test_depth_features  ${TESTS} ${SOURCES})
target_link_libraries(test_depth_features  ${MRPT_LIBS} ${OpenCV_LIBS} ${FLIRT_LIBRARIES}  )



