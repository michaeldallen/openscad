#BOF

OS := $(shell uname -s)
ifeq (${OS},Darwin)
	machine := mac
else ifeq (${OS},Linux)
	machine := lin
endif

foo :
	echo OS: ${OS}
	echo machine: ${machine}

#EOF

bar :
	file /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD


clean :
	find * -name '*~' -exec rm -v {} \;

