:: Specific files
del "CMakeCache.txt"
del "GLFWTutorialConfig.h"

:: Files with extension
del /s /q *.vcxproj
del /s /q *.filters
del /s /q *.cmake
del /s /q *.sln

:: Folders
RMDIR /Q /S "CMakeFiles"
RMDIR /Q /S "Debug"
RMDIR /Q /S "glfw"
RMDIR /Q /S "GLFWTutorial.dir"
RMDIR /Q /S "SFML"
RMDIR /Q /S "SFMLTutorial.dir"
RMDIR /Q /S "x64"

PAUSE