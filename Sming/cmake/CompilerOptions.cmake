#=============================================================================#
#                         Sming Library cmake script
#=============================================================================#
message("SMING Compiler Options")
message("----------------------")

set(WARNNGS 
    -Wall 
    -Werror 
    -Wl,-EL 
    -Wpointer-arith 
    -Wno-comment 
    -Wno-maybe-uninitialized 
    -Wno-parentheses 
    -Wno-return-type 
    -Wno-sign-compare 
    -Wno-strict-aliasing 
    -Wno-unused-but-set-variable 
    -Wno-unused-variable 
    -Wpointer-arith 
    -Wundef)

set(COMMON_FLAGS 
    -w 
    -fno-exceptions 
    -fno-rtti
    ${MFORCE32CompilerOption}
    )

set(CPLUSPLUSONLY_FLAGS 
    -std=c++11 
    -g 
    -mlongcalls 
    -Os 
    -ffunction-sections 
    -fdata-sections 
    -mtext-section-literals 
    -falign-functions=4)

#string (REPLACE ";" " " COMMON_FLAGS "${COMMON_FLAGSLIST}")
#set(CONLY_FLAGS         -DPROGMEM_L32="__attribute__((aligned(4))) __attribute__((section(\".irom.text\")))")

#TODO Move these into target_compile_options
set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wno-implicit-function-declaration -Wl,-EL -fno-inline-functions -nostdlib -std=gnu99")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -x assembler-with-cpp ")
set(CMAKE_EXE_LINKER_FLAGS
        "${CMAKE_EXE_LINKER_FLAGS} -L/opt/Sming/Sming/Arch/Esp8266/Compiler/ld -L/opt/Sming/Sming/Arch/Esp8266/Components/rboot/rboot -L/opt/Sming/Sming/Arch/Esp8266/Compiler/lib -L/opt/Sming/Sming/Arch/Esp8266/Components/Sdk/ESP8266_NONOS_SDK/lib -Lout/build -nostdlib -Wl,--no-check-sections -u call_user_start -u _printf_float -u _scanf_float -Wl,-static -T/opt/Sming/Sming/Arch/Esp8266/Compiler/ld/rboot.rom0.ld  -Wl,--gc-sections -Wl,-wrap,system_restart_local ")


# CMAKE_C_COMPILER is not mistake, gcc for all, not g++
set(CMAKE_CXX_LINK_EXECUTABLE
        "<CMAKE_C_COMPILER> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group")

set(CMAKE_C_LINK_EXECUTABLE
        "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group")
   
