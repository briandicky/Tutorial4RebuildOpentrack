#Tutorial4RebuildLive555onWin10
Live555 is an excellent RTSP library for Windows, but can be a little tricky to build.
Here are some instructions on how to build live555 using Microsoft Visual Studil 2015 on Windows 10.

##Requirements
 - At least Microsoft Visual Studio 2015
 - live555-latest.tar.gz
 optional
 - git

##Building
1. Extract the `live555-latest.tar.gz` into your source directory.

2. Make the following changes to the `win32config` file:
 - Change `msvcirt.lib` to `msvcrt.lib`.
 - Comment out the `ntwin32.mak` include (i.e. `#!include <ntwin32.mak>`.
 - If you installed Visual Studio in the default location then change 
 `TOOLS32` to: `TOOLS32 = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC`

3. Open an MSBuild developer command prompt of Visual Studio 2015 command prompt. 

4. Set the environment variables by running this batch file by running `vsvars32.bat`
```"\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"```

5. Build the make files by running this
```genWindowsMakefiles```

6. Build the project.
Build each of the components of the project in this order:
```
cd liveMedia
nmake -f liveMedia.mak
cd ..\groupsock
nmake -f groupsock.mak
cd ..\UsageEnvironment
nmake -f UsageEnvironment.mak
cd ..\BasicUsageEnvironment
nmake -f BasicUsageEnvironment.mak
cd ..\testProgs
nmake -f testProgs.mak
cd ..\mediaServer
nmake -f mediaServer.mak```

7. If you encounter a linker errors when compiling any of the executable projects (like the Live555MediaServer) 
then build that project manually by entering the command displayed by nmake, b
ut without the out: parameter and including the ws2_32 library, for example:
```cl ws2_32.lib msvcrt.lib live555MediaServer.obj DynamicRTSPServer.obj ../liveMedia/libliveMedia.lib ../groupsock/libgroupsock.lib  ../BasicUsageEnvironment/libBasicUsageEnvironment.lib ../UsageEnvironment/libUsageEnvironment.lib```

In the end, this should give a valid Live555MediaServer.exe that is ready to run.
