cmake_minimum_required (VERSION 2.6)
project (GLFWTutorial)
# The version number.
set (GLFWTutorial_VERSION_MAJOR 1)
set (GLFWTutorial_VERSION_MINOR 0)

# Set GLFW tests, examples and documentation.
#set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
#set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
#set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

# Configure a header file to pass some of the CMake settings
# to the source code.
configure_file (
	"${PROJECT_SOURCE_DIR}/GLFWTutorialConfig.h.in" 
	"${PROJECT_BINARY_DIR}/GLFWTutorialConfig.h"
)

# Add the directory of GLFW.
#add_subdirectory("sfml")
add_subdirectory("glfw-3.2.1")
add_subdirectory("SFML")

# Add the binary tree to the search path for include files
# so that we will find GLFWTutorialConfig.h.
include_directories ("${PROJECT_BINARY_DIR}")

# Add the executable.
add_executable(GLFWTutorial main.cpp)

# Link against GLFW target
target_link_libraries(GLFWTutorial glfw)

set(SFML_ROOT "${PROJECT_SOURCE_DIR}/SFML")
set(SFML_DIR "${PROJECT_SOURCE_DIR}/SFML")
set(SFML_INCLUDE_DIR "${SFML_DIR}/include")
include_directories(GLFWTutorial "${SFML_DIR}/include")

target_link_libraries(GLFWTutorial sfml-audio)
target_link_libraries(GLFWTutorial sfml-graphics)
target_link_libraries(GLFWTutorial sfml-main)
target_link_libraries(GLFWTutorial sfml-network)
target_link_libraries(GLFWTutorial sfml-system)
target_link_libraries(GLFWTutorial sfml-window)


# Add OpenGL if required
find_package(OpenGL  REQUIRED)

include_directories(GLFWTutorial ${OPENGL_INCLUDE_DIR})
target_link_libraries(GLFWTutorial ${OPENGL_gl_LIBRARY})

# Detect and add SFML
#set(SFML_ROOT "${PROJECT_SOURCE_DIR}/SFML-2.4.2}")

#set (CMAKE_MODULE_PATH "${SFML_DIR}/cmake/modules" ${CMAKE_MODULE_PATH})


#find_package(SFML REQUIRED network audio graphics window system)
#target_link_libraries(${EXECUTABLE_NAME} ${SFML_LIBRARIES})

## Detect and add SFML
#set(CMAKE_PREFIX_PATH "${PROJECT_SOURCE_DIR}/SFML-2.4.2}")
#set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/SFML-2.4.2/cmake/modules" ${CMAKE_MODULE_PATH})
#set(SFML_INCLUDE_DIR "${PROJECT_BINARY_DIR/SFML-2.4.2/include}")
##Find any version 2.X of SFML
##See the FindSFML.cmake file for additional details and instructions
#find_package(SFML 2 REQUIRED network audio graphics window system)
#if(SFML_FOUND)
#  include_directories(${SFML_INCLUDE_DIR})
#  target_link_libraries(${EXECUTABLE_NAME} ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})
#endif()