# cmake build

The cmake build system for the ESP8266 sming library provides an alternative to the hand crafted makefile and should eventualy provide additional benefits such as:
- native port to Windows
- being able to run and debug on linux
- pave the way to ESP32 migration
- super fast builds with Ninja


## Preparatory steps
Use the eixsting makefile to prepare things:
```bash
cd /opt/Sming/Sming
make dist-clean
make
make clean
```
These lines will ensure that all git submodules have been updated and patched as necessary. Eevntually we need a python script like IDF.py for the ESP32 to handle this. We are now ready to run cmake

Assuming we have got sming in /opt/Sming:

First time, create a build folder
```bash
cd /opt/Sming/Sming
mkdir build
```

To build the library, make sure te current folder is the newly created build folder, run cmake passing in any options, and then the folder wherein can be found CMakeLists.txt, as follows
```bash
cd /opt/Sming/Sming/build
cmake -DENABLE_CMD_EXECUTOR=0 ..
make
```
Note the two dots are needed - in this case because the parent folder is where the CMakeLists.txt file resides.

## Generators
At the moment the defult generator - Unix NMakefile is recommended.  
Ninja is the preferred generator, but more work needs to be done to support it. 

## Options
The options can be set on the command line as follows.

```bash
cmake -DOPTION=value ..
```
The value is stored in CMakeCache.txt, so it is usually only necessary to set it once.

-  USE_ESP8266_ESP32_LINUX
-  DEBUG_VERBOSE_LEVEL  
-  ENABLE_CMD_EXECUTOR  
-  ENABLE_CUSTOM_HEAP   
-  ENABLE_CUSTOM_LWIP   
-  ENABLE_CUSTOM_PWM    
-  ENABLE_ESPCONN       
-  ENABLE_GDB           
-  ENABLE_LWIPDEBUG     
-  ENABLE_SSL
-  ENABLE_WPS           
-  SSL_DEBUG

These options get stored in a header - options.h
This file also has the version number of the sming library, VERSION_MAJOR,VERSION_MINOR and VERSION_POINT.  A separate build number VERSION_BUILD is also available in /opt/Sming/Sming/build/BuildNumber.h

## cmake folder
This folder - /opt/Sming/Sming/cmake contains various files to support cmake.
Contents include:
- autoIncrementScript.cmake.  Generates an auto-incrementing  build number
- srcs.cmake. Contains a list of every source file in the library


# Next Steps
- [ ]  Ninja Support  
No support yet but it will come. The problem is that the compiler, when given the MMD option to generate dependencies, does not also do a compile.  Instead it produces an output file of zero length.  A workaround might be to have a python program that calls the compiler twice - first with MMD and the second time without.

- [ ]   Windows Support  
No support yet but it will come. It would be good to get a compiler that runs on Windows natively rather than using MSYS, Mingw or WSL.  The version installed with Arduino is a native windows executable.  The version of xtensa-lx106-elf-g++ that  comes with esp-open-sdk is 4.8.5 ( as at May 2019), while the version that comes with Arduino is 4.8.2 

- [ ] Building FOR Linux  
Debuggging LWIP and webserver code etc is better done on a Linux machine instead of on the ESPxxx hardaware, the former being an environment with more productive debygging tools. Changing the compiler is done easily with cmake, so this should be fairly easy.

- [ ] Building Executables  
The next step will be to create the CMakelists.txt for building the samples starting with Basic_Blink. We should support add_subdirectory to allow for recompiling the full library easily, and/or building to just link in the existing pre-built library  

- [ ] IDF.py or Similar  
Espressif have expressed the intention of providing an environment similar to ESP32-IDF for the ESP8266  
IDF.PY does a lot of things, including flashing, but there are only a few bits and pieces that would ned to change to make it work for the ESP8266.  