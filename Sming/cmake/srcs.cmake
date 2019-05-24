set(CORE_FOLDER /opt/Sming/Sming/Core 
    #PARENT_SCOPE
    )
set(CORE_SRCS
    ${CORE_FOLDER}/DateTime.cpp
    ${CORE_FOLDER}/Timer.cpp
    ${CORE_FOLDER}/AtClient.cpp
    ${CORE_FOLDER}/FileSystem.cpp
    ${CORE_FOLDER}/ArduinoCompat.cpp
    ${CORE_FOLDER}/Wire.cpp
    ${CORE_FOLDER}/SystemClock.cpp
    ${CORE_FOLDER}/Debug.cpp
    ${CORE_FOLDER}/Data/MailMessage.cpp
    ${CORE_FOLDER}/Data/StreamTransformer.cpp
    ${CORE_FOLDER}/Data/CStringArray.cpp
    ${CORE_FOLDER}/Data/HexString.cpp
    ${CORE_FOLDER}/Data/Buffer/SerialBuffer.cpp
    ${CORE_FOLDER}/Data/Buffer/CircularBuffer.cpp
    ${CORE_FOLDER}/Data/Stream/LimitedMemoryStream.cpp
    ${CORE_FOLDER}/Data/Stream/MultipartStream.cpp
    ${CORE_FOLDER}/Data/Stream/GdbFileStream.cpp
    ${CORE_FOLDER}/Data/Stream/MultiStream.cpp
    ${CORE_FOLDER}/Data/Stream/Base64OutputStream.cpp
    ${CORE_FOLDER}/Data/Stream/UrlencodedOutputStream.cpp
    ${CORE_FOLDER}/Data/Stream/JsonObjectStream.cpp
    ${CORE_FOLDER}/Data/Stream/FlashMemoryStream.cpp
    ${CORE_FOLDER}/Data/Stream/TemplateStream.cpp
    ${CORE_FOLDER}/Data/Stream/MemoryDataStream.cpp
    ${CORE_FOLDER}/Data/Stream/FileStream.cpp
    ${CORE_FOLDER}/Data/Stream/QuotedPrintableOutputStream.cpp
    ${CORE_FOLDER}/Data/Stream/DataSourceStream.cpp
    ${CORE_FOLDER}/Data/Stream/ChunkedStream.cpp
    ${CORE_FOLDER}/Data/Stream/EndlessMemoryStream.cpp
    ${CORE_FOLDER}/Network/WebsocketClient.cpp
    ${CORE_FOLDER}/Network/TcpServer.cpp
    ${CORE_FOLDER}/Network/NetUtils.cpp
    ${CORE_FOLDER}/Network/HttpClient.cpp
    ${CORE_FOLDER}/Network/UdpConnection.cpp
    ${CORE_FOLDER}/Network/Url.cpp
    ${CORE_FOLDER}/Network/FtpServer.cpp
    ${CORE_FOLDER}/Network/TcpConnection.cpp
    ${CORE_FOLDER}/Network/WebConstants.cpp
    ${CORE_FOLDER}/Network/MqttClient.cpp
    ${CORE_FOLDER}/Network/TcpClient.cpp
    ${CORE_FOLDER}/Network/HttpServer.cpp
    ${CORE_FOLDER}/Network/TelnetServer.cpp
    ${CORE_FOLDER}/Network/SmtpClient.cpp
    ${CORE_FOLDER}/Network/NtpClient.cpp
    ${CORE_FOLDER}/Network/DNSServer.cpp
    ${CORE_FOLDER}/Network/Ftp/FtpServerConnection.cpp
    ${CORE_FOLDER}/Network/Http/HttpConnection.cpp
    ${CORE_FOLDER}/Network/Http/HttpCommon.cpp
    ${CORE_FOLDER}/Network/Http/HttpHeaders.cpp
    ${CORE_FOLDER}/Network/Http/HttpServerConnection.cpp
    ${CORE_FOLDER}/Network/Http/HttpResponse.cpp
    ${CORE_FOLDER}/Network/Http/HttpRequest.cpp
    ${CORE_FOLDER}/Network/Http/HttpParams.cpp
    ${CORE_FOLDER}/Network/Http/HttpBodyParser.cpp
    ${CORE_FOLDER}/Network/Http/HttpResourceTree.cpp
    ${CORE_FOLDER}/Network/Http/HttpRequestAuth.cpp
    ${CORE_FOLDER}/Network/Http/HttpClientConnection.cpp
    ${CORE_FOLDER}/Network/Http/Websocket/WebsocketResource.cpp
    ${CORE_FOLDER}/Network/Http/Websocket/WebsocketConnection.cpp
    ${CORE_FOLDER}/Network/Mqtt/MqttPayloadParser.cpp
    ${CORE_FOLDER}/Network/Ssl/SslFingerprints.cpp
    ${CORE_FOLDER}/Network/Ssl/SslValidator.cpp
    ${CORE_FOLDER}/Network/WebHelpers/base64.cpp
    ${CORE_FOLDER}/Network/WebHelpers/aw-sha1.cpp
    ${CORE_FOLDER}/Network/WebHelpers/escape.cpp
    #PARENT_SCOPE
    )
  

set(LIBRARY_FOLDER /opt/Sming/Sming/Libraries
    #PARENT_SCOPE
    )
set(LIBRARY_SRCS
    ${LIBRARY_FOLDER}/SparkFun_APDS9960/SparkFun_APDS9960.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/FastIO.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/LiquidCrystal_I2C.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/I2CIO.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/LiquidCrystal_SR2W.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/LCD.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/LiquidCrystal.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/LiquidCrystal_SR3W.cpp
    ${LIBRARY_FOLDER}/LiquidCrystal/LiquidCrystal_SR.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Toshiba.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Sony.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Gree.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Sanyo.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Lasertag.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Fujitsu.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_RCMM.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Kelvinator.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Magiquest.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_LG.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Pronto.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Carrier.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Sherwood.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Coolix.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Whynter.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Mitsubishi.cpp
    ${LIBRARY_FOLDER}/IR/src/IRrecv.cpp
    ${LIBRARY_FOLDER}/IR/src/IRutils.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_GlobalCache.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_NEC.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Daikin.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Samsung.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Midea.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Trotec.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Nikai.cpp
    ${LIBRARY_FOLDER}/IR/src/IRtimer.cpp
    ${LIBRARY_FOLDER}/IR/src/IRsend.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_RC5_RC6.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Haier.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Argo.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Sharp.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Dish.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Denon.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_JVC.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Aiwa.cpp
    ${LIBRARY_FOLDER}/IR/src/ir_Panasonic.cpp
    ${LIBRARY_FOLDER}/Adafruit_BME280_Library/Adafruit_BME280.cpp
    ${LIBRARY_FOLDER}/MCP23S17/MCP23S17.cpp
    ${LIBRARY_FOLDER}/si4432/si4432.cpp
    ${LIBRARY_FOLDER}/RF24/RF24.cpp
    ${LIBRARY_FOLDER}/WS2812/WS2812.cpp
    ${LIBRARY_FOLDER}/Servo/ServoChannel.cpp
    ${LIBRARY_FOLDER}/Servo/Servo.cpp
    ${LIBRARY_FOLDER}/MMA_7455/MMA_7455.cpp
    ${LIBRARY_FOLDER}/SDCard/SDCard.cpp
    ${LIBRARY_FOLDER}/DHTesp/DHTesp.cpp
    ${LIBRARY_FOLDER}/BMP180/BMP180.cpp
    ${LIBRARY_FOLDER}/HMC5883L/HMC5883L.cpp
    ${LIBRARY_FOLDER}/Adafruit_PCD8544/Adafruit_PCD8544.cpp
    ${LIBRARY_FOLDER}/BH1750FVI/BH1750FVI.cpp
    ${LIBRARY_FOLDER}/MCP23017/MCP23017.cpp
    ${LIBRARY_FOLDER}/TM1637/TM1637Display.cpp
    ${LIBRARY_FOLDER}/RCSwitch/RCSwitch.cpp
    ${LIBRARY_FOLDER}/DFRobotDFPlayerMini/DFRobotDFPlayerMini.cpp
    ${LIBRARY_FOLDER}/Adafruit_SSD1306/Adafruit_SSD1306.cpp
    ${LIBRARY_FOLDER}/DS18S20/ds18s20.cpp
    ${LIBRARY_FOLDER}/Adafruit_ST7735/Adafruit_ST7735.cpp
    ${LIBRARY_FOLDER}/DS3232RTC/DS3232RTC.cpp
    ${LIBRARY_FOLDER}/Ultrasonic/Ultrasonic.cpp
    ${LIBRARY_FOLDER}/AM2321/AM2321.cpp
    ${LIBRARY_FOLDER}/ArduCAM/ArduCAMStream.cpp
    ${LIBRARY_FOLDER}/ArduCAM/ArduCAM.cpp
    ${LIBRARY_FOLDER}/TFT_ILI9163C/TFT_ILI9163C.cpp
    ${LIBRARY_FOLDER}/Adafruit_NeoPixel/Adafruit_NeoPixel.cpp
    ${LIBRARY_FOLDER}/I2Cdev/I2Cdev.cpp  
    ${LIBRARY_FOLDER}/Adafruit_GFX/Adafruit_GFX.cpp
    ${LIBRARY_FOLDER}/MFRC522/MFRC522.cpp
    ${LIBRARY_FOLDER}/Bounce/Bounce.cpp
    ${LIBRARY_FOLDER}/Adafruit_ILI9341/Adafruit_ILI9341.cpp
    ${LIBRARY_FOLDER}/SI7021/SI7021.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexTouch.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexPicture.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexCheckbox.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexText.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexPage.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexHotspot.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexHardware.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexSlider.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexRtc.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexObject.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexDualStateButton.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexNumber.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexGpio.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexCrop.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexTimer.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexButton.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexWaveform.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexVariable.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexProgressBar.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexScrolltext.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexRadio.cpp
    ${LIBRARY_FOLDER}/ITEADLIB_Arduino_Nextion/NexGauge.cpp
    ${LIBRARY_FOLDER}/Mirf/Mirf.cpp
    ${LIBRARY_FOLDER}/OneWire/OneWire.cpp
    ${LIBRARY_FOLDER}/APA102/apa102.cpp
    ${LIBRARY_FOLDER}/CapacitiveSensor/CapacitiveSensor.cpp
    #PARENT_SCOPE
    )
#set(LIBRARY_SRCS)


set(ARCH_FOLDER /opt/Sming/Sming/Arch/Esp8266 
    #PARENT_SCOPE
    )
set(ARCH_SRCS
    ${ARCH_FOLDER}/Core/HardwarePWM.cpp
    ${ARCH_FOLDER}/Core/SPISoft.cpp
    ${ARCH_FOLDER}/Core/ESP8266EX.cpp
    ${ARCH_FOLDER}/Core/Interrupts.cpp
    ${ARCH_FOLDER}/Core/Digital.cpp
    ${ARCH_FOLDER}/Core/core_esp8266_si2c.cpp
    ${ARCH_FOLDER}/Core/Clock.cpp
    ${ARCH_FOLDER}/Core/HardwareTimer.cpp
    ${ARCH_FOLDER}/Core/HardwareSerial.cpp
    ${ARCH_FOLDER}/Core/SPI.cpp
    ${ARCH_FOLDER}/Core/Network/rBootHttpUpdate.cpp
    ${ARCH_FOLDER}/Platform/RTC.cpp
    ${ARCH_FOLDER}/Platform/WDT.cpp
    ${ARCH_FOLDER}/Platform/Station.cpp
    ${ARCH_FOLDER}/Platform/WifiSniffer.cpp
    ${ARCH_FOLDER}/Platform/AccessPoint.cpp
    ${ARCH_FOLDER}/Platform/System.cpp
    ${ARCH_FOLDER}/Platform/WifiEvents.cpp
    ${ARCH_FOLDER}/Components/esp8266/esp_cplusplus.cpp
    ${ARCH_FOLDER}/Components/esp8266/startup.cpp
    ${ARCH_FOLDER}/Components/esp8266/xt_interrupts.cpp
    #${ARCH_FOLDER}/Components/gdbstub/appcode/gdb_hooks.cpp
    ${ARCH_FOLDER}/Components/driver/uart.cpp
    #PARENT_SCOPE
    )
#set(ARCH_SRCS)


set(WIRING_FOLDER /opt/Sming/Sming/Wiring #PARENT_SCOPE
    )
set(WIRING_SRCS
    ${WIRING_FOLDER}/WString.cpp
    ${WIRING_FOLDER}/WMath.cpp
    ${WIRING_FOLDER}/Print.cpp
    ${WIRING_FOLDER}/Stream.cpp
    ${WIRING_FOLDER}/IPAddress.cpp
    ${WIRING_FOLDER}/SplitString.cpp
    ${WIRING_FOLDER}/WShift.cpp
    ${WIRING_FOLDER}/FakePgmSpace.cpp
    #PARENT_SCOPE
    )
#set(WIRING_SRCS)


set(OTHERS_FOLDER /opt/Sming/Sming 
    #PARENT_SCOPE
    )
set(OTHERS_SRCS
    ${OTHERS_FOLDER}/System/stringutil.cpp
    ${OTHERS_FOLDER}/System/stringconversion.cpp
    ${OTHERS_FOLDER}/System/m_printf.cpp
    ${OTHERS_FOLDER}/Platform/OsMessageInterceptor.cpp
    ${OTHERS_FOLDER}/Services/HexDump/HexDump.cpp
    ${OTHERS_FOLDER}/Services/Yeelight/YeelightBulb.cpp
    ${OTHERS_FOLDER}/Services/CommandProcessing/CommandHandler.cpp
    ${OTHERS_FOLDER}/Services/CommandProcessing/CommandOutput.cpp
    ${OTHERS_FOLDER}/Services/CommandProcessing/CommandDelegate.cpp
    ${OTHERS_FOLDER}/Services/CommandProcessing/CommandExecutor.cpp
    #PARENT_SCOPE
    )
#set(OTHERS_SRCS ${OTHERS_FOLDER}/System/stringutil.cpp )

set(Sming_CXX_SOURCES
    ${CORE_SRCS} ${LIBRARY_SRCS} ${ARCH_SRCS} ${WIRING_SRCS} ${OTHERS_SRCS}
)

set(Sming_C_SRCS 
  /opt/Sming/Sming/Components/spiffs/src/spiffs_hydrogen.c
  ${LIBRARY_FOLDER}/Adafruit_GFX/glcdfont.c
  ${LIBRARY_FOLDER}/Adafruit_ILI9341/hspi.c
  ${OTHERS_FOLDER}/Components/http-parser/http_parser.c
  ${OTHERS_FOLDER}/Components/libb64/cdecode.c
  ${OTHERS_FOLDER}/Components/libb64/cencode.c
  ${OTHERS_FOLDER}/Components/ws_parser/ws_parser.c
  ${OTHERS_FOLDER}/Components/libyuarel/yuarel.c
  ${OTHERS_FOLDER}/Components/spiffs/src/spiffs_cache.c
  ${OTHERS_FOLDER}/Components/spiffs/src/spiffs_gc.c
  ${OTHERS_FOLDER}/Components/spiffs/src/spiffs_nucleus.c
  ${OTHERS_FOLDER}/Components/spiffs/src/spiffs_check.c
)
set(Sming_ASM_SRCS
    /opt/Sming/Sming/Arch/Esp8266/Components/esp8266/irq_check.s
    )

set(SmingIncludes 
    /opt/Sming/Sming/Arch/Esp8266/Components/Sdk/ESP8266_NONOS_SDK/include
    /opt/Sming/Sming/System
    /opt/Sming/Sming/Arch/Esp8266/System
    /opt/Sming/Sming/Wiring
    /opt/Sming/Sming/Arch/Esp8266/Core
    /opt/Sming/Sming/Arch/Esp8266/Core/Network
    /opt/Sming/Sming/Arch/Esp8266/Platform
    /opt/Sming/Sming/Platform

    /opt/Sming/Sming/Core
    /opt/Sming/Sming/Core/Data
    /opt/Sming/Sming/Core/Data/Buffer
    /opt/Sming/Sming/Core/Data/Stream
    /opt/Sming/Sming/Core/Network
    /opt/Sming/Sming/Core/Network/Ftp
    /opt/Sming/Sming/Core/Network/Http
    /opt/Sming/Sming/Core/Network/Http/Websocket
    /opt/Sming/Sming/Core/Network/Mqtt
    /opt/Sming/Sming/Core/Network/Ssl
    /opt/Sming/Sming/Core/Network/WebHelpers

    /opt/Sming/Sming/Components/http-parser
    /opt/Sming/Sming/Components/libb64
    /opt/Sming/Sming/Components/ws_parser
    /opt/Sming/Sming/Components/libyuarel

    /opt/Sming/Sming/Arch/Esp8266/Components/esp8266
    /opt/Sming/Sming/Arch/Esp8266/Components/driver
    /opt/Sming/Sming/Arch/Esp8266/Components/fatfs
    /opt/Sming/Sming/Arch/Esp8266/Components/spiffs
    /opt/Sming/Sming/Components/spiffs/src

    /opt/Sming/Sming/Services/Profiling
    /opt/Sming/Sming/Services/HexDump
    /opt/Sming/Sming/Services/Yeelight
    /opt/Sming/Sming/Services/CommandProcessing

    /opt/Sming/Sming
    /opt/Sming/Sming/Libraries
    /opt/Sming/Sming/Libraries/AM2321
    /opt/Sming/Sming/Libraries/APA102
    /opt/Sming/Sming/Libraries/Adafruit_BME280_Library
    /opt/Sming/Sming/Libraries/Adafruit_GFX
    /opt/Sming/Sming/Libraries/Adafruit_ILI9341
    /opt/Sming/Sming/Libraries/Adafruit_NeoPixel
    /opt/Sming/Sming/Libraries/Adafruit_PCD8544
    /opt/Sming/Sming/Libraries/Adafruit_SSD1306
    /opt/Sming/Sming/Libraries/Adafruit_ST7735
    /opt/Sming/Sming/Libraries/Adafruit_Sensor
    /opt/Sming/Sming/Libraries/ArduCAM
    /opt/Sming/Sming/Libraries/ArduinoJson
    /opt/Sming/Sming/Libraries/BH1750FVI
    /opt/Sming/Sming/Libraries/BMP180
    /opt/Sming/Sming/Libraries/Bounce
    /opt/Sming/Sming/Libraries/CapacitiveSensor
    /opt/Sming/Sming/Libraries/DFRobotDFPlayerMini
    /opt/Sming/Sming/Libraries/DHTesp
    /opt/Sming/Sming/Libraries/DS18S20
    /opt/Sming/Sming/Libraries/DS3232RTC
    /opt/Sming/Sming/Libraries/HMC5883L
    /opt/Sming/Sming/Libraries/I2Cdev
    /opt/Sming/Sming/Libraries/IR
    /opt/Sming/Sming/Libraries/ITEADLIB_Arduino_Nextion
    /opt/Sming/Sming/Libraries/LiquidCrystal
    /opt/Sming/Sming/Libraries/MCP23017
    /opt/Sming/Sming/Libraries/MCP23S17
    /opt/Sming/Sming/Libraries/MFRC522
    /opt/Sming/Sming/Libraries/MMA_7455
    /opt/Sming/Sming/Libraries/Mirf
    /opt/Sming/Sming/Libraries/OneWire
    /opt/Sming/Sming/Libraries/RCSwitch
    /opt/Sming/Sming/Libraries/RF24
    /opt/Sming/Sming/Libraries/RingBufCPP
    /opt/Sming/Sming/Libraries/SDCard
    /opt/Sming/Sming/Libraries/SI7021
    /opt/Sming/Sming/Libraries/Servo
    /opt/Sming/Sming/Libraries/SparkFun_APDS9960
    /opt/Sming/Sming/Libraries/TFT_ILI9163C
    /opt/Sming/Sming/Libraries/TM1637
    /opt/Sming/Sming/Libraries/Ultrasonic
    /opt/Sming/Sming/Libraries/WS2812
    /opt/Sming/Sming/Libraries/si4432
    /opt/Sming/Sming/Wiring/include

    /opt/Sming/Sming/System/include
    /opt/Sming/Sming/Wiring
    /opt/Sming/Sming/Libraries
    /opt/Sming/Sming/Core
    /opt/Sming/Sming/Arch/Esp8266
    /opt/Sming/Sming/Arch/Esp8266/System/include
    /opt/Sming/Sming/Components
    /opt/Sming/Sming/.
    /opt/Sming/Sming/Components/mqtt-codec/src
    /opt/Sming/Sming/Arch/Esp8266/Components
    /opt/Sming/Sming/Arch/Esp8266/Components/esp8266/include
    /opt/Sming/Sming/Arch/Esp8266/Components/driver/include
    /opt/Sming/Sming/Arch/Esp8266/Components/rboot/rboot
    /opt/Sming/Sming/Arch/Esp8266/Components/rboot/rboot/appcode
    /opt/Sming/Sming/Arch/Esp8266/Components/esp-open-lwip/esp-open-lwip/include
    /opt/Sming/Sming/Arch/Esp8266/Components/gdbstub/include

    /opt/Sming/Sming/Arch/Esp8266/Components/gdbstub/appcode
    /opt/Sming/Sming/System/include/gdb
)