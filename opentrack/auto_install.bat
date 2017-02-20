@echo off

rem delete the cmake cache file
del CMakeCache.txt

rem delete a non-empty folder, the install folder of opentrack, in quiet mode, without being asked for confirmation
rmdir /S /Q install

rem run cmake configurate and generate
rem cmake -D Qt5_DIR=D:/testbed/Dev/Qt/5.7/msvc2015/lib/cmake/Qt5 -D OpenCV_DIR=D:/testbed/Dev/opencv -D SDK_RIFT_140=D:/testbed/Dev/LibOVR-140 -D SDK_CONSOLE_DEBUG=BOOL=ON

pause

rem Start to compile opentrack
msbuild opentrack.sln

rem Start to install opentrack
msbuild INSTALL.vcxproj

copy D:\testbed\Dev\Qt\5.7\msvc2015\plugins\platforms\qwindowsd.dll D:\testbed\Dev\opentrack\install\platforms

rem Install completely