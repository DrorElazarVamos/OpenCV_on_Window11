cmake_minimum_required(VERSION 3.15)
project(OpenCVProject)

set(CMAKE_CXX_STANDARD 17)

set(OpenCV_DIR "C:/Users/USER/opencv/install_mingw")
find_package(OpenCV REQUIRED)

add_executable(opencv_app OpenCV.cc)
target_include_directories(opencv_app PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(opencv_app ${OpenCV_LIBS})
