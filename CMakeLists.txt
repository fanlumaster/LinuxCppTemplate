cmake_minimum_required(VERSION 3.27.0)
project(smallcase VERSION 1.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
# set output executable file directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include_directories("./includes/")

add_executable(smallcase "./src/measure_running_time.cpp")
