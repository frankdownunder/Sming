#=============================================================================#
#                         Sming Library cmake script
#=============================================================================#
function(AddCompilerOptions)
 
    message("-----AddCompilerOptions------")


    set(CMAKE_CXX_STANDARD 11 PARENT_SCOPE)
    set(CMAKE_CXX_STANDARD_REQUIRED on PARENT_SCOPE)


    set(WARNINGS 
        -Wall 
        -Werror 
            -Wl,-EL     # linker options ?
        -Wpointer-arith                 # Warn about anything that depends on the “size of” a function type or of void
        -Wno-comment                    # disable Warn whenever a comment-start sequence ‘/*’ appears in a ‘/*’ comment, or whenever a backslash-newline appears in a ‘//’ comment. This warning is enabled by -Wall. 
        -Wno-maybe-uninitialized        # disable warning
        -Wno-parentheses                # disable Warning if parentheses are omitted in certain contexts
        -Wno-return-type                # disable
        -Wno-sign-compare               # disable
        -Wno-strict-aliasing            # disable warning about code that might break the strict aliasing rules that the compiler is using for optimization.
        -Wno-unused-but-set-variable    # disable
        -Wno-unused-variable            # disable the unused variable warnings
        -Wextra                         # superseeds -W   
        -Wundef                         # Warn if an undefined identifier is evaluated in an #if directive
        PARENT_SCOPE
        )

    set(COMMON_FLAGS 
        -w 
        -fno-exceptions 
        -fno-rtti
        ${MFORCE32CompilerOption}
        PARENT_SCOPE
        )

    set(CPLUSPLUSONLY_FLAGS 
        -std=c++11 
        -Wno-reorder 
        -mlongcalls
        -mtext-section-literals
        #-Os 
        -ffunction-sections 
        -fdata-sections
        -felide-constructors
        -ffunction-sections
        -finline-functions
        PARENT_SCOPE
        )

    if(SMING_ARCH STREQUAL "Esp8266")
        add_definitions( 
            -DARCH_ESP8266 
            -DESP8266=1 
            ${MFORCE32}
            -DICACHE_FLASH 
            -DSDK_INTERNAL 
            -DSDK_PWM_PERIOD_COMPAT_MODE=1 
            )
            #-DF_CPU=80000000L
            #-DFLASHMODE_DOUT
        #if (release)
        #set(MY_DEBUG_OPTIONS  -Os -O3 )
        #set(MY_RELEASE_OPTIONS -Os -DSMING_RELEASE=1 -DLWIP_NOASSERT)
        #else
        #endif

    else()
        add_definitions( 
            -DARCH_HOST 
            -D__WORDSIZE=32
            )
        set(COMMON_FLAGS 
            PARENT_SCOPE)
        set(WARNINGS 
            -Wall 
            PARENT_SCOPE
            )
        set(CPLUSPLUSONLY_FLAGS 
                -nostdlib
                -Og
                -std=c++11
                -fdata-sections
                -ffunction-sections
                -felide-constructors
                -Wno-reorder
                PARENT_SCOPE
                )
        set(MY_DEBUG_OPTIONS 
            -Wundef
            -Wpointer-arith
            -Wno-comment
            -Wl,-EL
            -finline-functions
            -Werror
            -Wno-sign-compare
            -Wno-parentheses
            -Wno-unused-variable
            -Wno-unused-but-set-variable
            -Wno-strict-aliasing
            -Wno-return-type
            -Wno-maybe-uninitialized
            -ggdb
            -Og
            -m32
            -Wno-deprecated-declarations
            PARENT_SCOPE
        ) 


        #if (release)
        #else
        #endif
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
        add_definitions( -DENABLE_GDB=1 )
    endif()
    if(SMING_ENABLE_LWIPDEBUG)
    endif()
    if(SMING_ENABLE_SSL)
    endif()
    if(SMING_ENABLE_WPS)
    endif()
    if(SMING_SSL_DEBUG)
    endif()
    if(SMING_DEBUG_PRINT_FILENAME_AND_LINE)
        add_definitions( -DDEBUG_PRINT_FILENAME_AND_LINE=0 )
    else()
        add_definitions( -DDEBUG_PRINT_FILENAME_AND_LINE=1 )
    endif()

    add_definitions( 
            -DARDUINO=106
            -D__ets__ 
            -DDEBUG_VERBOSE_LEVEL=2 
            -DSMING_INCLUDED=1 
            #-DUSE_OPTIMIZE_PRINTF   #// defined in user_config.h so dont need it here?
            #-DCOM_SPEED_SERIAL=11520
            #-DLED_BUILTIN=2
            #-DLWIP_FEATURES=1
            #-DLWIP_IPV6=0
            #-DLWIP_OPEN_SRC
            #-DTCP_MSS=536  
            )

    #string (REPLACE ";" " " COMMON_FLAGS "${COMMON_FLAGSLIST}")
    #set(CONLY_FLAGS         -DPROGMEM_L32="__attribute__((aligned(4))) __attribute__((section(\".irom.text\")))")

    #TODO Move these into target_compile_options
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wno-implicit-function-declaration -Wl,-EL -fno-inline-functions -nostdlib -std=gnu99" PARENT_SCOPE)
    set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -x assembler-with-cpp " PARENT_SCOPE)
    if(SMING_ARCH STREQUAL "Esp8266")
        set(CMAKE_EXE_LINKER_FLAGS
            "${CMAKE_EXE_LINKER_FLAGS} -L/opt/Sming/Sming/Arch/Esp8266/Compiler/ld -L/opt/Sming/Sming/Arch/Esp8266/Components/rboot/rboot -L/opt/Sming/Sming/Arch/Esp8266/Compiler/lib -L/opt/Sming/Sming/Arch/Esp8266/Components/Sdk/ESP8266_NONOS_SDK/lib -Lout/build -nostdlib -Wl,--no-check-sections -u call_user_start -u _printf_float -u _scanf_float -Wl,-static -T/opt/Sming/Sming/Arch/Esp8266/Compiler/ld/rboot.rom0.ld  -Wl,--gc-sections -Wl,-wrap,system_restart_local " PARENT_SCOPE)
    endif()

    # CMAKE_C_COMPILER is not mistake, gcc for all, not g++
    set(CMAKE_CXX_LINK_EXECUTABLE
            "<CMAKE_C_COMPILER> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group" PARENT_SCOPE)

    set(CMAKE_C_LINK_EXECUTABLE
            "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group" PARENT_SCOPE)
endfunction()   

function(AddDefine_CustFileBase SRCS)
    foreach(SRC in ${SRCS})
        get_filename_component(SRCFILENAME ${SRC} NAME)
        string(REGEX REPLACE "\\.[^.]*$" "" SRC_NAME ${SRCFILENAME})
        #message("SRC_WITHOUT_EXT= ${SRC_NAME}")
        set_source_files_properties(${SRC} PROPERTIES COMPILE_FLAGS -DCUST_FILE_BASE=${SRC_NAME})
    endforeach()
endfunction()