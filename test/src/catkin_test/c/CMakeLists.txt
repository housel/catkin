cmake_minimum_required(VERSION 2.8)
project(c)

find_package(catkin)
find_package(a)
include_directories(${a_INCLUDE_DIRS})

add_library(c-one SHARED lib.cpp)
add_library(c-two SHARED lib.cpp)
target_link_libraries(c-one ${a_LIBRARIES})
target_link_libraries(c-two ${a_LIBRARIES})

add_message_files(
  DIRECTORY msg
  FILES CMsg.msg
)

generate_messages(DEPENDENCIES std_msgs a)

catkin_project(c
  VERSION 0.0.1
  INCLUDE_DIRS include
  LIBRARIES c-one c-two
  )

enable_python(c)

