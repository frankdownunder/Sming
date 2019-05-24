#basic definitions
message("autoIncrementScript passed arguments as ${ARG_HEADER_FILE} and ${ARG_CACHE_FILE}")

#Reading data from file + incrementation
IF(EXISTS ${ARG_CACHE_FILE})
    file(READ ${ARG_CACHE_FILE} INCREMENTED_VALUE)
    math(EXPR INCREMENTED_VALUE "${INCREMENTED_VALUE}+1")
ELSE()
    set(INCREMENTED_VALUE "1\n")
ENDIF()

#Update the cache
file(WRITE ${ARG_CACHE_FILE} "${INCREMENTED_VALUE}\n")

#Create the header
file(WRITE ${ARG_HEADER_FILE} "#pragma once\n\n#define VERSION_BUILD ${INCREMENTED_VALUE}\n\n")
