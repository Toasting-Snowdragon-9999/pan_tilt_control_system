cmake_minimum_required(VERSION 3.10)
project(UARTTest)

set(CMAKE_CXX_STANDARD 17)

add_executable(uart_test
    main.cpp
    uart_test.cpp
)

