cmake_minimum_required(VERSION 3.1.0)

if(DEFINED ENV{GTEST_DIR})
    set(GTEST_DIR_TMP "$ENV{GTEST_DIR}")
else()
    set(GTEST_DIR_TMP "$ENV{HOME}/googletest/googletest")
    if(NOT EXISTS "${GTEST_DIR_TMP}")
        unset(GTEST_DIR_TMP)
    endif()
endif()
if(DEFINED GTEST_DIR_TMP)
    set(GTEST_DIR_VAR "${GTEST_DIR_TMP}" CACHE PATH "GTEST_DIR path.")
    unset(GTEST_DIR_TMP)
    message("GTEST_DIR_VAR: ${GTEST_DIR_VAR}")
else()
    message(FATAL_ERROR "GTEST_DIR_VAR is not set!")
endif()

############
###### gTest
add_library(gTest STATIC
    "${GTEST_DIR_VAR}/src/gtest-all.cc"
    "${GTEST_DIR_VAR}/src/gtest_main.cc"
)
target_include_directories(gTest PRIVATE
    "${GTEST_DIR_VAR}/include"
    "${GTEST_DIR_VAR}"
)
if(UNIX AND NOT APPLE)
    target_link_libraries(gTest pthread)
endif()
######

function(add_gTest target)
    add_executable(${ARGV})
    target_include_directories(${target} PRIVATE
        "${GTEST_DIR_VAR}/include"
    )
    target_link_libraries(${target} gTest)
endfunction(add_gTest target)
