UNAME := "windows"


ifeq ($(UNAME), Linux)
CPP_SOURCES = src/main.cpp src/wing.hpp src/3d.hpp src/timer.hpp  src/importers.hpp
LINKFLAGS = -lSDLmain -lSDL -lglut -lGLU
BINARY = wing
else
CPP_SOURCES = src/main.cpp src/wing.cpp src/3d.cpp src/timer.cpp  src/importers.cpp
LINKFLAGS = -lmingw32 -lSDLmain -lSDL -lOpenGL32 -lGLU32
BINARY = wing.exe
endif


CPPFLAGS = -Wall -Werror -g

all: compile test


compile:
	g++ ${CPP_SOURCES} -o ${BINARY} ${LINKFLAGS}

run:
	./${BINARY}
test:
	./${BINARY} --test
