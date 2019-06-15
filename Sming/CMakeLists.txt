
#if(NOT DEFINED SMING_ARCH ) # MATCHES "^$")
#    set(SMING_ARCH Esp8266)
#    message("Using default architecture Esp8266")
#else()
#    if(SMING_ARCH STREQUAL "Esp8266")
#        message("Using architecture Esp8266")
#    elseif(SMING_ARCH STREQUAL "Host") 
#        message("Using architecture Host")
#    else() 
#        message(FATAL_ERROR "Invalid architecture ${SMING_ARCH}")
#    endif()
#endif()



# To reduce time, just build one of each
#set(debugCmakeJustTwoFiles false)
#if(SMING_ARCH STREQUAL "")
#    set(SMING_ARCH_IS_UNSET 1)
#else()
#    message("FOOEY")
#endif()

#=============================================================================#
#                         Sming Library cmake script
#=============================================================================#
message("SMING LIBRARY")
# build architecture - ESP8266, ESP32 or Linux?
set(SMING_ARCH "Esp8266" CACHE STRING "Architecture chosen by the user at CMake configure time")
# define the set of strings to which its value should be constrained:
set_property(CACHE SMING_ARCH PROPERTY STRINGS Esp8266 Host Esp32)
# Now cmake-gui knows to present a drop-down combo box for editing the "SMING_ARCH" cache entry, 
# and it knows what the valid choices for this entry should be
# TODO Validate command line entered value for SMING_ARCH

message("=============")



#include (cmake/SmingToolchain.cmake)

cmake_minimum_required(VERSION 3.5)
project(sming C CXX ASM)


#=============================================================================#
#                         User options 
#=============================================================================#

message("Options")
message("-------")


set(DEBUG_VERBOSE_LEVEL "2" CACHE STRING "Default debug verbose level is INFO, where DEBUG=3 INFO=2 WARNING=1 ERROR=0")
set_property(CACHE DEBUG_VERBOSE_LEVEL PROPERTY STRINGS 0 1 2 3)
set(SMING_DEBUG_PRINT_FILENAME_AND_LINE OFF CACHE BOOL "By default `debugf` does not print file name and line number.")

option(SMING_ENABLE_CMD_EXECUTOR  "Enable CMD_EXECUTOR (OFF will save some memory)?" ON)
option(SMING_ENABLE_CUSTOM_HEAP   "Enable custom memory allocator" OFF)
option(SMING_ENABLE_CUSTOM_PWM    "Select custom PWM library implementation" ON)
option(SMING_ENABLE_ESPCONN       "Enable espconn API for open-source lwip" OFF)
option(SMING_ENABLE_GDB           "Enable Espressif gdbstubs" OFF)
option(SMING_ENABLE_LWIPDEBUG     "Compile open-source lwip with debugging enabled" OFF)
option(SMING_ENABLE_SSL           "Enable SSL functionality?" OFF)
option(SMING_ENABLE_WPS           "Enable WPS" OFF)
option(SMING_SSL_DEBUG            "Enable SSL_DEBUG" OFF)

# also used by sming.cmake for terminal setup
set(COM_SPEED_SERIAL                115200 CACHE STRING "Baud rate for serial connection (Note: Boards with 26MHz crystal will boot at 74880, i. e. set your terminal to this rate to receive messages from the ROM boot loader.")
set_property(CACHE COM_SPEED_SERIAL PROPERTY STRINGS 921600 454800 460800 230400  115200  57600 74880  9600)

set(SMING_ENABLE_CUSTOM_LWIP        lwip    CACHE STRING "select 'builtin' to use binary lwip from SDK, 'lwip' (default) or 'lwip2' (does not support espconn) to compile open source version from esp_open")
set_property(CACHE SMING_ENABLE_CUSTOM_LWIP PROPERTY STRINGS builtin lwip lwip2)
set(SMING_ENABLE_CUSTOM_PWM         ON CACHE BOOL "Select custom PWM library implementation")
# TODO: Set automatically for RELEASE builds (use RELWITHDEBINFO for basic gdbstubs)
set(SMING_RELEASE OFF CACHE BOOL "Disable debug functionality (do not add basic gdbstubs)")
set(SDK_BASE $ENV(${ESP_}) CACHE PATH "Path to sdk base folder (e. g. path/to/esp-open-sdk/sdk). If empty, the internal SDK that comes with sming is used instead.")


message("COM_SPEED_SERIAL           ${COM_SPEED_SERIAL}")
message("SMING_ARCH                 ${SMING_ARCH}")
message("DEBUG_VERBOSE_LEVEL        ${DEBUG_VERBOSE_LEVEL}")
message("SMING_ENABLE_CMD_EXECUTOR  ${SMING_ENABLE_CMD_EXECUTOR}")
message("SMING_ENABLE_CUSTOM_HEAP   ${SMING_ENABLE_CUSTOM_HEAP}")
message("SMING_ENABLE_CUSTOM_LWIP   ${SMING_ENABLE_CUSTOM_LWIP}")
message("SMING_ENABLE_CUSTOM_PWM    ${SMING_ENABLE_CUSTOM_PWM}")
message("SMING_ENABLE_ESPCONN       ${SMING_ENABLE_ESPCONN}")
message("SMING_ENABLE_GDB           ${SMING_ENABLE_GDB}")
message("SMING_ENABLE_LWIPDEBUG     ${SMING_ENABLE_LWIPDEBUG}")
message("SMING_ENABLE_SSL           ${SMING_ENABLE_SSL}")
message("SMING_ENABLE_WPS           ${SMING_ENABLE_WPS}")
message("SMING_SSL_DEBUG            ${SMING_SSL_DEBUG}")


# The version number.
set (VERSION_MAJOR 3)
set (VERSION_MINOR 8)
set (VERSION_POINT 1)
message("Project: Sming, version ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_POINT}")

#=============================================================================#
#                         System Paths, compiler and config
#=============================================================================#


#set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/SmingToolchain.cmake)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

### Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
else()
    message("Building in directory ${PROJECT_BINARY_DIR}/CMakeLists.txt        ${CMAKE_MODULE_PATH}")
endif()

### Hardcoded paths to compiler - is there a better way?
message("ESP_HOME=$ENV{ESP_HOME}")
message("CMAKE_TOOLCHAIN_FILE ${CMAKE_TOOLCHAIN_FILE}")
set(CMAKE_CXX_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-g++)
set(CMAKE_C_COMPILER   $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)
set(CMAKE_ASM_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)

SET(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> cru <TARGET>  <OBJECTS>")
SET(CMAKE_C_ARCHIVE_CREATE   "<CMAKE_AR> cru <TARGET>  <OBJECTS>")



# TODO set compilers better
#set(CMAKE_C_COMPILER "${TOOLCHAIN_BIN}/${TARGET_TRIPLET}-gcc${SYSTEM_EXTENSION}")
#set(CMAKE_CXX_COMPILER "${TOOLCHAIN_BIN}/${TARGET_TRIPLET}-g++${SYSTEM_EXTENSION}")
#set(CMAKE_ASM_COMPILER "${TOOLCHAIN_BIN}/${TARGET_TRIPLET}-gcc${SYSTEM_EXTENSION}")


# supress compiler checking
#set(CMAKE_C_COMPILER_WORKS 1)
#set(CMAKE_CXX_COMPILER_WORKS 1)
#set(CMAKE_ASM_COMPILER_WORKS 1)

# supress determining compiler id
#set(CMAKE_C_COMPILER_ID_RUN 1)
#set(CMAKE_CXX_COMPILER_ID_RUN 1)
#set(CMAKE_ASM_COMPILER_ID_RUN 1)

message("CXX: ${CMAKE_CXX_COMPILER} $<CXX_COMPILER_ID>")
message("C:   ${CMAKE_C_COMPILER}")
message("ASM: ${CMAKE_ASM_COMPILER}")

# ------------------------------------------

execute_process(COMMAND ${CMAKE_CXX_COMPILER} "--help=target" OUTPUT_VARIABLE OUT)
if(${OUT} MATCHES "mforce-l32")
    set(MFORCE32 "-DMFORCE32")
    set(MFORCE32CompilerOption "-mforce-l32")
else()
    set(MFORCE32 "")
    set(MFORCE32CompilerOption "")
ENDIF()
message("MFORCE32 = ${MFORCE32}")


#include($ENV{SMING_HOME}/cmake/sming.cmake)
#add_library(sming STATIC ${COMPONENT_SRCS})


set(CMAKE_SYSTEM_NAME ESP8266)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")


# esp8266 compiler triplet name
#set(TARGET_TRIPLET xtensa-lx106-elf)

# flash size
set(FLASH_SIZE 4m)

# system magic, detect arduino dir and system extension
# TODO - detect toolchain perhaps?  Is it useful to know where the arduino folders are?
if(CMAKE_HOST_SYSTEM_NAME MATCHES "Darwin")
    set(USER_HOME $ENV{HOME})
    set(SYSTEM_EXTENSION "")
    set(ARDUINO_DIR "${USER_HOME}/Library/Arduino15")
    set(SYSTEM_LIBRARIES_ROOT /Applications/Arduino.app/Contents/Java/libraries)
    set(USER_LIBRARIES_ROOT "${USER_HOME}/Documents/Arduino/libraries")

elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux")
    set(USER_HOME $ENV{HOME})
    set(SYSTEM_EXTENSION "")
    set(SYSTEM_LIBRARIES_ROOT "${USER_HOME}/Arduino/libraries")
    #TODO fix next line
    set(USER_LIBRARIES_ROOT "${USER_HOME}/Documents/Arduino/libraries")

elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
    if(NOT DEFINED RAW_USER_HOME)
        set(RAW_USER_HOME $ENV{USERPROFILE})
    endif()
    string(REPLACE "\\" "/" USER_HOME ${RAW_USER_HOME})
    set(SYSTEM_EXTENSION ".exe")
    set(RAW_ARDUINO_DIR "$ENV{LOCALAPPDATA}/Arduino15")
    string(REPLACE "\\" "/" ARDUINO_DIR ${RAW_ARDUINO_DIR})
    set(RAW_SYSTEM_LIBRARIES_ROOT "$ENV{PROGRAMFILES}/Arduino/libraries")
    string(REPLACE "\\" "/" SYSTEM_LIBRARIES_ROOT ${RAW_SYSTEM_LIBRARIES_ROOT})
    set(USER_LIBRARIES_ROOT "${USER_HOME}/Documents/Arduino/libraries")
else()
    message(FATAL_ERROR "${CMAKE_HOST_SYSTEM_NAME} Unsupported build platform.")
endif()


#set(ARDUINO_ESP8266_HOME $ENV{ESP_HOME}/packages/esp8266)

# find toolchain bin directory
#file(GLOB TOOLCHAIN_SUBDIRS LIST_DIRECTORIES=TRUE "${ARDUINO_ESP8266_HOME}/tools/xtensa-lx106-elf-gcc/*")
#list(GET TOOLCHAIN_SUBDIRS 0 TOOLCHAIN_ROOT)
#set(TOOLCHAIN_BIN ${TOOLCHAIN_ROOT}/bin)
#message("TOOLCHAIN_SUBDIRS=${TOOLCHAIN_SUBDIRS} TOOLCHAIN_BIN=$(TOOLCHAIN_BIN).")

# find hardware root directory
#file(GLOB HARDWARE_SUBDIRS LIST_DIRECTORIES=TRUE "${ARDUINO_ESP8266_HOME}/hardware/esp8266/*")
#list(GET HARDWARE_SUBDIRS 0 HARDWARE_ROOT)
#set(ESP8266_LIBRARIES_ROOT ${HARDWARE_ROOT}/libraries)
#message("HARDWARE_SUBDIRS=${HARDWARE_SUBDIRS} ESP8266_LIBRARIES_ROOT=$(ESP8266_LIBRARIES_ROOT).")

# esptool location
set(ESPTOOL $ENV{ESP_HOME}/esptool/esptool.py)
#file(GLOB ESPTOOL_SUBDIRS LIST_DIRECTORIES=TRUE "${ARDUINO_ESP8266_HOME}/tools/esptool/*")
#list(GET ESPTOOL_SUBDIRS 0 ESPTOOL_DIR)
#set(ESPTOOL_APP ${ESPTOOL_DIR}/esptool${SYSTEM_EXTENSION})
#message("ESPTOOL_APP $(ESPTOOL_APP) ESPTOOL_SUBDIRS LIST=${ESPTOOL_SUBDIRS} ESPTOOL_APP=$(ESPTOOL_APP).")


set(THIRD_PARTY_DIR ${SMING_HOME}/third-party)

#include($ENV{SMING_HOME}/cmake/core.cmake)


#=============================================================================#
#                         Source files
#=============================================================================#


include (cmake/srcs.cmake)

set(COMPONENT_SRCS      ${Sming_CXX_SOURCES})
set(COMPONENT_ASM_SRCS  ${Sming_ASM_SRCS})
set(COMPONENT_C_SRCS    ${Sming_C_SRCS})
#message("COMPONENT_SRCS  ${COMPONENT_SRCS} ${COMPONENT_ASM_SRCS} ${COMPONENT_C_SRCS}")

set(COMPONENT_PRIV_INCLUDEDIRS  ${LIBRARY_FOLDER}/Adafruit_BME280_Library/src)

#set(COMPONENT_REQUIRES spi_flash mbedtls mdns ethernet)
#set(COMPONENT_PRIV_REQUIRES fatfs nvs_flash app_update spiffs bootloader_support openssl bt)

set(include_type PUBLIC)

message("CMAKE_CURRENT_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}")

 
#=============================================================================#
#                         Compiler options 
#=============================================================================#

include(cmake/CompilerOptions.cmake)
# Note it is advised to use target_compile_options, than to set CMAKE_CXX_FLAGS directly

 
#=============================================================================#
#                         Submodules
#=============================================================================#


# Fetch git submodules that are not already present and apply patches
find_package(Git)
if(NOT Git_FOUND)
    message(FATAL_ERROR "Git not found: Cannot check out submodules")
endif()

# run git command in the given working directory and write command output to a variable named 'git_output'
function(GIT_RUN_IN working_directory)
    message("Calling Git command: ${GIT_EXECUTABLE} ARGN:${ARGN} working_directory:${working_directory}")
    execute_process(
        COMMAND ${GIT_EXECUTABLE} ${ARGN}
        WORKING_DIRECTORY "${working_directory}"
        RESULT_VARIABLE git_ok
        OUTPUT_VARIABLE git_output
        ERROR_VARIABLE git_error
    )
    if (NOT git_ok EQUAL 0)
        message(FATAL_ERROR "Git command failed:\n${git_error}")
    endif()
    set(git_output "${git_output}" PARENT_SCOPE)
endfunction()

# init/checkout a submodule and optionally apply a patch file from ${path}/../.patches matching the name of the submodule
# Arguments:
# - path: absolute path to submodule
# - file_to_check: path to a file (relative to submodule, i. e. ${path}) that will be present in the submodule if it has been prepared already and should not be modified
function(PREPARE_SUBMODULE path file_to_check)
    if (EXISTS "${path}/${file_to_check}")
        return()
    endif()    
    get_filename_component("${path}" module_name NAME)
    get_filename_component("${path}" basedir DIRECTORY)
    message("Preparing submodule ${path}...")
    git_run_in("${SMING_HOME}" submodule update --init --recursive "${path}")    
    set(patch_file "${basedir}/.patches/${module_name}.patch")
    if (EXISTS "${patch_file}")
        git_run_in("${path}" apply -v "${patch_file}" --ignore-whitespace --whitespace=nowarn)
    endif()
endfunction()


# Prepare Arduino libraries embedded as submodules
if(1==0) # Not yet
    git_run_in("${SMING_HOME}" "submodule status Libraries")
    string(REPLACE ";" "\\\\;" git_output "${git_output}") # split lines
    string(REPLACE "\n" ";" git_output "${git_output}")
    foreach(line IN LISTS git_output)
        string(STRIP "${line}" line)
        if (NOT line STREQUAL "")
            string(REGEX MATCH "Libraries[^ \t]+" lib "${line}")
            prepare_submodule("${SMING_HOME}/${lib}" "library.properties")
        endif()
    endforeach()

    prepare_submodule("${THIRD_PARTY_DIR}/rboot" "Makefile")
    prepare_submodule("${THIRD_PARTY_DIR}/spiffs" "makefile")
    prepare_submodule("${THIRD_PARTY_DIR}/http-parser" "Makefile")
    prepare_submodule("${THIRD_PARTY_DIR}/ws_parser" "Makefile")

endif()



#=============================================================================#
#                         Targets and dependencies
#=============================================================================#

add_library(sming  ${COMPONENT_ASM_SRCS} )
if(debugCmakeJustTwoFiles)
    target_sources(${PROJECT_NAME} PRIVATE ${FOLDER_BASE}/Components/http-parser/http_parser.c)
    target_sources(${PROJECT_NAME} PRIVATE ${FOLDER_BASE}/Core/DateTime.cpp)
else()
    target_sources(${PROJECT_NAME} PRIVATE ${COMPONENT_C_SRCS} )
    target_sources(${PROJECT_NAME} PRIVATE ${COMPONENT_SRCS})
endif()

set_property(TARGET sming PROPERTY OUTPUT_NAME sming)


# esp8266 include directories
include_directories(sming PUBLIC
        ${SmingIncludes}
        )

if(SMING_ARCH==Esp8266)
    add_definitions( -DARCH_ESP8266 ${MFORCE32})
elseif(SMING_ARCH==Host)
    add_definitions( -DARCH_HOST )
endif()

if(SMING_ENABLE_CMD_EXECUTOR)
    add_definitions( -DENABLE_CMD_EXECUTOR=1 )
endif()
if(SMING_ENABLE_CUSTOM_HEAP)
endif()
if(SMING_ENABLE_CUSTOM_PWM)
endif()
if(SMING_ENABLE_ESPCONN)
endif()
if(SMING_ENABLE_GDB)
endif()
if(SMING_ENABLE_LWIPDEBUG)
endif()
if(SMING_ENABLE_SSL)
endif()
if(SMING_ENABLE_WPS)
endif()
if(SMING_SSL_DEBUG)
endif()


# and esp8266 build definitions
add_definitions( 
        #sming PUBLIC
        -D__ets__ 
        -DARDUINO=106
        -DCOM_SPEED_SERIAL=11520
        -DDEBUG_PRINT_FILENAME_AND_LINE=0 
        -DDEBUG_VERBOSE_LEVEL=2 
        -DESP8266=1 
        -DF_CPU=80000000L
        -DFLASHMODE_DOUT
        -DICACHE_FLASH 
        -DLED_BUILTIN=2
        -DLWIP_FEATURES=1
        -DLWIP_IPV6=0
        -DLWIP_OPEN_SRC
        -DSDK_INTERNAL 
        -DSDK_PWM_PERIOD_COMPAT_MODE=1 
        -DSMING_INCLUDED=1 
        -DTCP_MSS=536  
        -DUSE_OPTIMIZE_PRINTF   #// defined in user_config.h so dont need it here?
        )
        #-DARDUINO_ARCH_ESP8266
        #-DARDUINO_ESP8266_GENERIC  
        #-DCUST_FILE_BASE=Print              # What is this for?
        #@-DARDUINO_ARCH_ESP8266 \"-DARDUINO_BOARD=\"ESP8266_GENERIC\"\" 
        #@-DARDUINO_BOARD="ESP8266_WEMOS_D1MINI"
        #-DARDUINO_ESP8266_WEMOS_D1MINI


set(MY_DEBUG_OPTIONS  -Os -O3 )
set(MY_RELEASE_OPTIONS -Os -DSMING_RELEASE=1 -DLWIP_NOASSERT)

# some other options and link libraries
target_compile_options(sming PUBLIC -U__STRICT_ANSI__)

if(ENABLE_SSL)
    #TODO complete this
    #LIBAXTLS			:= axtls
	#LIBS				+= $(LIBAXTLS)
	#LIBAXTLS_DST		:= $(call UserLibPath,$(LIBAXTLS))
	#AXTLS_BASE			:= $(ARCH_COMPONENTS)/axtls-8266/axtls-8266
	#EXTRA_INCDIR		+= $(AXTLS_BASE)/.. $(AXTLS_BASE) $(AXTLS_BASE)/ssl $(AXTLS_BASE)/crypto
	#AXTLS_FLAGS			:= -DLWIP_RAW=1 -DENABLE_SSL=1
	#ifeq ($(SSL_DEBUG),1) # 
	#	AXTLS_FLAGS		+= -DSSL_DEBUG=1 -DDEBUG_TLS_MEM=1
	#endif
	#CUSTOM_TARGETS		+= $(LIBAXTLS_DST) include/ssl/private_key.h
	#CFLAGS				+= $(AXTLS_FLAGS)

#$(LIBAXTLS_DST):
	#$(call MakeLibrary,$@,ENABLE_SSL=1)

#include/ssl/private_key.h:
	#$(vecho) "Generating unique certificate and key. This may take some time"
	#$(Q) mkdir -p $(CURDIR)/include/ssl/
	#AXDIR=$(CURDIR)/include/ssl/ $(ARCH_COMPONENTS)/axtls-8266/axtls-8266/tools/make_certs.sh
endif()

if (SMING_ENABLE_WPS)
    target_compile_definitions(sming PUBLIC ENABLE_WPS=1)
    target_link_libraries(sming INTERFACE "${SDK_BASE}/lib/libwps.a")
endif()

if (SMING_ENABLE_SSL)
    prepare_submodule("${THIRD_PARTY_DIR}/axtls-8266" "Makefile")
    add_subdirectory("${THIRD_PARTY_DIR}/axtls-8266")
    target_link_libraries(sming PUBLIC axtls)
    # hack: some files of axtls reference symbols from sming => we need a circular dependency here
    # TODO: figure out a better way
    cmake_policy(SET CMP0079 NEW)
    target_link_libraries(axtls INTERFACE sming)
endif()



target_compile_options(sming PUBLIC $<$<CONFIG:DEBUG>:${MY_DEBUG_OPTIONS}>)
target_compile_options(sming PUBLIC $<$<CONFIG:RELEASE>:${MY_RELEASE_OPTIONS}>)
target_compile_options(sming PUBLIC ${WARNNGS} )
target_compile_options(sming PUBLIC ${COMMON_FLAGS} )
target_compile_options(sming PUBLIC $<$<COMPILE_LANGUAGE:CXX>:${CPLUSPLUSONLY_FLAGS}> )

set(CMAKE_CXX_FLAGS   "${CMAKE_CXX_FLAGS} ${PROGMEM_FLAGS}")
set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} ${PROGMEM_FLAGS}")
message("CMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}")

#target_compile_options(sming PUBLIC [=[-DPROGMEM_L32="__attribute__((aligned(4)))]=] [=[__attribute__((section(\".irom.text\")))"]=])


#target_link_libraries(sming PUBLIC microc microgcc hal phy pp net80211 mqttc wpa crypto lwip_open main wps espnow smartconfig airkiss wpa2 stdc++ m c gcc)



set(ARG_CACHE_FILE  "${PROJECT_SOURCE_DIR}/BuildNumberCache.txt")
set(ARG_HEADER_FILE "${PROJECT_BINARY_DIR}/BuildNumber.h")

add_custom_command(
    TARGET sming
    PRE_BUILD
    COMMAND ${CMAKE_COMMAND} 
        -D ARG_CACHE_FILE=${ARG_CACHE_FILE} -DARG_HEADER_FILE=${ARG_HEADER_FILE}
        -P "/opt/Sming/Sming/cmake/autoIncrementScript.cmake"
)


# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/Options.h.in"
  "${PROJECT_SOURCE_DIR}/Core/Options.h"
  )
# add the binary tree to the search path for include files
# so that we will find any generacted files in there.
# But there arent nany at present
#include_directories("${PROJECT_BINARY_DIR}")


#axtls lwip2-536-feat bearssl 


# When building the executable....
# Append sming library as part of target executable
#target_link_libraries(${PROJECT_NAME} PUBLIC sming)

# and custom command to create bin file
#add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
#        COMMAND ${ESPTOOL_APP} -eo ${HARDWARE_ROOT}/bootloaders/eboot/eboot.elf -bo $<TARGET_FILE_DIR:${PROJECT_NAME}>/${PROJECT_NAME}.bin -bm dio -bf 40 -bz 4M -bs .text -bp 4096 -ec -eo $<TARGET_FILE:${PROJECT_NAME}> -bs .irom0.text -bs .text -bs .data -bs .rodata -bc -ec
#        COMMENT "Building ${PROJECT_NAME}> bin file")

#set(ll 123  -DPROGMEM_L32="__attribute__((aligned(4))) __attribute__((section(\".irom.text\")))" ))
#message(ll)
message("END SMING LIBRARY")
message("=================")
