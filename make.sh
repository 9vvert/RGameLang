riscv64-unknown-elf-gcc -nostdlib -march=rv32i -mabi=ilp32 -c start.s -o start.o
riscv64-unknown-elf-gcc -nostdlib -march=rv32i -mabi=ilp32 -c snake.s -o snake.o

# 链接
riscv64-unknown-elf-gcc -nostdlib -Wl,-T,link.ld -march=rv32i -mabi=ilp32 -o game.elf start.o snake.o



# 生成二进制文件
riscv64-unknown-elf-objcopy -O binary --only-section=.text game.elf game.bin

