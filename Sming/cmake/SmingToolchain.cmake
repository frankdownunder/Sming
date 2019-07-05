#=============================================================================#
# In cross-compiling scenarios, a toolchain file may be specified with 
# information about compiler and utility paths.
# toolchain file for xtensa toolchain (used for esp8266 device)

# To find the locatin of the compilers, the preferred option is to use the environment variable ESP_HOME
# The prvious methio used was to Copy this file to the root directory of your SDK (tested with https://github.com/pfalcon/esp-open-sdk) !!
# The variable SDK_BASE will be set to the location of this file.
# 
# Further paths are relative to ${SDK_BASE}

# We are cross compiling so we don't want compiler tests to run, as they will fail
# Set processor type

#=============================================================================#
#set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_NAME Sming)
message("SMING_ARCH ${SMING_ARCH}")


if(NOT DEFINED SMING_ARCH OR SMING_ARCH STREQUAL "Esp8266" )
    set(CMAKE_SYSTEM_PROCESSOR l106)
    
    #set(CMAKE_CXX_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-g++  )
    #set(CMAKE_C_COMPILER   $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc  )
    #set(CMAKE_ASM_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc  )
    set(CMAKE_CROSSCOMPILING 1)
    set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS FALSE)
    set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
    
    #set(SDK_BASE "${CMAKE_CURRENT_LIST_DIR}")
    set(SDK_BASE "$ENV{ESP_HOME}")
    
    
    set(tool_prefix "${SDK_BASE}/xtensa-lx106-elf/bin/xtensa-lx106-elf-")
    set(CMAKE_C_COMPILER ${tool_prefix}gcc)
    set(CMAKE_CXX_COMPILER ${tool_prefix}g++) 
    set(CMAKE_ASM_COMPILER ${tool_prefix}gcc)
    #set(CMAKE_CXX_COMPILER_AR ${tool_prefix}ar) 
    set(CMAKE_AR "${tool_prefix}ar" CACHE FILEPATH "Sming Archiver")

    # TODO: Only gcc or g++ is is needed, cmake can figure out the other one automatically.
    
    # supress compiler checking
    set(CMAKE_C_COMPILER_WORKS 1)
    set(CMAKE_CXX_COMPILER_WORKS 1)
    set(CMAKE_ASM_COMPILER_WORKS 1)

    # supress determining compiler id
    set(CMAKE_C_COMPILER_ID_RUN 1)
    set(CMAKE_CXX_COMPILER_ID_RUN 1)
    set(CMAKE_ASM_COMPILER_ID_RUN 1)


    #set(CMAKE_C_FLAGS_INIT "-Wpointer-arith -Wundef -mlongcalls -nostdlib -Wl,-EL -fdata-sections -ffunction-sections -DICACHE_FLASH")
    #set(CMAKE_ASM_FLAGS_INIT "${CMAKE_C_FLAGS_INIT}")
    #set(CMAKE_CXX_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} -fno-rtti ")
    #set(CMAKE_EXE_LINKER_FLAGS_INIT "-nostdlib -Wl,-static -Wl,--gc-sections")
    
    # Note: we use 'Os' due to the space constraints, also O2 and other stuff may try to link to 
    # symbols not present in libmicroc. 
    # Adding -g may not be too useful, but does not harm either
    set(CMAKE_C_FLAGS_RELEASE "-Os -g -DNDEBUG" CACHE STRING "" FORCE) # we have to enforce these flags, since otherwise, cmake automatically appends -O3 -DNDEBUG
    set(CMAKE_ASM_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}" CACHE STRING "" FORCE)
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}" CACHE STRING "" FORCE)
    
    execute_process(COMMAND "${CMAKE_C_COMPILER}" --help=target OUTPUT_VARIABLE COMPILER_TARGET_HELP_OUT)
    if (COMPILER_TARGET_HELP_OUT MATCHES "mforce-l32")
        set(MFORCE32 TRUE)
    endif()
    unset(COMPILER_TARGET_HELP_OUT)
    

elseif(SMING_ARCH STREQUAL "Host")
    message("SMING_ARCH Host Emulator")
    set(CMAKE_CXX_COMPILER g++ )
    set(CMAKE_C_COMPILER   gcc )
    set(CMAKE_ASM_COMPILER gcc )
else()
    message("SMING_ARCH Not implemented")
endif()

message("CXX: ${CMAKE_CXX_COMPILER}")
message("C:   ${CMAKE_C_COMPILER}")
message("ASM: ${CMAKE_ASM_COMPILER}")
message("AR : ${CMAKE_CXX_COMPILER_AR}")


# Add current directory to CMake Module path automatically
if(EXISTS  ${CMAKE_CURRENT_LIST_DIR}/Platform/Sming.cmake)
    set(CMAKE_MODULE_PATH  ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR})
endif()

#=============================================================================#
#                         System Paths                                        #
#=============================================================================#
if(UNIX)
    include(Platform/UnixPaths)
    if(APPLE)
        list(APPEND CMAKE_SYSTEM_PREFIX_PATH ~/Applications
                                             /Applications
                                             /Developer/Applications
                                             /sw        # Fink
                                             /opt/local) # MacPorts
    endif()
elseif(WIN32)
    include(Platform/WindowsPaths)
endif()


#=============================================================================#
#                         Detect Arduino SDK                                  #
#=============================================================================#
if(NOT ARDUINO_SDK_PATH)
    set(ARDUINO_PATHS)

    foreach(DETECT_VERSION_MAJOR 1)
        foreach(DETECT_VERSION_MINOR RANGE 5 0)
            list(APPEND ARDUINO_PATHS arduino-${DETECT_VERSION_MAJOR}.${DETECT_VERSION_MINOR})
            foreach(DETECT_VERSION_PATCH  RANGE 3 0)
                list(APPEND ARDUINO_PATHS arduino-${DETECT_VERSION_MAJOR}.${DETECT_VERSION_MINOR}.${DETECT_VERSION_PATCH})
            endforeach()
        endforeach()
    endforeach()

    foreach(VERSION RANGE 23 19)
        list(APPEND ARDUINO_PATHS arduino-00${VERSION})
    endforeach()

    if(UNIX)
        file(GLOB SDK_PATH_HINTS /usr/share/arduino*
            /opt/local/arduino*
            /opt/arduino*
            /usr/local/share/arduino*)
    elseif(WIN32)
        set(SDK_PATH_HINTS "C:\\Program Files\\Arduino"
            "C:\\Program Files (x86)\\Arduino"
            )
    endif()
    list(SORT SDK_PATH_HINTS)
    list(REVERSE SDK_PATH_HINTS)
endif()

if(1==0)
    #Skip for now
    find_path(ARDUINO_SDK_PATH
            NAMES lib/version.txt
            PATH_SUFFIXES share/arduino
                            Arduino.app/Contents/Resources/Java/
                            Arduino.app/Contents/Java/
                            ${ARDUINO_PATHS}
            HINTS ${SDK_PATH_HINTS}
            DOC "Arduino SDK path.")

    if(ARDUINO_SDK_PATH)
        list(APPEND CMAKE_SYSTEM_PREFIX_PATH ${ARDUINO_SDK_PATH}/hardware/tools/avr)
        list(APPEND CMAKE_SYSTEM_PREFIX_PATH ${ARDUINO_SDK_PATH}/hardware/tools/avr/utils)
    else()
        message(FATAL_ERROR "Could not find Arduino SDK (set ARDUINO_SDK_PATH)!")
    endif()

    set(ARDUINO_CPUMENU)
    if(ARDUINO_CPU)
        set(ARDUINO_CPUMENU ".menu.cpu.${ARDUINO_CPU}")
    endif(ARDUINO_CPU)
endif()
