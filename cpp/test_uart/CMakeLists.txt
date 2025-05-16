
cmake_minimum_required(VERSION 3.10)

if(POLICY CMP0146)
    cmake_policy(SET CMP0146 OLD)
endif()

# Project name
project(uart_test)

include_directories(include)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


# Source files
set(SOURCES
    uart.cpp
)

# Add executable
add_executable(uart main_test_uart.cpp ${SOURCES})

