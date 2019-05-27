#=============================================================================#
#                         Basic_Blink cmake script
#=============================================================================#
message("Basic_Blink")
message("===========")

cmake_minimum_required(VERSION 3.5)
### Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()


set(CMAKE_CXX_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-g++)
set(CMAKE_C_COMPILER   $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)
set(CMAKE_ASM_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)

message("CXX: ${CMAKE_CXX_COMPILER}")
message("C:   ${CMAKE_C_COMPILER}")
message("ASM: ${CMAKE_ASM_COMPILER}")
# supress compiler checking
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_ASM_COMPILER_WORKS 1)

# supress determining compiler id
set(CMAKE_C_COMPILER_ID_RUN 1)
set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_ASM_COMPILER_ID_RUN 1)


#message("OuT: ${OUT}")

project(Basic_Blink C CXX)

include (/opt/Sming/Sming/cmake/srcs.cmake)
add_subdirectory($ENV{SMING_HOME} build)


set(USER_SOURCES /opt/Sming/samples/Basic_Blink/app/application.cpp)

message("USER_SOURCES=${USER_SOURCES}")
message("AAAAAAAAAA=${PROJECT_BINARY_DIR}/CMakeLists.txt")
message("BBBBBBBBBBBB=${LOC_PATH}")
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

set(COM_SPEED_SERIAL 11520)

add_executable(${CMAKE_PROJECT_NAME} ${USER_SOURCES})
message("About to build: ${CMAKE_PROJECT_NAME}")

target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC $<$<CONFIG:DEBUG>:${MY_DEBUG_OPTIONS}>)
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC $<$<CONFIG:RELEASE>:${MY_RELEASE_OPTIONS}>)
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC ${WARNNGS} )
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC ${COMMON_FLAGS} )
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC $<$<COMPILE_LANGUAGE:CXX>:${CPLUSPLUSONLY_FLAGS}> )

set(CMAKE_CXX_FLAGS   "${CMAKE_CXX_FLAGS} ${PROGMEM_FLAGS}")
set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} ${PROGMEM_FLAGS}")
message("Warnings=${WARNNGS}")
message("CMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}")


target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC
    include
    ${SmingIncludes}
    )
    
set(USER_ADD_INCLUDEDIRS include )

#add_library(${COMPONENT_TARGET} STATIC ${COMPONENT_SRCS})
set(include_type PUBLIC)

#set_property(TARGET ${COMPONENT_TARGET} PROPERTY OUTPUT_NAME ${COMPONENT_NAME})
set(LIBSMING sming)
set(EXTRA_LIBS ssl)
set(LIBS lwip2)
set(LIBS microc microgcc hal phy pp net80211 mqttc wpa ${LIBSMING} crypto smartconfig ${EXTRA_LIBS} ${LIBS})

target_link_libraries(Basic_Blink sming microc microgcc hal phy pp net80211 mqttc wpa crypto lwip_open main wps espnow smartconfig airkiss wpa2 stdc++ m c gcc)

include($ENV{SMING_HOME}/cmake/CompilerOptions.cmake)
#register_component()
# and esp8266 build definitions
add_definitions( 
        #sming PUBLIC
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
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC -U__STRICT_ANSI__)
if(ENABLE_GDB)
    target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE -Og -ggdb -DGDBSTUB_FREERTOS=0 -DENABLE_GDB=1 -DGDBSTUB_CTRLC_BREAK=0 )
endif()

if(SSL_DEBUG)
    target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE -DSSL_DEBUG=1 -DDEBUG_TLS_MEM=1 )
endif()

if(ENABLE_SSL)
    #TODO complete this
endif()



target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC $<$<CONFIG:DEBUG>:${MY_DEBUG_OPTIONS}>)
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC $<$<CONFIG:RELEASE>:${MY_RELEASE_OPTIONS}>)
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC ${WARNNGS} )
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC ${COMMON_FLAGS} )
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC $<$<COMPILE_LANGUAGE:CXX>:${CPLUSPLUSONLY_FLAGS}> )

set(CMAKE_CXX_FLAGS   "${CMAKE_CXX_FLAGS} ${PROGMEM_FLAGS}")
set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} ${PROGMEM_FLAGS}")
message(${CMAKE_CXX_FLAGS})
