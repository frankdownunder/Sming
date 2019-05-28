#=============================================================================#
#                         Sming Library cmake script
#=============================================================================#
message("SMING LIBRARY")
message("=============")
cmake_minimum_required(VERSION 3.5)
project(sming C CXX ASM)
# The version number.
set (VERSION_MAJOR 3)
set (VERSION_MINOR 8)
set (VERSION_POINT 1)


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
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_ASM_COMPILER_WORKS 1)

# supress determining compiler id
#set(CMAKE_C_COMPILER_ID_RUN 1)
#set(CMAKE_CXX_COMPILER_ID_RUN 1)
#set(CMAKE_ASM_COMPILER_ID_RUN 1)

message("CXX: ${CMAKE_CXX_COMPILER}")
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
#TODO remove PROGMEM_FLAGS
# Setting the compiier option for PROGMEM was really difficult,especially using target_compile_options.
# Brackets spaces and  quotes are all problematic for cmake strings and lists.
#set(PROGMEM_FLAGS "-DPROGMEM_L32=\"__attribute__((aligned(4)))  __attribute__((section(\\\".irom.text\\\")))\" "    )
#message(PROGMEM_FLAGS)
#message(${PROGMEM_FLAGS})





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


#=============================================================================#
#                         User options for Building
#=============================================================================#

message("Options")
message("-------")
# should we target ESP8266, ESP32 or Linux?
option (USE_ESP8266_ESP32_LINUX  "Set ESP8266 as the target(0), ESP32[unsoprted yet] (1), or Linux(2)" 0) 

#Optionally suppress this feature from the code (presumably for space)

option(DEBUG_VERBOSE_LEVEL  "DEBUG_VERBOSE_LEVEL (debug=3, info=2, warn=1, error=0)?" 0)
option(ENABLE_CMD_EXECUTOR  "ENABLE_CMD_EXECUTOR (0 or 1)?" ON)
option(ENABLE_CUSTOM_HEAP   "ENABLE_CUSTOM_HEAP (0 or 1)?" OFF)
option(ENABLE_CUSTOM_LWIP   "ENABLE_CUSTOM_LWIP (0 or 1)?" ON)
option(ENABLE_CUSTOM_PWM    "ENABLE_CUSTOM_PWM (0 or 1)?" ON)
option(ENABLE_ESPCONN       "ENABLE_ESPCONN (0 or 1)?" OFF)
option(ENABLE_GDB           "ENABLE_GDB ()?" OFF)
option(ENABLE_LWIPDEBUG     "ENABLE_LWIPDEBUG ()?" 0)
option(ENABLE_SSL           "ENABLE_SSL (0 or 1)?" OFF)
option(ENABLE_WPS           "ENABLE_WPS (0 or 1)?" OFF)
option(SSL_DEBUG            "SSL_DEBUG()?" 0)


set(COM_SPEED_SERIAL 11520)

message("USE_ESP8266_ESP32_LINUX ${USE_ESP8266_ESP32_LINUX}")
message("COM_SPEED_SERIAL     ${COM_SPEED_SERIAL}")
message("DEBUG_VERBOSE_LEVEL  ${DEBUG_VERBOSE_LEVEL}")
message("ENABLE_CMD_EXECUTOR  ${ENABLE_CMD_EXECUTOR}")
message("ENABLE_CUSTOM_HEAP   ${ENABLE_CUSTOM_HEAP}")
message("ENABLE_CUSTOM_LWIP   ${ENABLE_CUSTOM_LWIP}")
message("ENABLE_CUSTOM_PWM    ${ENABLE_CUSTOM_PWM}")
message("ENABLE_ESPCONN       ${ENABLE_ESPCONN}")
message("ENABLE_GDB           ${ENABLE_GDB}")
message("ENABLE_LWIPDEBUG     ${ENABLE_LWIPDEBUG}")
message("ENABLE_SSL           ${ENABLE_SSL}")
message("ENABLE_WPS           ${ENABLE_WPS}")
message("SSL_DEBUG            ${SSL_DEBUG}")


#include($ENV{SMING_HOME}/cmake/core.cmake)


#=============================================================================#
#                         Source files
#=============================================================================#


include (cmake/srcs.cmake)

set(COMPONENT_SRCS ${Sming_CXX_SOURCES})
set(COMPONENT_ASM_SRCS ${Sming_ASM_SRCS})
set(COMPONENT_C_SRCS ${Sming_C_SRCS})
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

# Note its better to use target_compile_options, than to set CMAKE_CXX_FLAGS directly

#=============================================================================#
#                         Targets and dependencies
#=============================================================================#

add_library(sming  ${COMPONENT_ASM_SRCS} )

if(false)
    target_sources(${PROJECT_NAME} PRIVATE ${OTHERS_FOLDER}/Components/http-parser/http_parser.c)
    target_sources(${PROJECT_NAME} PRIVATE ${CORE_FOLDER}/DateTime.cpp)
else()
    target_sources(${PROJECT_NAME} PRIVATE ${COMPONENT_C_SRCS} )
    target_sources(${PROJECT_NAME} PRIVATE ${COMPONENT_SRCS})
endif()

set_property(TARGET sming PROPERTY OUTPUT_NAME sming)


# esp8266 include directories
include_directories(sming PUBLIC
        ${SmingIncludes}
        )

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED on)

# and esp8266 build definitions
add_definitions( 
        #sming PUBLIC
        # I cant get PROGMEM_L32 to work here, (set copiler flags instead as a workaround):                                
        #-DPROGMEM_L32="__attribute__((aligned(4))) __attribute__((section(\".irom.text\")))" )
        -DARCH_ESP8266
        ${MFORCE32}
        -D__ets__ 
        -DARDUINO=106
        -DCOM_SPEED_SERIAL=11520
        -DDEBUG_PRINT_FILENAME_AND_LINE=0 
        -DDEBUG_VERBOSE_LEVEL=2 
        -DENABLE_CMD_EXECUTOR=1 
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
if(ENABLE_GDB)
    target_compile_options(sming PRIVATE -Og -ggdb -DGDBSTUB_FREERTOS=0 -DENABLE_GDB=1 -DGDBSTUB_CTRLC_BREAK=0 )
endif()

if(SSL_DEBUG)
    target_compile_options(sming PRIVATE -DSSL_DEBUG=1 -DDEBUG_TLS_MEM=1 )
endif()

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
