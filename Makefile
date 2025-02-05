CC = em++
SRC = main.cpp
TARGET = main.wasm 
CXXFLAGS = --no-entry -O3 -s STANDALONE_WASM=1

all:
	$(CC) $(SRC) -o $(TARGET) $(CXXFLAGS)

clean:
	rm -f $(TARGET)

.PHONY: all clean
