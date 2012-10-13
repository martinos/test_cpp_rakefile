# source files.
SRC = main.cpp mod.cpp tata.cpp

OBJ = $(SRC:.cpp=.o)

OUT = martin.exe

# include directories
INCLUDES = -I. -I../include/ -I/usr/local/include 

# C++ compiler flags (-g -O2 -Wall)
CCFLAGS = -g

# compiler
CCC = g++

# library paths
LIBS = -L../ -L/usr/local/lib -lm

# compile flags
LDFLAGS = -g

.SUFFIXES: .cpp

default: dep $(OUT)

.cpp.o:
	$(CCC) $(INCLUDES) $(CCFLAGS) -c $< -o $@

$(OUT): $(OBJ)
	g++ -o $(OUT) $(OBJ)

depend: dep

dep:
	g++ -M -MM

clean:
	rm -f $(OBJ) $(OUT) Makefile.bak 
