export SMING_ARCH=Host
export SMING_HOME=/opt/Sming/Sming
export ENABLE_GDB=1  
export ENABLE_LWIPDEBUG=1  # <!-- will compile also LWIP with debug
make -j8
