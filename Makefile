CC = em++
SRC = main.cpp
OBJ = main.o
TARGET = main.wasm

# Compilation flags for generating an object file.
# We use -c to compile without linking.
CXXFLAGS_OBJ = -c -O3 -s MEMORY64=1 -Wno-experimental

# Linking flags for a final standalone wasm with an entry point.
LINKFLAGS = -O3 -s STANDALONE_WASM=1 -s MEMORY64=1 -Wno-experimental --no-entry

.PHONY: all object wasm clean

# Default target builds the final wasm module.
all: wasm

run:
	node --experimental-wasm-memory64 run.js

# Target to compile main.cpp into main.o
object: $(OBJ)

$(OBJ): $(SRC)
	$(CC) $(CXXFLAGS_OBJ) $(SRC) -o $(OBJ)

# Target to link main.o into a wasm module with an entry point.
wasm: $(OBJ)
	$(CC) $(LINKFLAGS) $(OBJ) -o $(TARGET)

# Clean up generated files.
clean:
	rm -f $(OBJ) $(TARGET)
