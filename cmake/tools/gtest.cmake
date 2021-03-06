#
# Copyright (c) 2011, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Willow Garage, Inc. nor the names of its
#       contributors may be used to endorse or promote products derived from
#       this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

if (CATKIN_GTEST_SRC_FOUND)
  return()
endif()

find_package(GTest QUIET)
set(GTEST_FOUND ${GTEST_FOUND} CACHE INTERNAL "")
if(NOT GTEST_FOUND)
  if (EXISTS "/usr/src/gtest")
    message(INFO "Building GTest from source.")
    # for now, this would only work on Ubuntu
    add_subdirectory("/usr/src/gtest/" ${CMAKE_BINARY_DIR}/gtest)
    set(CATKIN_GTEST_SRC_FOUND TRUE)
    set(GTEST_LIBRARIES "gtest;gtest_main")
    find_path(GTEST_INCLUDE_DIRS gtest/gtest.h)
    set(GTEST_MAIN_LIBRARIES ${GTEST_LIBRARIES})
    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES})
    set(GTEST_FOUND TRUE)
  else()
    message(WARNING "GTest not found; C++ tests will fail to build.")
  endif()
else()
  message(STATUS "Found gtest: gtests will be built.")
  set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIRS} CACHE INTERNAL "")
  set(GTEST_LIBRARIES ${GTEST_LIBRARIES} CACHE INTERNAL "")
  set(GTEST_MAIN_LIBRARIES ${GTEST_MAIN_LIBRARIES} CACHE INTERNAL "")
  set(GTEST_BOTH_LIBRARIES ${GTEST_BOTH_LIBRARIES} CACHE INTERNAL "")
  set(GTEST_FOUND ${GTEST_FOUND} CACHE INTERNAL "")
endif()
