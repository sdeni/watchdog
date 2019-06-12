cmake_minimum_required(VERSION 3.1.0)

set(ENV{GTEST_DIR} "./googletest/googletest")
include(gTest.cmake)

set(CMAKE_CXX_STANDARD 17)

project(watchdog)

add_gTest(watchdog
    watchdog.cpp
)

find_package(Boost COMPONENTS filesystem REQUIRED)
# find_package(GTest REQUIRED)

target_link_libraries(watchdog
    Boost::filesystem
    # GTest::GTest
    # GTest::Main
)


add_executable(client client.cpp)
