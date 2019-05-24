clear
# Note
# 	Ninja not supported as yet.      
#	The compiler doesnt seem to like producing the dependency file as well as compiling the code.
# 	Using the makefile generator is a workaround for now
#
# Fully specify the buildfolder so we dont accidentally remove stuff we shouldnt
rm -rf /opt/Sming/Sming/build/*
cmake -DCMAKE_BUILD_TYPE=debug -DENABLE_CMD_EXECUTOR=OFF .. 
make
cat /opt/Sming/Sming/build/options.h
cat /opt/Sming/Sming/build/BuildNumber.h
