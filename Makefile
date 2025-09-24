# =============================================================================
# Makefile for the "Awakening" protocol
# =============================================================================

# -- Compiler and Linker --
ASM = nasm
LD = ld

# -- Flags --
# -f elf64: specifies the output format as 64-bit ELF, standard for Linux
AFLAGS = -f elf64

# -- Target executable name --
TARGET = hello

# -- Default rule: executed when you just type 'make' --
# This rule says that to build 'all', we first need to build our TARGET.
all: $(TARGET)

# -- Linking rule --
# This rule creates the final executable (TARGET) from the object file (.o).
$(TARGET): $(TARGET).o
	$(LD) -o $(TARGET) $(TARGET).o

# -- Assembling rule --
# This rule creates the object file (.o) from the assembly source file (.asm).
$(TARGET).o: $(TARGET).asm
	$(ASM) $(AFLAGS) -o $(TARGET).o $(TARGET).asm

# -- Clean rule: executed when you type 'make clean' --
# This rule removes all generated files for a clean workspace.
clean:
	rm -f $(TARGET) $(TARGET).o

# -- Phony targets --
# Tells 'make' that 'all' and 'clean' are not actual files.
.PHONY: all clean
