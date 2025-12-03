from unicorn import *
from unicorn.riscv_const import *



# 1. 加载机器码
CODE = open("flush.bin", "rb").read()

# 2. 设置内存起始地址
CODE_ADDR = 0x10000000
DATA_ADDR = 0x80010000

mu = Uc(UC_ARCH_RISCV, UC_MODE_RISCV32)
mu.mem_map(CODE_ADDR, 0x1000)
mu.mem_write(CODE_ADDR, CODE)

mu.mem_map(DATA_ADDR, 0x40000)

# 3. 初始化 s0 寄存器让它指向 data 区
# mu.reg_write(UC_RISCV_REG_S0, DATA_ADDR)

# 4. 设置PC
mu.reg_write(UC_RISCV_REG_PC, CODE_ADDR)

# 5. 运行部分机器码
mu.emu_start(CODE_ADDR, CODE_ADDR+len(CODE))

# 6. 检查结果
for i in range(50):
    result = mu.mem_read(DATA_ADDR + 4*i, 0x4)
    print(i, hex(int.from_bytes(result, "little")))
    
