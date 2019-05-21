cmake_minimum_required(VERSION 3.5)
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


# C and C++
project(Basic-Blink C CXX)

set(USER_SOURCES /opt/Sming/samples/Basic_Blink/app/application.cpp)
message("USER_SOURCES=${USER_SOURCES}")

#Optionally suppress this feature from the code (presumably for space)
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
option(DEBUG_VERBOSE_LEVEL  "DEBUG_VERBOSE_LEVEL (0 or 1)?" OFF)






add_executable(Basic_Blink ${USER_SOURCES})

include($ENV{SMING_HOME}/cmake/sming.cmake)

# should we target ESP8266, ESP32 or lInux?
option (USE_ESP8266_ESP32_LINUX 
        "Set ESP8266 as the target(0), ESP32 (1), or Linux(2)" 0) 


include_directories(include)
        
set(USER_ADD_INCLUDEDIRS include )



#add_library(${COMPONENT_TARGET} STATIC ${COMPONENT_SRCS})
set(include_type PUBLIC)

set_property(TARGET ${COMPONENT_TARGET} PROPERTY OUTPUT_NAME ${COMPONENT_NAME})




#target_link_libraries(Basic_Blink ${COMPONENT_TARGET})

#Calll macro - pls list any libraris used
sming(Basic_Blink)

#register_component()
