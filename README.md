# Tutorial4RebuildOpentrack
Here are some instructions on how to build opentrack using under Microsoft Visual Studio C++.

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
For MSVC++ 2015, You can use the Qt installer, go to the Qt download page and select open source version. Then install it, we only need the `msvc2015` component.
It is going to be a large download about 1GB. It is assumed that we install Qt5.7 to `D:\Dev\Qt`.
The libraries that we are interested in will be located in
```
D:\Dev\Qt\5.7\msvc2015\lib
D:\Dev\Qt\5.7\msvc2015\bin
```
or similar, depending on your Qt version.

####(Optional) Compile a static version of Qt library

###Installing OpenCV

###Compiling LibOVR

###Building opentrack

###Troubleshooting

