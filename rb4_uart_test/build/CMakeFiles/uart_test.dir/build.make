# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/morten/workspace/rb4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/morten/workspace/rb4/build

# Include any dependencies generated for this target.
include CMakeFiles/uart_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/uart_test.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/uart_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/uart_test.dir/flags.make

CMakeFiles/uart_test.dir/main.cpp.o: CMakeFiles/uart_test.dir/flags.make
CMakeFiles/uart_test.dir/main.cpp.o: ../main.cpp
CMakeFiles/uart_test.dir/main.cpp.o: CMakeFiles/uart_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/morten/workspace/rb4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/uart_test.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/uart_test.dir/main.cpp.o -MF CMakeFiles/uart_test.dir/main.cpp.o.d -o CMakeFiles/uart_test.dir/main.cpp.o -c /home/morten/workspace/rb4/main.cpp

CMakeFiles/uart_test.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uart_test.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/morten/workspace/rb4/main.cpp > CMakeFiles/uart_test.dir/main.cpp.i

CMakeFiles/uart_test.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uart_test.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/morten/workspace/rb4/main.cpp -o CMakeFiles/uart_test.dir/main.cpp.s

CMakeFiles/uart_test.dir/uart_test.cpp.o: CMakeFiles/uart_test.dir/flags.make
CMakeFiles/uart_test.dir/uart_test.cpp.o: ../uart_test.cpp
CMakeFiles/uart_test.dir/uart_test.cpp.o: CMakeFiles/uart_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/morten/workspace/rb4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/uart_test.dir/uart_test.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/uart_test.dir/uart_test.cpp.o -MF CMakeFiles/uart_test.dir/uart_test.cpp.o.d -o CMakeFiles/uart_test.dir/uart_test.cpp.o -c /home/morten/workspace/rb4/uart_test.cpp

CMakeFiles/uart_test.dir/uart_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uart_test.dir/uart_test.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/morten/workspace/rb4/uart_test.cpp > CMakeFiles/uart_test.dir/uart_test.cpp.i

CMakeFiles/uart_test.dir/uart_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uart_test.dir/uart_test.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/morten/workspace/rb4/uart_test.cpp -o CMakeFiles/uart_test.dir/uart_test.cpp.s

# Object files for target uart_test
uart_test_OBJECTS = \
"CMakeFiles/uart_test.dir/main.cpp.o" \
"CMakeFiles/uart_test.dir/uart_test.cpp.o"

# External object files for target uart_test
uart_test_EXTERNAL_OBJECTS =

uart_test: CMakeFiles/uart_test.dir/main.cpp.o
uart_test: CMakeFiles/uart_test.dir/uart_test.cpp.o
uart_test: CMakeFiles/uart_test.dir/build.make
uart_test: CMakeFiles/uart_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/morten/workspace/rb4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable uart_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/uart_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/uart_test.dir/build: uart_test
.PHONY : CMakeFiles/uart_test.dir/build

CMakeFiles/uart_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/uart_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/uart_test.dir/clean

CMakeFiles/uart_test.dir/depend:
	cd /home/morten/workspace/rb4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/morten/workspace/rb4 /home/morten/workspace/rb4 /home/morten/workspace/rb4/build /home/morten/workspace/rb4/build /home/morten/workspace/rb4/build/CMakeFiles/uart_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/uart_test.dir/depend

