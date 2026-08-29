cmake_minimum_required(VERSION 3.15)
project(test_fcl LANGUAGES CXX)

find_package(fcl CONFIG REQUIRED)

add_executable(test_fcl test.cpp)
target_link_libraries(test_fcl PRIVATE fcl)

enable_testing()
add_test(NAME test_fcl COMMAND test_fcl)
