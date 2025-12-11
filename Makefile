# filepath: Makefile
# Compiler and tools
CC = riscv64-unknown-elf-gcc
OBJCOPY = riscv64-unknown-elf-objcopy
OBJDUMP = riscv64-unknown-elf-objdump

# Compiler flags
CFLAGS = -march=rv32i -mabi=ilp32 -static -fno-pic -fno-builtin -nostdlib -nostdinc
ASFLAGS = -nostdlib -march=rv32i -mabi=ilp32
LDFLAGS = -nostdlib -Wl,-T,link.ld -march=rv32i -mabi=ilp32

# Source files
C_SOURCES = snake.c
ASM_SOURCES = start.s
OBJECTS = start.o snake.o

# Output files
TARGET = game.elf
BINARY = game.bin
DISASM = game.asm

# Default target
all: $(BINARY) $(DISASM)

# Generate assembly from C source
snake.s: snake.c
	$(CC) -S $< $(CFLAGS) -o $@

# Compile assembly files to object files
start.o: start.s
	$(CC) $(ASFLAGS) -c $< -o $@

snake.o: snake.s
	$(CC) $(ASFLAGS) -c $< -o $@

# Link object files to create ELF
$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

# Generate binary file
$(BINARY): $(TARGET)
	$(OBJCOPY) -O binary --only-section=.text $< $@

# Generate disassembly
$(DISASM): $(TARGET)
	$(OBJDUMP) -D $< > $@

# Clean build artifacts
clean:
	rm -f *.o snake.s game.*

# Phony targets
.PHONY: all clean

