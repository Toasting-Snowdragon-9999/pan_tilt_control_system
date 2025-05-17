
cmake_minimum_required(VERSION 3.10)

if(POLICY CMP0146)
    cmake_policy(SET CMP0146 OLD)
endif()

# Project name
project(vision_project)

include_directories(include)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Enable CUDA for OpenCV
set(OpenCV_DIR /usr/local/share/opencv4)  # Adjust if needed
find_package(OpenCV REQUIRED)

# Check if OpenCV was compiled with CUDA support
if (OpenCV_FOUND)
    message(STATUS "Found OpenCV: ${OpenCV_LIBS}")
    message(STATUS "OpenCV include directory: ${OpenCV_INCLUDE_DIRS}")

else()
    message(FATAL_ERROR "OpenCV not found!")
endif()

# Source files
set(SOURCES
    src/vision.cpp
    src/priority_vision.cpp
    src/uart.cpp
)

# Add executable
add_executable(vision_executable src/main.cpp ${SOURCES})

# Link OpenCV libraries (including CUDA)
target_link_libraries(vision_executable PRIVATE ${OpenCV_LIBS})

# Include OpenCV headers
target_include_directories(vision_executable PRIVATE ${OpenCV_INCLUDE_DIRS})
