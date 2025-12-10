

util.o: util.S common.h serial.h
	riscv32-unknown-elf-gcc -c util.S -o util.o -march=rv32i -mabi=ilp32
