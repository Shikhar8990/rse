# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/shelly/klee_home/klee

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shelly/klee_home/build

# Include any dependencies generated for this target.
include lib/Basic/CMakeFiles/kleeBasic.dir/depend.make

# Include the progress variables for this target.
include lib/Basic/CMakeFiles/kleeBasic.dir/progress.make

# Include the compile flags for this target's objects.
include lib/Basic/CMakeFiles/kleeBasic.dir/flags.make

lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o: lib/Basic/CMakeFiles/kleeBasic.dir/flags.make
lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o: /home/shelly/klee_home/klee/lib/Basic/CmdLineOptions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shelly/klee_home/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o -c /home/shelly/klee_home/klee/lib/Basic/CmdLineOptions.cpp

lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.i"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shelly/klee_home/klee/lib/Basic/CmdLineOptions.cpp > CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.i

lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.s"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shelly/klee_home/klee/lib/Basic/CmdLineOptions.cpp -o CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.s

lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.requires:

.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.requires

lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.provides: lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.requires
	$(MAKE) -f lib/Basic/CMakeFiles/kleeBasic.dir/build.make lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.provides.build
.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.provides

lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.provides.build: lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o


lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o: lib/Basic/CMakeFiles/kleeBasic.dir/flags.make
lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o: /home/shelly/klee_home/klee/lib/Basic/ConstructSolverChain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shelly/klee_home/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o -c /home/shelly/klee_home/klee/lib/Basic/ConstructSolverChain.cpp

lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.i"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shelly/klee_home/klee/lib/Basic/ConstructSolverChain.cpp > CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.i

lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.s"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shelly/klee_home/klee/lib/Basic/ConstructSolverChain.cpp -o CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.s

lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.requires:

.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.requires

lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.provides: lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.requires
	$(MAKE) -f lib/Basic/CMakeFiles/kleeBasic.dir/build.make lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.provides.build
.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.provides

lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.provides.build: lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o


lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o: lib/Basic/CMakeFiles/kleeBasic.dir/flags.make
lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o: /home/shelly/klee_home/klee/lib/Basic/KTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shelly/klee_home/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeBasic.dir/KTest.cpp.o -c /home/shelly/klee_home/klee/lib/Basic/KTest.cpp

lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeBasic.dir/KTest.cpp.i"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shelly/klee_home/klee/lib/Basic/KTest.cpp > CMakeFiles/kleeBasic.dir/KTest.cpp.i

lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeBasic.dir/KTest.cpp.s"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shelly/klee_home/klee/lib/Basic/KTest.cpp -o CMakeFiles/kleeBasic.dir/KTest.cpp.s

lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.requires:

.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.requires

lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.provides: lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.requires
	$(MAKE) -f lib/Basic/CMakeFiles/kleeBasic.dir/build.make lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.provides.build
.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.provides

lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.provides.build: lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o


lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o: lib/Basic/CMakeFiles/kleeBasic.dir/flags.make
lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o: /home/shelly/klee_home/klee/lib/Basic/Statistics.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shelly/klee_home/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeBasic.dir/Statistics.cpp.o -c /home/shelly/klee_home/klee/lib/Basic/Statistics.cpp

lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeBasic.dir/Statistics.cpp.i"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shelly/klee_home/klee/lib/Basic/Statistics.cpp > CMakeFiles/kleeBasic.dir/Statistics.cpp.i

lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeBasic.dir/Statistics.cpp.s"
	cd /home/shelly/klee_home/build/lib/Basic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shelly/klee_home/klee/lib/Basic/Statistics.cpp -o CMakeFiles/kleeBasic.dir/Statistics.cpp.s

lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.requires:

.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.requires

lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.provides: lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.requires
	$(MAKE) -f lib/Basic/CMakeFiles/kleeBasic.dir/build.make lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.provides.build
.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.provides

lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.provides.build: lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o


# Object files for target kleeBasic
kleeBasic_OBJECTS = \
"CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o" \
"CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o" \
"CMakeFiles/kleeBasic.dir/KTest.cpp.o" \
"CMakeFiles/kleeBasic.dir/Statistics.cpp.o"

# External object files for target kleeBasic
kleeBasic_EXTERNAL_OBJECTS =

lib/libkleeBasic.a: lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o
lib/libkleeBasic.a: lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o
lib/libkleeBasic.a: lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o
lib/libkleeBasic.a: lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o
lib/libkleeBasic.a: lib/Basic/CMakeFiles/kleeBasic.dir/build.make
lib/libkleeBasic.a: lib/Basic/CMakeFiles/kleeBasic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/shelly/klee_home/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library ../libkleeBasic.a"
	cd /home/shelly/klee_home/build/lib/Basic && $(CMAKE_COMMAND) -P CMakeFiles/kleeBasic.dir/cmake_clean_target.cmake
	cd /home/shelly/klee_home/build/lib/Basic && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kleeBasic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/Basic/CMakeFiles/kleeBasic.dir/build: lib/libkleeBasic.a

.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/build

lib/Basic/CMakeFiles/kleeBasic.dir/requires: lib/Basic/CMakeFiles/kleeBasic.dir/CmdLineOptions.cpp.o.requires
lib/Basic/CMakeFiles/kleeBasic.dir/requires: lib/Basic/CMakeFiles/kleeBasic.dir/ConstructSolverChain.cpp.o.requires
lib/Basic/CMakeFiles/kleeBasic.dir/requires: lib/Basic/CMakeFiles/kleeBasic.dir/KTest.cpp.o.requires
lib/Basic/CMakeFiles/kleeBasic.dir/requires: lib/Basic/CMakeFiles/kleeBasic.dir/Statistics.cpp.o.requires

.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/requires

lib/Basic/CMakeFiles/kleeBasic.dir/clean:
	cd /home/shelly/klee_home/build/lib/Basic && $(CMAKE_COMMAND) -P CMakeFiles/kleeBasic.dir/cmake_clean.cmake
.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/clean

lib/Basic/CMakeFiles/kleeBasic.dir/depend:
	cd /home/shelly/klee_home/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shelly/klee_home/klee /home/shelly/klee_home/klee/lib/Basic /home/shelly/klee_home/build /home/shelly/klee_home/build/lib/Basic /home/shelly/klee_home/build/lib/Basic/CMakeFiles/kleeBasic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Basic/CMakeFiles/kleeBasic.dir/depend

