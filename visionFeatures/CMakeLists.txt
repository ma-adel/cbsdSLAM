cmake_minimum_required(VERSION 2.8.3)
project(vision_features_slam)

# Set to false if default version of opencv is required
# default version is 2.4.8 shipped with ROS
# Otherwise opencv 3.2.0 is used.
set(USE_OPENCV3 0)
add_definitions( -DUSE_OPENCV3=${USE_OPENCV3} )

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


enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

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

# if opencv less than 3
if(NOT ${USE_OPENCV3})
set(aruco_DIR /home/adel/workspace/external/aruco-2.0.19/build/)
find_package(aruco REQUIRED)
include_directories(
  ${aruco_INCLUDE_DIRS}
)
endif()


## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${OpenCV_INCLUDE_DIRS}
  "/usr/include/eigen3/"
)

include_directories(src include)

file(GLOB SOURCES src/*.cpp)
file(GLOB TESTS tests/*.cpp)

add_executable(test_vision_features tests/testVisionFeatures.cpp  ${SOURCES})
target_link_libraries(test_vision_features  ${MRPT_LIBS} ${OpenCV_LIBS}   )

add_executable(unitTests  tests/unittest.cpp ${SOURCES})
target_link_libraries(unitTests ${GTEST_LIBRARIES} pthread ${MRPT_LIBS} ${OpenCV_LIBS} ${aruco_LIBS} )


# if opencv < 3
if(NOT ${USE_OPENCV3})
target_link_libraries(test_vision_features ${aruco_LIBS}  )
endif()
