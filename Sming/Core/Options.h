// THIS HEADER IS CONFIGURED BY CMAKE
// Version nbrs, configured options and settings for Sming

#define VERSION_MAJOR 3
#define VERSION_MINOR 8
#define VERSION_POINT 1

#define SMING_VERSION  "3.8.1"

//TODO find way to do this better
#ifndef ARCH_ESP8266  
#ifndef ARCH_HOST
/* #undef ARCH_ESP8266 */
#define  ARCH_HOST
#endif
#endif

#define       DEBUG_VERBOSE_LEVEL  2
/* #undef ENABLE_CMD_EXECUTOR */
/* #undef ENABLE_CUSTOM_HEAP */
//#define       ENABLE_CUSTOM_LWIP   
/* #undef ENABLE_CUSTOM_PWM */
/* #undef ENABLE_ESPCONN */
/* #undef ENABLE_GDB */
/* #undef ENABLE_LWIPDEBUG */
/* #undef ENABLE_SSL */
/* #undef ENABLE_WPS */
/* #undef SSL_DEBUG */
