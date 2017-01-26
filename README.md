# Tutorial4RebuildOpentrack
Here are some instructions on how to build opentrack using under Visual studio C++.

##Requirements
 - At least Microsoft Visual Studio C++ 2015
 - CMake
 - Qt5
 - OpenCV 3.0
 optional
 - git

##Building
It is assumed that we are building a 32-bit version. There is no benefit to building 64-bit opentrack, which is only restricting the computers opentrack runs on.
Generally, we must use the same kind of binary, i.e. either 64-bit or 32-bit for all libraries that will be linked for opentrack application.

###Installing Qt

