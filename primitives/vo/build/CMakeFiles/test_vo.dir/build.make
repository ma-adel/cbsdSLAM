# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/adel/workspace/slam/primitives/vo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adel/workspace/slam/primitives/vo/build

# Include any dependencies generated for this target.
include CMakeFiles/test_vo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_vo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_vo.dir/flags.make

CMakeFiles/test_vo.dir/tests/testvo.cpp.o: CMakeFiles/test_vo.dir/flags.make
CMakeFiles/test_vo.dir/tests/testvo.cpp.o: ../tests/testvo.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adel/workspace/slam/primitives/vo/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test_vo.dir/tests/testvo.cpp.o"
	/usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_vo.dir/tests/testvo.cpp.o -c /home/adel/workspace/slam/primitives/vo/tests/testvo.cpp

CMakeFiles/test_vo.dir/tests/testvo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_vo.dir/tests/testvo.cpp.i"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/adel/workspace/slam/primitives/vo/tests/testvo.cpp > CMakeFiles/test_vo.dir/tests/testvo.cpp.i

CMakeFiles/test_vo.dir/tests/testvo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_vo.dir/tests/testvo.cpp.s"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/adel/workspace/slam/primitives/vo/tests/testvo.cpp -o CMakeFiles/test_vo.dir/tests/testvo.cpp.s

CMakeFiles/test_vo.dir/tests/testvo.cpp.o.requires:
.PHONY : CMakeFiles/test_vo.dir/tests/testvo.cpp.o.requires

CMakeFiles/test_vo.dir/tests/testvo.cpp.o.provides: CMakeFiles/test_vo.dir/tests/testvo.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_vo.dir/build.make CMakeFiles/test_vo.dir/tests/testvo.cpp.o.provides.build
.PHONY : CMakeFiles/test_vo.dir/tests/testvo.cpp.o.provides

CMakeFiles/test_vo.dir/tests/testvo.cpp.o.provides.build: CMakeFiles/test_vo.dir/tests/testvo.cpp.o

CMakeFiles/test_vo.dir/src/vo_utils.cpp.o: CMakeFiles/test_vo.dir/flags.make
CMakeFiles/test_vo.dir/src/vo_utils.cpp.o: ../src/vo_utils.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adel/workspace/slam/primitives/vo/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test_vo.dir/src/vo_utils.cpp.o"
	/usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_vo.dir/src/vo_utils.cpp.o -c /home/adel/workspace/slam/primitives/vo/src/vo_utils.cpp

CMakeFiles/test_vo.dir/src/vo_utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_vo.dir/src/vo_utils.cpp.i"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/adel/workspace/slam/primitives/vo/src/vo_utils.cpp > CMakeFiles/test_vo.dir/src/vo_utils.cpp.i

CMakeFiles/test_vo.dir/src/vo_utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_vo.dir/src/vo_utils.cpp.s"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/adel/workspace/slam/primitives/vo/src/vo_utils.cpp -o CMakeFiles/test_vo.dir/src/vo_utils.cpp.s

CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.requires:
.PHONY : CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.requires

CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.provides: CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_vo.dir/build.make CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.provides.build
.PHONY : CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.provides

CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.provides.build: CMakeFiles/test_vo.dir/src/vo_utils.cpp.o

CMakeFiles/test_vo.dir/src/framematcher.cpp.o: CMakeFiles/test_vo.dir/flags.make
CMakeFiles/test_vo.dir/src/framematcher.cpp.o: ../src/framematcher.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adel/workspace/slam/primitives/vo/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test_vo.dir/src/framematcher.cpp.o"
	/usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_vo.dir/src/framematcher.cpp.o -c /home/adel/workspace/slam/primitives/vo/src/framematcher.cpp

CMakeFiles/test_vo.dir/src/framematcher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_vo.dir/src/framematcher.cpp.i"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/adel/workspace/slam/primitives/vo/src/framematcher.cpp > CMakeFiles/test_vo.dir/src/framematcher.cpp.i

CMakeFiles/test_vo.dir/src/framematcher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_vo.dir/src/framematcher.cpp.s"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/adel/workspace/slam/primitives/vo/src/framematcher.cpp -o CMakeFiles/test_vo.dir/src/framematcher.cpp.s

CMakeFiles/test_vo.dir/src/framematcher.cpp.o.requires:
.PHONY : CMakeFiles/test_vo.dir/src/framematcher.cpp.o.requires

CMakeFiles/test_vo.dir/src/framematcher.cpp.o.provides: CMakeFiles/test_vo.dir/src/framematcher.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_vo.dir/build.make CMakeFiles/test_vo.dir/src/framematcher.cpp.o.provides.build
.PHONY : CMakeFiles/test_vo.dir/src/framematcher.cpp.o.provides

CMakeFiles/test_vo.dir/src/framematcher.cpp.o.provides.build: CMakeFiles/test_vo.dir/src/framematcher.cpp.o

CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o: CMakeFiles/test_vo.dir/flags.make
CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o: ../src/vocoordinator.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adel/workspace/slam/primitives/vo/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o"
	/usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o -c /home/adel/workspace/slam/primitives/vo/src/vocoordinator.cpp

CMakeFiles/test_vo.dir/src/vocoordinator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_vo.dir/src/vocoordinator.cpp.i"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/adel/workspace/slam/primitives/vo/src/vocoordinator.cpp > CMakeFiles/test_vo.dir/src/vocoordinator.cpp.i

CMakeFiles/test_vo.dir/src/vocoordinator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_vo.dir/src/vocoordinator.cpp.s"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/adel/workspace/slam/primitives/vo/src/vocoordinator.cpp -o CMakeFiles/test_vo.dir/src/vocoordinator.cpp.s

CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.requires:
.PHONY : CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.requires

CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.provides: CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_vo.dir/build.make CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.provides.build
.PHONY : CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.provides

CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.provides.build: CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o

# Object files for target test_vo
test_vo_OBJECTS = \
"CMakeFiles/test_vo.dir/tests/testvo.cpp.o" \
"CMakeFiles/test_vo.dir/src/vo_utils.cpp.o" \
"CMakeFiles/test_vo.dir/src/framematcher.cpp.o" \
"CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o"

# External object files for target test_vo
test_vo_EXTERNAL_OBJECTS =

test_vo: CMakeFiles/test_vo.dir/tests/testvo.cpp.o
test_vo: CMakeFiles/test_vo.dir/src/vo_utils.cpp.o
test_vo: CMakeFiles/test_vo.dir/src/framematcher.cpp.o
test_vo: CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o
test_vo: CMakeFiles/test_vo.dir/build.make
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_calib3d.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_core.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_features2d.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_flann.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_highgui.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_imgcodecs.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_imgproc.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_ml.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_objdetect.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_photo.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_shape.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_stitching.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_superres.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_video.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_videoio.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_videostab.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_viz.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_aruco.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_bgsegm.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_bioinspired.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_ccalib.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_datasets.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_dnn.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_dpm.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_face.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_freetype.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_fuzzy.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_line_descriptor.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_optflow.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_phase_unwrapping.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_plot.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_reg.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_rgbd.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_saliency.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_sfm.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_stereo.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_structured_light.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_surface_matching.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_text.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_tracking.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_xfeatures2d.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_ximgproc.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_xobjdetect.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_xphoto.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_photo.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_shape.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_calib3d.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_viz.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_phase_unwrapping.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_video.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_datasets.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_dnn.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_plot.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_text.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_features2d.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_flann.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_highgui.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_ml.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_videoio.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_imgcodecs.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_objdetect.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_imgproc.so.3.2.0
test_vo: /home/adel/workspace/external/opencv3/opencv/release/lib/libopencv_core.so.3.2.0
test_vo: CMakeFiles/test_vo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test_vo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_vo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_vo.dir/build: test_vo
.PHONY : CMakeFiles/test_vo.dir/build

CMakeFiles/test_vo.dir/requires: CMakeFiles/test_vo.dir/tests/testvo.cpp.o.requires
CMakeFiles/test_vo.dir/requires: CMakeFiles/test_vo.dir/src/vo_utils.cpp.o.requires
CMakeFiles/test_vo.dir/requires: CMakeFiles/test_vo.dir/src/framematcher.cpp.o.requires
CMakeFiles/test_vo.dir/requires: CMakeFiles/test_vo.dir/src/vocoordinator.cpp.o.requires
.PHONY : CMakeFiles/test_vo.dir/requires

CMakeFiles/test_vo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_vo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_vo.dir/clean

CMakeFiles/test_vo.dir/depend:
	cd /home/adel/workspace/slam/primitives/vo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adel/workspace/slam/primitives/vo /home/adel/workspace/slam/primitives/vo /home/adel/workspace/slam/primitives/vo/build /home/adel/workspace/slam/primitives/vo/build /home/adel/workspace/slam/primitives/vo/build/CMakeFiles/test_vo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_vo.dir/depend

