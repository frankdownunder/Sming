cmake_minimum_required(VERSION 3.5)
### Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()

set(CMAKE_CXX_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-g++)
set(CMAKE_C_COMPILER   $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)
set(CMAKE_ASM_COMPILER $ENV{ESP_HOME}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)

# supress compiler checking
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_ASM_COMPILER_WORKS 1)

# supress determining compiler id
#set(CMAKE_C_COMPILER_ID_RUN 1)
#set(CMAKE_CXX_COMPILER_ID_RUN 1)
#set(CMAKE_ASM_COMPILER_ID_RUN 1)

project(Basic-Blink C CXX)

set(USER_SOURCES /opt/Sming/samples/Basic_Blink/app/application.cpp)
message("USER_SOURCES=${USER_SOURCES}")
message("AAAAAAAAAA=${PROJECT_BINARY_DIR}/CMakeLists.txt")
message("BBBBBBBBBBBB=${LOC_PATH}")

#Optionally suppress this feature from the code (presumably for space)
# should we target ESP8266, ESP32 or lInux?
option(USE_ESP8266_ESP32_LINUX      "Set ESP8266 as the target(0), ESP32 (1), or Linux(2)" 0) 
option(ENABLE_CMD_EXECUTOR  "ENABLE_CMD_EXECUTOR (0 or 1)?" ON)
option(ENABLE_SSL           "ENABLE_SSL (0 or 1)?" OFF)
option(ENABLE_ESPCONN       "ENABLE_ESPCONN (0 or 1)?" OFF)
option(ENABLE_CUSTOM_LWIP   "ENABLE_CUSTOM_LWIP (0 or 1)?" ON)
option(ENABLE_CUSTOM_PWM    "ENABLE_CUSTOM_PWM (0 or 1)?" ON)
option(ENABLE_WPS           "ENABLE_WPS (0 or 1)?" OFF)
option(ENABLE_CUSTOM_HEAP   "ENABLE_CUSTOM_HEAP (0 or 1)?" OFF)
option(DEBUG_VERBOSE_LEVEL  "DEBUG_VERBOSE_LEVEL (debug=3, info=2, warn=1, error=0)?" 0)
option(ENABLE_LWIPDEBUG     "ENABLE_LWIPDEBUG ()?" 0)
option(ENABLE_GDB           "ENABLE_GDB ()?" 0)
option(DEBUG_VERBOSE_LEVEL  "DEBUG_VERBOSE_LEVEL (0 or 1)?" ON)
set(COM_SPEED_SERIAL 11520)

add_executable(${CMAKE_PROJECT_NAME} ${USER_SOURCES})


include($ENV{SMING_HOME}/cmake/srcs.cmake)


target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC
    include
    ${SmingIncludes}
    )
        
set(USER_ADD_INCLUDEDIRS include )

#add_library(${COMPONENT_TARGET} STATIC ${COMPONENT_SRCS})
set(include_type PUBLIC)

set_property(TARGET ${COMPONENT_TARGET} PROPERTY OUTPUT_NAME ${COMPONENT_NAME})

#target_link_libraries(Basic_Blink ${COMPONENT_TARGET})

add_subdirectory($ENV{SMING_HOME} build)
#register_component()
