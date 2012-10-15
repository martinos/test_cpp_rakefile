# source files.
SRC = main.cpp mod.cpp user.cpp

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

$(OUT): $(OBJ)
	g++ -o $(OUT) $(OBJ)

include $(SRC:.cpp=.d)

.SUFFIXES: .cpp

# Generating automatic dependencies
%.d: %.cpp
	@set -e; rm -f $@; \
		$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
		sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

.cpp.o:
	$(CCC) $(INCLUDES) $(CCFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(OUT) Makefile.bak 
