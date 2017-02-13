#Tutorial4RebuildOpentrack
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
It is recommended to build opentrack's custom version of OpenCV.
```
git clone --recurse-submodules https://github.com/opentrack/opentrack-depends.git
```

You can also git clone from opentrack's fork of OpenCV.
```
git clone https://github.com/opentrack/opencv opencv-source
```

It will work with the original version of OpenCV, too.
```
git clone https://github.com/opencv/opencv.git opencv-source
```

Then we generate a MSVC project using `cmake` or `cmake-gui`.
Here it is assumed that we build under Windows 10 32-bit. The following steps should make it work.
 - Using cmake-gui, then select VC++ 2015, the build system, to generate the OpenCV MSVC project.
 - Add `/DHAVE_DSHOW` to `CMAKE_CXX_FLAGS`. This will enable building of direct show video capture support.
 - Set `CMAKE_INSTALL_PREFIX` to your desired destination directory. Here it is assumed to `D:\Dev\opencv`.
 - Then click the configuration and generation button to generate MSVC project.
 - Launch MSVC++ 2015 and hopefully build cleanly.
 - Run the `ALL_BUILD` and `INSTALL` to build the target.
That's ALL.

###Compiling LibOVR
It is recommended to build opentrack's custom version of LibOVR-140.
```
git clone --recurse-submodules https://github.com/opentrack/opentrack-depends.git
```

You can also git clone from opentrack's fork of OpenCV.
```
git clone --recurse-submodules https://github.com/opentrack/LibOVR
```

Then we generate a MSVC project using `cmake-gui`.
Here it is assumed that we build under Windows 10 32-bit. The following steps should make it work.
 - Using `cmake-gui`, then select VC++ 2015, the build system, to generate the LibOVR MSVC project.
 - Set `CMAKE_INSTALL_PREFIX` to your desired destination directory. Here is assumed to `D:\Dev\LibOVR-140`.
 - Then click the configuration and generation button to generate the MSVC project.
 - Launch MSVC++ 2015 and hopefully build successfully.
 - Run the `ALL_BUILD` and `INSTALL` to build the targer.
That's ALL.

###Building opentrack
It is recommended to build opentrack using `cmake` or `cmake-gui`.
Here is assumed that we build under Windows 10 32-bit.

First, using cmake or camke-gui to generate the opnetrack project.
```
cmake -D Qt5_DIR=D:/testbed/Dev/Qt/5.7/msvc2015/lib/cmake/Qt5 -D OpenCV_DIR=D:/testbed/Dev/opencv -D SDK_RIFT_140=D:/testbed/Dev/LibOVR-140 -D SDK_CONSOLE_DEBUG=BOOL=ON ..
```

Below instrctions work with msbuild prompt provied by VS2015.
Second, run `msbuild opentrack.sln`, and you will be able to build everything (opentrack.exe and relevant DLLs).

Third, run `msbuild INSTALL.vcxproj` to build all the components.

Fourth, add D:\Qt\5.7\msvc2015\bin into your PATH env variable -- so that Qt DLLs can be found.

Final, `copy D:\testbed\Dev\Qt\5.7\msvc2015\plugins\platforms\qwindowsd.dll D:\testbed\Dev\opentrack\install\platforms` which copies all the necessary plugin into the same directory containing opentrack.exe.
That's All.

###Troubleshooting
 - You can set the SDK_CONSOLE_DEBUG cache variable in cmake-gui to have a console window.
 - If you can compile it, but then run into Qt DLL missing issues when executing it,
 you can copy all directories inside `D:\Qt\5.7\msvc2015\plugins` into the same directory containing opentrack.exe.
 Or just copy the copy `D:\Qt\5.7\msvc2015\plugins\platforms\qwindowsd.dll` to  `D:\Dev\opentrack_rebuild\install\platforms`, it will work in my opinion.
 - I write a batch file it will automatically rebuild and install opentrack project, please find it in the same directory of this tutorial document.
 
