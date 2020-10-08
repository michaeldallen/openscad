#BOF

OS := $(shell uname -s)
ifeq (${OS},Darwin)
	OpenSCAD := /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
else ifeq (${OS},Linux)
	OpenSCAD := /usr/bin/openscad
endif

diag :
	echo OS: ${OS}
	echo OpenSCAD: ${OpenSCAD}
	${OpenSCAD}


%.stl : %.scad
	${OpenSCAD} --o $@ $<

clean :
	find * -name '*~' -exec rm -v {} \;

#EOF
