#=============================================================================#
#                         Smin${FOLDER_BASE}/Libraries/Adafruit_BME280_Library/Adafruit_BME280.cppg Library cmake script
#=============================================================================#
#message("srcs.cmake: SMING Lists of Souce Code filenames")
#message("-----------------------------------------------")

set(FOLDER_BASE $ENV{SMING_HOME} )

if(SMING_ARCH STREQUAL "Esp8266")
    set(Sming_CXX_SOURCES
        ${FOLDER_BASE}/Arch/Esp8266/Components/driver/uart.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Components/driver/SerialBuffer.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/esp_cplusplus.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/libc.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/startup.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/core_esp8266_si2c.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/Digital.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/ESP8266EX.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/HardwarePWM.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/HardwareTimer.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/Interrupts.cpp
            #${FOLDER_BASE}/Arch/Esp8266/Core/Network/rBootHttpUpdate.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/SPI.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Core/SPISoft.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Platform/AccessPointImpl.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Platform/RTC.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Platform/StationImpl.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Platform/WifiEventsImpl.cpp
        ${FOLDER_BASE}/Arch/Esp8266/Platform/WifiSniffer.cpp
        #PARENT_SCOPE
    )
elseif(SMING_ARCH STREQUAL "Host")

    set(Sming_CXX_SOURCES
        ${FOLDER_BASE}/Arch/Esp8266/Components/driver/SerialBuffer.cpp
        ${FOLDER_BASE}/Arch/Host/Components/driver/adc.cpp
        ${FOLDER_BASE}/Arch/Host/Components/driver/uart.cpp
        ${FOLDER_BASE}/Arch/Host/Components/driver/uart_server.cpp

        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/random.cpp
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/system.cpp
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/tasks.cpp
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/timer_legacy.cpp
        ${FOLDER_BASE}/Arch/Host/Components/gdbstub/gdb_syscall.cpp
        ${FOLDER_BASE}/Arch/Host/Components/spi_flash/flashmem.cpp
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/options.cpp
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/sockets.cpp
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/startup.cpp
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/threads.cpp
        ${FOLDER_BASE}/Arch/Host/Core/Digital.cpp
        ${FOLDER_BASE}/Arch/Host/Core/DigitalHooks.cpp
        ${FOLDER_BASE}/Arch/Host/Core/HardwarePWM.cpp
        ${FOLDER_BASE}/Arch/Host/Core/HardwareTimer.cpp
        ${FOLDER_BASE}/Arch/Host/Core/Interrupts.cpp
        ${FOLDER_BASE}/Arch/Host/Platform/AccessPointImpl.cpp
        ${FOLDER_BASE}/Arch/Host/Platform/RTC.cpp
        ${FOLDER_BASE}/Arch/Host/Platform/StationImpl.cpp
        ${FOLDER_BASE}/Arch/Host/Platform/WifiEventsImpl.cpp
        ${FOLDER_BASE}/Components/rboot/host/rboot.cpp
        #PARENT_SCOPE
        )
endif()

list(APPEND Sming_CXX_SOURCES
    ${FOLDER_BASE}/Core/ArduinoCompat.cpp
    ${FOLDER_BASE}/Core/AtClient.cpp
    ${FOLDER_BASE}/Core/Clock.cpp
    ${FOLDER_BASE}/Core/Data/Buffer/CircularBuffer.cpp
    ${FOLDER_BASE}/Core/Data/CStringArray.cpp
    ${FOLDER_BASE}/Core/Data/HexString.cpp
    ${FOLDER_BASE}/Core/Data/MailMessage.cpp
    ${FOLDER_BASE}/Core/Data/Stream/Base64OutputStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/ChunkedStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/DataSourceStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/EndlessMemoryStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/FileStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/FlashMemoryStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/GdbFileStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/JsonObjectStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/LimitedMemoryStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/MemoryDataStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/MultipartStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/MultiStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/QuotedPrintableOutputStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/RbootOutputStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/ReadWriteStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/TemplateStream.cpp
    ${FOLDER_BASE}/Core/Data/Stream/UrlencodedOutputStream.cpp
    ${FOLDER_BASE}/Core/Data/StreamTransformer.cpp
    ${FOLDER_BASE}/Core/DateTime.cpp
    ${FOLDER_BASE}/Core/Debug.cpp
    ${FOLDER_BASE}/Core/FileSystem.cpp
    ${FOLDER_BASE}/Core/HardwareSerial.cpp
    ${FOLDER_BASE}/Core/Network/DNSServer.cpp
    ${FOLDER_BASE}/Core/Network/Ftp/FtpServerConnection.cpp
    ${FOLDER_BASE}/Core/Network/FtpServer.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpBodyParser.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpClientConnection.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpCommon.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpConnection.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpHeaders.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpParams.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpRequest.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpRequestAuth.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpResourceTree.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpResponse.cpp
    ${FOLDER_BASE}/Core/Network/Http/HttpServerConnection.cpp
    ${FOLDER_BASE}/Core/Network/Http/Websocket/WebsocketConnection.cpp
    ${FOLDER_BASE}/Core/Network/Http/Websocket/WebsocketResource.cpp
    ${FOLDER_BASE}/Core/Network/HttpClient.cpp
    ${FOLDER_BASE}/Core/Network/HttpServer.cpp
    ${FOLDER_BASE}/Core/Network/Mqtt/MqttPayloadParser.cpp
    ${FOLDER_BASE}/Core/Network/MqttClient.cpp
    ${FOLDER_BASE}/Core/Network/NetUtils.cpp
    ${FOLDER_BASE}/Core/Network/NtpClient.cpp
    ${FOLDER_BASE}/Core/Network/RbootHttpUpdater.cpp
    ${FOLDER_BASE}/Core/Network/SmtpClient.cpp
    ${FOLDER_BASE}/Core/Network/Ssl/SslFingerprints.cpp
    ${FOLDER_BASE}/Core/Network/Ssl/SslValidator.cpp
    ${FOLDER_BASE}/Core/Network/TcpClient.cpp
    ${FOLDER_BASE}/Core/Network/TcpConnection.cpp
    ${FOLDER_BASE}/Core/Network/TcpServer.cpp
    ${FOLDER_BASE}/Core/Network/TelnetServer.cpp
    ${FOLDER_BASE}/Core/Network/UdpConnection.cpp
    ${FOLDER_BASE}/Core/Network/Url.cpp
    ${FOLDER_BASE}/Core/Network/WebConstants.cpp
    ${FOLDER_BASE}/Core/Network/WebHelpers/aw-sha1.cpp
    ${FOLDER_BASE}/Core/Network/WebHelpers/base64.cpp
    ${FOLDER_BASE}/Core/Network/WebHelpers/escape.cpp
    ${FOLDER_BASE}/Core/Network/WebsocketClient.cpp
    ${FOLDER_BASE}/Core/SystemClock.cpp
    ${FOLDER_BASE}/Core/Timer.cpp
    ${FOLDER_BASE}/Core/Wire.cpp
    ${FOLDER_BASE}/Platform/AccessPoint.cpp
    ${FOLDER_BASE}/Platform/BssInfo.cpp
    ${FOLDER_BASE}/Platform/Station.cpp
    ${FOLDER_BASE}/Platform/OsMessageInterceptor.cpp
    ${FOLDER_BASE}/Platform/System.cpp
    ${FOLDER_BASE}/Platform/WDT.cpp
    ${FOLDER_BASE}/Platform/WifiEvents.cpp
    ${FOLDER_BASE}/Services/CommandProcessing/CommandDelegate.cpp
    ${FOLDER_BASE}/Services/CommandProcessing/CommandExecutor.cpp
    ${FOLDER_BASE}/Services/CommandProcessing/CommandHandler.cpp
    ${FOLDER_BASE}/Services/CommandProcessing/CommandOutput.cpp
    ${FOLDER_BASE}/Services/HexDump/HexDump.cpp
    ${FOLDER_BASE}/Services/Yeelight/YeelightBulb.cpp
    ${FOLDER_BASE}/System/m_printf.cpp
    ${FOLDER_BASE}/System/stringconversion.cpp
    ${FOLDER_BASE}/System/stringutil.cpp
    ${FOLDER_BASE}/Wiring/FakePgmSpace.cpp
    ${FOLDER_BASE}/Wiring/MacAddress.cpp
    ${FOLDER_BASE}/Wiring/IpAddress.cpp
    ${FOLDER_BASE}/Wiring/Print.cpp
    ${FOLDER_BASE}/Wiring/SplitString.cpp
    ${FOLDER_BASE}/Wiring/Stream.cpp
    ${FOLDER_BASE}/Wiring/WMath.cpp
    ${FOLDER_BASE}/Wiring/WShift.cpp
    ${FOLDER_BASE}/Wiring/WString.cpp
    ${FOLDER_BASE}/Components/MultipartParser/HttpMultipartResource.cpp
    ${FOLDER_BASE}/Components/MultipartParser/MultipartParser.cpp
)


set(LIBRARY_FOLDER ${FOLDER_BASE}/Libraries)


set(Sming_C_SRCS 
    ${FOLDER_BASE}/Components/spiffs/spiffs_sming.c
    #${FOLDER_BASE}/Components/http-parser/http_parser.c
    ${FOLDER_BASE}/Components/libb64/cdecode.c
    ${FOLDER_BASE}/Components/libb64/cencode.c
    #${FOLDER_BASE}/Components/libyuarel/yuarel.c
    #${FOLDER_BASE}/Components/mqtt-codec/src/buffer.c
    #${FOLDER_BASE}/Components/mqtt-codec/src/errors.c
    #${FOLDER_BASE}/Components/mqtt-codec/src/message.c
    #${FOLDER_BASE}/Components/mqtt-codec/src/parser.c
    #${FOLDER_BASE}/Components/mqtt-codec/src/serialiser.c
    #${FOLDER_BASE}/Components/spiffs/src/spiffs_cache.c
    #${FOLDER_BASE}/Components/spiffs/src/spiffs_check.c
    #${FOLDER_BASE}/Components/spiffs/src/spiffs_gc.c
    #${FOLDER_BASE}/Components/spiffs/src/spiffs_hydrogen.c
    #${FOLDER_BASE}/Components/spiffs/src/spiffs_nucleus.c
    #${FOLDER_BASE}/Components/ws_parser/ws_parser.c
)

if(SMING_ARCH STREQUAL "Esp8266")
    list(APPEND Sming_C_SRCS 
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/crash_handler.c
        ${FOLDER_BASE}/Arch/Esp8266/Components/fatfs/ff.c
        ${FOLDER_BASE}/Arch/Esp8266/Components/spi_flash/flashmem.c
    )
else(SMING_ARCH STREQUAL "Host")
    list(APPEND Sming_C_SRCS 
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/clk.c
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/libc.c
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/sleep.c
        #${FOLDER_BASE}/Arch/Host/Components/esp_wifi/esp_wifi.c
        ${FOLDER_BASE}/Arch/Host/Components/gdbstub/gdbstub.c
        ${FOLDER_BASE}/Arch/Host/Components/heap/heap.c
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/except.c
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/hostlib.c
        ${FOLDER_BASE}/Arch/Host/Components/hostlib/hostmsg.c
        ${FOLDER_BASE}/Arch/Host/Components/libc/memmem.c
    )
endif()


if(SMING_ARCH STREQUAL "Esp8266")
    set(Sming_ASM_SRCS
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/irq_check.s
        )
else()
    set(Sming_ASM_SRCS )
endif()

#========================================================================
#  TODO: Add libraries in - we need a decision on this!
#========================================================================
if(false)
    list(APPEND Sming_CXX_SOURCES
        ${FOLDER_BASE}/Libraries/Adafruit_GFX/Adafruit_GFX.cpp
        ${FOLDER_BASE}/Libraries/AM2321/AM2321.cpp
        ${FOLDER_BASE}/Libraries/APA102/apa102.cpp
        ${FOLDER_BASE}/Libraries/BH1750FVI/BH1750FVI.cpp
        ${FOLDER_BASE}/Libraries/BMP180/BMP180.cpp
        ${FOLDER_BASE}/Libraries/Bounce/Bounce.cpp
        ${FOLDER_BASE}/Libraries/DS18S20/ds18s20.cpp
        ${FOLDER_BASE}/Libraries/DS3232RTC/DS3232RTC.cpp
        ${FOLDER_BASE}/Libraries/HMC5883L/HMC5883L.cpp
        ${FOLDER_BASE}/Libraries/I2Cdev/I2Cdev.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/FastIO.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/I2CIO.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/LCD.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/LiquidCrystal_I2C.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/LiquidCrystal_SR.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/LiquidCrystal_SR2W.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/LiquidCrystal_SR3W.cpp
        ${FOLDER_BASE}/Libraries/LiquidCrystal/LiquidCrystal.cpp
        ${FOLDER_BASE}/Libraries/MCP23017/MCP23017.cpp
        ${FOLDER_BASE}/Libraries/MFRC522/MFRC522.cpp
        ${FOLDER_BASE}/Libraries/Mirf/Mirf.cpp
        ${FOLDER_BASE}/Libraries/MMA_7455/MMA_7455.cpp
        ${FOLDER_BASE}/Libraries/OneWire/OneWire.cpp
        ${FOLDER_BASE}/Libraries/RCSwitch/RCSwitch.cpp
        ${FOLDER_BASE}/Libraries/Servo/Servo.cpp
        ${FOLDER_BASE}/Libraries/Servo/ServoChannel.cpp
        ${FOLDER_BASE}/Libraries/si4432/si4432.cpp
        ${FOLDER_BASE}/Libraries/SI7021/SI7021.cpp
        ${FOLDER_BASE}/Libraries/SparkFun_APDS9960/SparkFun_APDS9960.cpp
        #${FOLDER_BASE}/Libraries/TM1637/TM1637Display.cpp
        ${FOLDER_BASE}/Libraries/Ultrasonic/Ultrasonic.cpp
    )
    if(SMING_ARCH STREQUAL "Esp8266")
        list(APPEND Sming_CXX_SOURCES
            ${FOLDER_BASE}/Libraries/Adafruit_ILI9341/Adafruit_ILI9341.cpp
            ${FOLDER_BASE}/Libraries/Adafruit_NeoPixel/Adafruit_NeoPixel.cpp
            ${FOLDER_BASE}/Libraries/Adafruit_PCD8544/Adafruit_PCD8544.cpp
            ${FOLDER_BASE}/Libraries/ArduCAM/ArduCAM.cpp
            ${FOLDER_BASE}/Libraries/ArduCAM/ArduCAMStream.cpp
            ${FOLDER_BASE}/Libraries/CapacitiveSensor/CapacitiveSensor.cpp
            ${FOLDER_BASE}/Libraries/MCP23S17/MCP23S17.cpp
            ${FOLDER_BASE}/Libraries/RF24/RF24.cpp
            ${FOLDER_BASE}/Libraries/SDCard/SDCard.cpp
            ${FOLDER_BASE}/Libraries/TFT_ILI9163C/TFT_ILI9163C.cpp
            ${FOLDER_BASE}/Libraries/WS2812/WS2812.cpp
        )
    endif()

    list(APPEND Sming_C_SRCS 
        ${FOLDER_BASE}/Libraries/Adafruit_GFX/glcdfont.c
    )

    if(SMING_ARCH STREQUAL "Esp8266")
        list(APPEND Sming_C_SRCS 
            ${FOLDER_BASE}/Libraries/Adafruit_ILI9341/hspi.c
        )
    endif()

endif()


#========================================================================

if(SMING_ARCH STREQUAL "Esp8266")
    set(SmingIncludes
        ${FOLDER_BASE}/Arch/Esp8266
        ${FOLDER_BASE}/Arch/Esp8266/Core
        ${FOLDER_BASE}/Arch/Esp8266/System/include
        ${FOLDER_BASE}/Arch/Esp8266/Components
        ${FOLDER_BASE}/Components
        ${FOLDER_BASE}/System/include
        ${FOLDER_BASE}/Wiring
        ${FOLDER_BASE}/Core
        ${FOLDER_BASE}/.
        ${FOLDER_BASE}/Components/mqtt-codec/src
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/Sdk/ESP8266_NONOS_SDK/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/spi_flash/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/driver/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp_wifi/include
        ${FOLDER_BASE}/Components/rboot/rboot
        ${FOLDER_BASE}/Components/rboot/rboot/appcode
        ${FOLDER_BASE}/Components/spiffs
        ${FOLDER_BASE}/Components/spiffs/src
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp-open-lwip/esp-open-lwip/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/include
        ${FOLDER_BASE}/Components/MultipartParser
        )
elseif(SMING_ARCH STREQUAL "Host")
    set(SmingIncludes
        ${FOLDER_BASE}/Arch/Host
        ${FOLDER_BASE}/Arch/Host/Core
        ${FOLDER_BASE}/Arch/Host/System/include
        ${FOLDER_BASE}/Arch/Host/Components
        ${FOLDER_BASE}/Components
        ${FOLDER_BASE}/System/include
        ${FOLDER_BASE}/Wiring
        ${FOLDER_BASE}/Core
        ${FOLDER_BASE}/.
        ${FOLDER_BASE}/Components/mqtt-codec/src
        ${FOLDER_BASE}/Arch/Host/Components/esp_hal/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp8266/include
        ${FOLDER_BASE}/Arch/Host/Components/driver/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/driver/include
        ${FOLDER_BASE}/Arch/Host/Components/spi_flash/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/spi_flash/include
        ${FOLDER_BASE}/Arch/Host/Components/heap/include
        ${FOLDER_BASE}/Arch/Host/Components/esp_wifi/include
        ${FOLDER_BASE}/Arch/Host/Components/lwip
        ${FOLDER_BASE}/Arch/Host/Components/lwip/lwip/src/include
        ${FOLDER_BASE}/Arch/Host/Components/lwip/lwip/contrib/ports/unix/port/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/spiffs
        ${FOLDER_BASE}/Components/spiffs/src
        ${FOLDER_BASE}/Components/MultipartParser
    )
endif()


if(SMING_ARCH STREQUAL "Esp8266")
    list(APPEND SmingIncludes 
        ${FOLDER_BASE}/Arch/Esp8266/Components/spi_flash/include
        ${FOLDER_BASE}/Arch/Esp8266/Components/esp_wifi/include
        )
else()
    list(APPEND SmingIncludes 
        ${FOLDER_BASE}/Arch/Host/Components/spi_flash/include 
        ${FOLDER_BASE}/Arch/Host/Components/esp_wifi/include
        )
endif()



