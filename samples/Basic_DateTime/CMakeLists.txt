cmake_minimum_required(VERSION 3.9)

project(sming-test LANGUAGES C CXX)


include("${CMAKE_SOURCE_DIR}/../Sming/sming.cmake")


set(SOURCES
    "app/application.cpp"
)

# uncomment to include files from subdirectory 'files' as spiffs
#sming_spiff_files("${CMAKE_CURRENT_SOURCE_DIR}/files")

#sming_standalone_image(blink ${SOURCES})

sming_rboot_image(blink_rboot ${SOURCES})

#sming_rboot_gpio_image(blink_fallback ${SOURCES})
