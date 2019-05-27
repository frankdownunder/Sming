clear
# Note
# 	Fully clean and re-Build the Sming Library
#
# Fully specify the buildfolder so we dont accidentally remove stuff we shouldnt
rm -rf /opt/Sming/Sming/build/*
cmake -DCMAKE_BUILD_TYPE=debug -DENABLE_CMD_EXECUTOR=OFF .. -GNinja
ninja
#cat /opt/Sming/Sming/Core/Options.h
#cat /opt/Sming/Sming/build/BuildNumber.h
