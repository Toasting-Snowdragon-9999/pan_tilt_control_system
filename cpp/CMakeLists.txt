cmake_minimum_required(VERSION 3.10)

# Project name
project(pan_tilt)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(include)


# pan tilt executable sources
set(SOURCES
    src/main.cpp
)

# Add executables
add_executable(pan_tilt ${SOURCES})



