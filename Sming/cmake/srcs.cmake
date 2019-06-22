#=============================================================================#
#                         Smin${FOLDER_BASE}Libraries/Adafruit_BME280_Library/Adafruit_BME280.cppg Library cmake script
#=============================================================================#
#message("srcs.cmake: SMING Lists of Souce Code filenames")
#message("-----------------------------------------------")

set(FOLDER_BASE  )

if(SMING_ARCH STREQUAL "Esp8266")
    set(Sming_CXX_SOURCES
        ${FOLDER_BASE}Arch/Esp8266/Components/driver/uart.cpp
        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/esp_cplusplus.cpp
        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/startup.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/core_esp8266_si2c.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/Digital.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/ESP8266EX.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/HardwarePWM.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/HardwareTimer.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/Interrupts.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/Network/rBootHttpUpdate.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/SPI.cpp
        ${FOLDER_BASE}Arch/Esp8266/Core/SPISoft.cpp
        ${FOLDER_BASE}Arch/Esp8266/Platform/AccessPoint.cpp
        ${FOLDER_BASE}Arch/Esp8266/Platform/RTC.cpp
        ${FOLDER_BASE}Arch/Esp8266/Platform/Station.cpp
        ${FOLDER_BASE}Arch/Esp8266/Platform/WifiEvents.cpp
        ${FOLDER_BASE}Arch/Esp8266/Platform/WifiSniffer.cpp
        #PARENT_SCOPE
    )
elseif(SMING_ARCH STREQUAL "Host")

    set(Sming_CXX_SOURCES
        ${FOLDER_BASE}Arch/Host/Components/driver/uart.cpp
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/system.cpp
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/tasks.cpp
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/timer_legacy.cpp
        ${FOLDER_BASE}Arch/Host/Components/gdbstub/gdb_syscall.cpp
        ${FOLDER_BASE}Arch/Host/Components/hostlib/flashmem.cpp
        ${FOLDER_BASE}Arch/Host/Components/hostlib/options.cpp
        ${FOLDER_BASE}Arch/Host/Components/hostlib/sockets.cpp
        ${FOLDER_BASE}Arch/Host/Components/hostlib/startup.cpp
        ${FOLDER_BASE}Arch/Host/Components/hostlib/uart_server.cpp
        ${FOLDER_BASE}Arch/Host/Core/Digital.cpp
        ${FOLDER_BASE}Arch/Host/Core/HardwareTimer.cpp
        ${FOLDER_BASE}Arch/Host/Core/Interrupts.cpp
        ${FOLDER_BASE}Arch/Host/Platform/AccessPoint.cpp
        ${FOLDER_BASE}Arch/Host/Platform/RTC.cpp
        ${FOLDER_BASE}Arch/Host/Platform/Station.cpp
        ${FOLDER_BASE}Arch/Host/Platform/WifiEvents.cpp
        #PARENT_SCOPE
        )
endif()

list(APPEND Sming_CXX_SOURCES
    ${FOLDER_BASE}Core/ArduinoCompat.cpp
    ${FOLDER_BASE}Core/AtClient.cpp
    ${FOLDER_BASE}Core/Clock.cpp
    ${FOLDER_BASE}Core/Data/Buffer/CircularBuffer.cpp
    ${FOLDER_BASE}Core/Data/Buffer/SerialBuffer.cpp
    ${FOLDER_BASE}Core/Data/CStringArray.cpp
    ${FOLDER_BASE}Core/Data/HexString.cpp
    ${FOLDER_BASE}Core/Data/MailMessage.cpp
    ${FOLDER_BASE}Core/Data/Stream/Base64OutputStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/ChunkedStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/DataSourceStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/EndlessMemoryStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/FileStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/FlashMemoryStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/GdbFileStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/JsonObjectStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/LimitedMemoryStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/MemoryDataStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/MultipartStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/MultiStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/QuotedPrintableOutputStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/ReadWriteStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/TemplateStream.cpp
    ${FOLDER_BASE}Core/Data/Stream/UrlencodedOutputStream.cpp
    ${FOLDER_BASE}Core/Data/StreamTransformer.cpp
    ${FOLDER_BASE}Core/DateTime.cpp
    ${FOLDER_BASE}Core/Debug.cpp
    ${FOLDER_BASE}Core/FileSystem.cpp
    ${FOLDER_BASE}Core/HardwareSerial.cpp
    ${FOLDER_BASE}Core/Network/DNSServer.cpp
    ${FOLDER_BASE}Core/Network/Ftp/FtpServerConnection.cpp
    ${FOLDER_BASE}Core/Network/FtpServer.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpBodyParser.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpClientConnection.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpCommon.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpConnection.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpHeaders.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpParams.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpRequest.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpRequestAuth.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpResourceTree.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpResponse.cpp
    ${FOLDER_BASE}Core/Network/Http/HttpServerConnection.cpp
    ${FOLDER_BASE}Core/Network/Http/Websocket/WebsocketConnection.cpp
    ${FOLDER_BASE}Core/Network/Http/Websocket/WebsocketResource.cpp
    ${FOLDER_BASE}Core/Network/HttpClient.cpp
    ${FOLDER_BASE}Core/Network/HttpServer.cpp
    ${FOLDER_BASE}Core/Network/Mqtt/MqttPayloadParser.cpp
    ${FOLDER_BASE}Core/Network/MqttClient.cpp
    ${FOLDER_BASE}Core/Network/NetUtils.cpp
    ${FOLDER_BASE}Core/Network/NtpClient.cpp
    ${FOLDER_BASE}Core/Network/SmtpClient.cpp
    ${FOLDER_BASE}Core/Network/Ssl/SslFingerprints.cpp
    ${FOLDER_BASE}Core/Network/Ssl/SslValidator.cpp
    ${FOLDER_BASE}Core/Network/TcpClient.cpp
    ${FOLDER_BASE}Core/Network/TcpConnection.cpp
    ${FOLDER_BASE}Core/Network/TcpServer.cpp
    ${FOLDER_BASE}Core/Network/TelnetServer.cpp
    ${FOLDER_BASE}Core/Network/UdpConnection.cpp
    ${FOLDER_BASE}Core/Network/Url.cpp
    ${FOLDER_BASE}Core/Network/WebConstants.cpp
    ${FOLDER_BASE}Core/Network/WebHelpers/aw-sha1.cpp
    ${FOLDER_BASE}Core/Network/WebHelpers/base64.cpp
    ${FOLDER_BASE}Core/Network/WebHelpers/escape.cpp
    ${FOLDER_BASE}Core/Network/WebsocketClient.cpp
    ${FOLDER_BASE}Core/SystemClock.cpp
    ${FOLDER_BASE}Core/Timer.cpp
    ${FOLDER_BASE}Core/Wire.cpp
    ${FOLDER_BASE}Platform/OsMessageInterceptor.cpp
    ${FOLDER_BASE}Platform/System.cpp
    ${FOLDER_BASE}Platform/WDT.cpp
    ${FOLDER_BASE}Services/CommandProcessing/CommandDelegate.cpp
    ${FOLDER_BASE}Services/CommandProcessing/CommandExecutor.cpp
    ${FOLDER_BASE}Services/CommandProcessing/CommandHandler.cpp
    ${FOLDER_BASE}Services/CommandProcessing/CommandOutput.cpp
    ${FOLDER_BASE}Services/HexDump/HexDump.cpp
    ${FOLDER_BASE}Services/Yeelight/YeelightBulb.cpp
    ${FOLDER_BASE}System/m_printf.cpp
    ${FOLDER_BASE}System/stringconversion.cpp
    ${FOLDER_BASE}System/stringutil.cpp
    ${FOLDER_BASE}Wiring/FakePgmSpace.cpp
    ${FOLDER_BASE}Wiring/IPAddress.cpp
    ${FOLDER_BASE}Wiring/Print.cpp
    ${FOLDER_BASE}Wiring/SplitString.cpp
    ${FOLDER_BASE}Wiring/Stream.cpp
    ${FOLDER_BASE}Wiring/WMath.cpp
    ${FOLDER_BASE}Wiring/WShift.cpp
    ${FOLDER_BASE}Wiring/WString.cpp
)


set(LIBRARY_FOLDER ${FOLDER_BASE}Libraries)


set(Sming_C_SRCS 
    ${FOLDER_BASE}Arch/Esp8266/Components/spiffs/spiffs_sming.c
    #${FOLDER_BASE}Components/http-parser/http_parser.c
    ${FOLDER_BASE}Components/libb64/cdecode.c
    ${FOLDER_BASE}Components/libb64/cencode.c
    #${FOLDER_BASE}Components/libyuarel/yuarel.c
    #${FOLDER_BASE}Components/mqtt-codec/src/buffer.c
    #${FOLDER_BASE}Components/mqtt-codec/src/errors.c
    #${FOLDER_BASE}Components/mqtt-codec/src/message.c
    #${FOLDER_BASE}Components/mqtt-codec/src/parser.c
    #${FOLDER_BASE}Components/mqtt-codec/src/serialiser.c
    #${FOLDER_BASE}Components/spiffs/src/spiffs_cache.c
    #${FOLDER_BASE}Components/spiffs/src/spiffs_check.c
    #${FOLDER_BASE}Components/spiffs/src/spiffs_gc.c
    #${FOLDER_BASE}Components/spiffs/src/spiffs_hydrogen.c
    #${FOLDER_BASE}Components/spiffs/src/spiffs_nucleus.c
    #${FOLDER_BASE}Components/ws_parser/ws_parser.c
)

if(SMING_ARCH STREQUAL "Esp8266")
    list(APPEND Sming_C_SRCS 
        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/crash_handler.c
        ${FOLDER_BASE}Arch/Esp8266/Components/fatfs/ff.c
        ${FOLDER_BASE}Arch/Esp8266/Components/spi_flash/flashmem.c
    )
else(SMING_ARCH STREQUAL "Host")
    list(APPEND Sming_C_SRCS 
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/clk.c
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/libc.c
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/sleep.c
        ${FOLDER_BASE}Arch/Host/Components/esp_wifi/esp_wifi.c
        ${FOLDER_BASE}Arch/Host/Components/gdbstub/gdbstub.c
        ${FOLDER_BASE}Arch/Host/Components/heap/heap.c
        ${FOLDER_BASE}Arch/Host/Components/hostlib/except.c
        ${FOLDER_BASE}Arch/Host/Components/hostlib/hostlib.c
        ${FOLDER_BASE}Arch/Host/Components/hostlib/hostmsg.c
        ${FOLDER_BASE}Arch/Host/Components/libc/memmem.c
    )
endif()


if(SMING_ARCH STREQUAL "Esp8266")
    set(Sming_ASM_SRCS
        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/irq_check.s
        )
else()
    set(Sming_ASM_SRCS )
endif()

#========================================================================
#  TODO: Add libraries in - we need a decision on this!
#========================================================================
if(false)
    list(APPEND Sming_CXX_SOURCES
        #${FOLDER_BASE}Libraries/Adafruit_BME280_Library/Adafruit_BME280.cpp
        ${FOLDER_BASE}Libraries/Adafruit_GFX/Adafruit_GFX.cpp
        #${FOLDER_BASE}Libraries/Adafruit_ST7735/Adafruit_ST7735.cpp
        ${FOLDER_BASE}Libraries/AM2321/AM2321.cpp
        ${FOLDER_BASE}Libraries/APA102/apa102.cpp
        ${FOLDER_BASE}Libraries/BH1750FVI/BH1750FVI.cpp
        ${FOLDER_BASE}Libraries/BMP180/BMP180.cpp
        ${FOLDER_BASE}Libraries/Bounce/Bounce.cpp
        #${FOLDER_BASE}Libraries/DFRobotDFPlayerMini/DFRobotDFPlayerMini.cpp
        #${FOLDER_BASE}Libraries/DHTesp/DHTesp.cpp
        ${FOLDER_BASE}Libraries/DS18S20/ds18s20.cpp
        ${FOLDER_BASE}Libraries/DS3232RTC/DS3232RTC.cpp
        ${FOLDER_BASE}Libraries/HMC5883L/HMC5883L.cpp
        ${FOLDER_BASE}Libraries/I2Cdev/I2Cdev.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexButton.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexCheckbox.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexCrop.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexDualStateButton.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexGauge.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexGpio.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexHardware.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexHotspot.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexNumber.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexObject.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexPage.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexPicture.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexProgressBar.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexRadio.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexRtc.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexScrolltext.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexSlider.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexText.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexTimer.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexTouch.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexVariable.cpp
        #${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion/NexWaveform.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/FastIO.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/I2CIO.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/LCD.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/LiquidCrystal_I2C.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/LiquidCrystal_SR.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/LiquidCrystal_SR2W.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/LiquidCrystal_SR3W.cpp
        ${FOLDER_BASE}Libraries/LiquidCrystal/LiquidCrystal.cpp
        ${FOLDER_BASE}Libraries/MCP23017/MCP23017.cpp
        ${FOLDER_BASE}Libraries/MFRC522/MFRC522.cpp
        ${FOLDER_BASE}Libraries/Mirf/Mirf.cpp
        ${FOLDER_BASE}Libraries/MMA_7455/MMA_7455.cpp
        ${FOLDER_BASE}Libraries/OneWire/OneWire.cpp
        ${FOLDER_BASE}Libraries/RCSwitch/RCSwitch.cpp
        ${FOLDER_BASE}Libraries/Servo/Servo.cpp
        ${FOLDER_BASE}Libraries/Servo/ServoChannel.cpp
        ${FOLDER_BASE}Libraries/si4432/si4432.cpp
        ${FOLDER_BASE}Libraries/SI7021/SI7021.cpp
        ${FOLDER_BASE}Libraries/SparkFun_APDS9960/SparkFun_APDS9960.cpp
        #${FOLDER_BASE}Libraries/TM1637/TM1637Display.cpp
        ${FOLDER_BASE}Libraries/Ultrasonic/Ultrasonic.cpp
    )
    if(SMING_ARCH STREQUAL "Esp8266")
        list(APPEND Sming_CXX_SOURCES
            ${FOLDER_BASE}Libraries/Adafruit_ILI9341/Adafruit_ILI9341.cpp
            ${FOLDER_BASE}Libraries/Adafruit_NeoPixel/Adafruit_NeoPixel.cpp
            ${FOLDER_BASE}Libraries/Adafruit_PCD8544/Adafruit_PCD8544.cpp
            #${FOLDER_BASE}Libraries/Adafruit_SSD1306/Adafruit_SSD1306.cpp
            ${FOLDER_BASE}Libraries/ArduCAM/ArduCAM.cpp
            ${FOLDER_BASE}Libraries/ArduCAM/ArduCAMStream.cpp
            ${FOLDER_BASE}Libraries/CapacitiveSensor/CapacitiveSensor.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Aiwa.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Argo.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Carrier.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Coolix.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Daikin.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Denon.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Dish.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Fujitsu.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_GlobalCache.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Gree.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Haier.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_JVC.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Kelvinator.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Lasertag.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_LG.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Magiquest.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Midea.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Mitsubishi.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_NEC.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Nikai.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Panasonic.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Pronto.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_RC5_RC6.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_RCMM.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Samsung.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Sanyo.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Sharp.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Sherwood.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Sony.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Toshiba.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Trotec.cpp
            #${FOLDER_BASE}Libraries/IR/src/ir_Whynter.cpp
            #${FOLDER_BASE}Libraries/IR/src/IRrecv.cpp
            #${FOLDER_BASE}Libraries/IR/src/IRsend.cpp
            #${FOLDER_BASE}Libraries/IR/src/IRtimer.cpp
            #${FOLDER_BASE}Libraries/IR/src/IRutils.cpp
            ${FOLDER_BASE}Libraries/MCP23S17/MCP23S17.cpp
            ${FOLDER_BASE}Libraries/RF24/RF24.cpp
            ${FOLDER_BASE}Libraries/SDCard/SDCard.cpp
            ${FOLDER_BASE}Libraries/TFT_ILI9163C/TFT_ILI9163C.cpp
            ${FOLDER_BASE}Libraries/WS2812/WS2812.cpp
        )
    endif()

    list(APPEND Sming_C_SRCS 
        ${FOLDER_BASE}Libraries/Adafruit_GFX/glcdfont.c
    )

    if(SMING_ARCH STREQUAL "Esp8266")
        list(APPEND Sming_C_SRCS 
            ${FOLDER_BASE}Libraries/Adafruit_ILI9341/hspi.c
        )
    endif()

endif()


#========================================================================

if(SMING_ARCH STREQUAL "Esp8266")
    set(SmingIncludes
        ${FOLDER_BASE}Arch/Esp8266
        ${FOLDER_BASE}Arch/Esp8266/Core
        ${FOLDER_BASE}Arch/Esp8266/System/include
        ${FOLDER_BASE}Arch/Esp8266/Components
        ${FOLDER_BASE}Components
        ${FOLDER_BASE}System/include
        ${FOLDER_BASE}Wiring
        ${FOLDER_BASE}Core
        ${FOLDER_BASE}.
        ${FOLDER_BASE}Components/mqtt-codec/src
        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/include
        ${FOLDER_BASE}${FOLDER_BASE}Arch/Esp8266/Components/Sdk/ESP8266_NONOS_SDK/include
        ${FOLDER_BASE}Arch/Esp8266/Components/spi_flash/include
        ${FOLDER_BASE}Arch/Esp8266/Components/driver/include
        ${FOLDER_BASE}Arch/Esp8266/Components/esp_wifi/include
        ${FOLDER_BASE}Arch/Esp8266/Components/rboot/rboot
        ${FOLDER_BASE}Arch/Esp8266/Components/rboot/rboot/appcode
        ${FOLDER_BASE}Arch/Esp8266/Components/spiffs
        ${FOLDER_BASE}Components/spiffs/src
        ${FOLDER_BASE}Arch/Esp8266/Components/esp-open-lwip/esp-open-lwip/include

        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/include
        )
elseif(SMING_ARCH STREQUAL "Host")
    set(SmingIncludes
        ${FOLDER_BASE}Arch/Host
        ${FOLDER_BASE}Arch/Host/Core
        ${FOLDER_BASE}Arch/Host/System/include
        ${FOLDER_BASE}Arch/Host/Components
        ${FOLDER_BASE}Components
        ${FOLDER_BASE}System/include
        ${FOLDER_BASE}Wiring
        ${FOLDER_BASE}Core
        ${FOLDER_BASE}.
        ${FOLDER_BASE}Components/mqtt-codec/src
        ${FOLDER_BASE}Arch/Host/Components/esp_hal/include
        ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/include
        ${FOLDER_BASE}Arch/Host/Components/driver/include
        ${FOLDER_BASE}Arch/Esp8266/Components/driver/include
        ${FOLDER_BASE}Arch/Host/Components/spi_flash/include
        ${FOLDER_BASE}Arch/Esp8266/Components/spi_flash/include
        ${FOLDER_BASE}Arch/Host/Components/heap/include
        ${FOLDER_BASE}Arch/Host/Components/esp_wifi/include
        ${FOLDER_BASE}Arch/Host/Components/lwip
        ${FOLDER_BASE}Arch/Host/Components/lwip/lwip/src/include
        ${FOLDER_BASE}Arch/Host/Components/lwip/lwip/contrib/ports/unix/port/include
        ${FOLDER_BASE}Arch/Esp8266/Components/spiffs
        ${FOLDER_BASE}Components/spiffs/src
    )
endif()

set(SmingIncludesXX 
    ${FOLDER_BASE}Arch/Esp8266/Components/Sdk/ESP8266_NONOS_SDK/include
    ${FOLDER_BASE}System
    ${FOLDER_BASE}Arch/Esp8266/System
    ${FOLDER_BASE}Wiring
    ${FOLDER_BASE}Arch/Esp8266/Core
    ${FOLDER_BASE}Arch/Esp8266/Core/Network
    ${FOLDER_BASE}Arch/Esp8266/Platform
    ${FOLDER_BASE}Platform

    ${FOLDER_BASE}Core
    ${FOLDER_BASE}Core/Data
    ${FOLDER_BASE}Core/Data/Buffer
    ${FOLDER_BASE}Core/Data/Stream
    ${FOLDER_BASE}Core/Network
    ${FOLDER_BASE}Core/Network/Ftp
    ${FOLDER_BASE}Core/Network/Http
    ${FOLDER_BASE}Core/Network/Http/Websocket
    ${FOLDER_BASE}Core/Network/Mqtt
    ${FOLDER_BASE}Core/Network/Ssl
    ${FOLDER_BASE}Core/Network/WebHelpers

    ${FOLDER_BASE}Components/http-parser
    ${FOLDER_BASE}Components/libb64
    ${FOLDER_BASE}Components/ws_parser
    ${FOLDER_BASE}Components/libyuarel

    ${FOLDER_BASE}Arch/Esp8266/Components/esp8266
    ${FOLDER_BASE}Arch/Esp8266/Components/driver
    ${FOLDER_BASE}Arch/Esp8266/Components/fatfs
    ${FOLDER_BASE}Arch/Esp8266/Components/spiffs
    ${FOLDER_BASE}Components/spiffs/src

    ${FOLDER_BASE}Services/Profiling
    ${FOLDER_BASE}Services/HexDump
    ${FOLDER_BASE}Services/Yeelight
    ${FOLDER_BASE}Services/CommandProcessing

    /opt/Sming/Sming
    ${FOLDER_BASE}Libraries
    ${FOLDER_BASE}Libraries/AM2321
    ${FOLDER_BASE}Libraries/APA102
    ${FOLDER_BASE}Libraries/Adafruit_BME280_Library
    ${FOLDER_BASE}Libraries/Adafruit_GFX
    ${FOLDER_BASE}Libraries/Adafruit_ILI9341
    ${FOLDER_BASE}Libraries/Adafruit_NeoPixel
    ${FOLDER_BASE}Libraries/Adafruit_PCD8544
    ${FOLDER_BASE}Libraries/Adafruit_SSD1306
    ${FOLDER_BASE}Libraries/Adafruit_ST7735
    ${FOLDER_BASE}Libraries/Adafruit_Sensor
    ${FOLDER_BASE}Libraries/ArduCAM
    ${FOLDER_BASE}Libraries/ArduinoJson
    ${FOLDER_BASE}Libraries/BH1750FVI
    ${FOLDER_BASE}Libraries/BMP180
    ${FOLDER_BASE}Libraries/Bounce
    ${FOLDER_BASE}Libraries/CapacitiveSensor
    ${FOLDER_BASE}Libraries/DFRobotDFPlayerMini
    ${FOLDER_BASE}Libraries/DHTesp
    ${FOLDER_BASE}Libraries/DS18S20
    ${FOLDER_BASE}Libraries/DS3232RTC
    ${FOLDER_BASE}Libraries/HMC5883L
    ${FOLDER_BASE}Libraries/I2Cdev
    ${FOLDER_BASE}Libraries/IR
    ${FOLDER_BASE}Libraries/ITEADLIB_Arduino_Nextion
    ${FOLDER_BASE}Libraries/LiquidCrystal
    ${FOLDER_BASE}Libraries/MCP23017
    ${FOLDER_BASE}Libraries/MCP23S17
    ${FOLDER_BASE}Libraries/MFRC522
    ${FOLDER_BASE}Libraries/MMA_7455
    ${FOLDER_BASE}Libraries/Mirf
    ${FOLDER_BASE}Libraries/OneWire
    ${FOLDER_BASE}Libraries/RCSwitch
    ${FOLDER_BASE}Libraries/RF24
    ${FOLDER_BASE}Libraries/RingBufCPP
    ${FOLDER_BASE}Libraries/SDCard
    ${FOLDER_BASE}Libraries/SI7021
    ${FOLDER_BASE}Libraries/Servo
    ${FOLDER_BASE}Libraries/SparkFun_APDS9960
    ${FOLDER_BASE}Libraries/TFT_ILI9163C
    ${FOLDER_BASE}Libraries/TM1637
    ${FOLDER_BASE}Libraries/Ultrasonic
    ${FOLDER_BASE}Libraries/WS2812
    ${FOLDER_BASE}Libraries/si4432
    ${FOLDER_BASE}Wiring/include

    ${FOLDER_BASE}System/include
    ${FOLDER_BASE}Wiring
    ${FOLDER_BASE}Libraries
    ${FOLDER_BASE}Core
    ${FOLDER_BASE}Arch/Esp8266
    ${FOLDER_BASE}Arch/Esp8266/System/include
    ${FOLDER_BASE}Components
    ${FOLDER_BASE}.
    ${FOLDER_BASE}Components/mqtt-codec/src
    ${FOLDER_BASE}Arch/Esp8266/Components
    ${FOLDER_BASE}Arch/Esp8266/Components/esp8266/include
    ${FOLDER_BASE}Arch/Esp8266/Components/driver/include
    ${FOLDER_BASE}Arch/Esp8266/Components/rboot/rboot
    ${FOLDER_BASE}Arch/Esp8266/Components/rboot/rboot/appcode
    ${FOLDER_BASE}Arch/Esp8266/Components/esp-open-lwip/esp-open-lwip/include
    ${FOLDER_BASE}Arch/Esp8266/Components/gdbstub/include

    ${FOLDER_BASE}Arch/Esp8266/Components/gdbstub/appcode
    ${FOLDER_BASE}System/include/gdb
)

if(SMING_ARCH STREQUAL "Esp8266")
    list(APPEND SmingIncludes 
        ${FOLDER_BASE}Arch/Esp8266/Components/spi_flash/include
        ${FOLDER_BASE}Arch/Esp8266/Components/esp_wifi/include
        )
else()
    list(APPEND SmingIncludes 
        ${FOLDER_BASE}Arch/Host/Components/spi_flash/include 
        ${FOLDER_BASE}Arch/Host/Components/esp_wifi/include
        )
endif()



