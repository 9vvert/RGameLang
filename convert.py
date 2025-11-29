from enum import Enum

enable_comment = 1
var_start = 0x30000000
var_ptr = 0

# 寄存器划分
zero = "zero"
rv = "s0"   # 指向变量起始地址
r1 = "t0"
r2 = "t1"
r3 = "t2"
clock = "s9"   # 各个计时器完成一个周期后，将其中的一个比特设置为1
key = "s10"  # 用来监听按键

# 一些和掩码有关的常量
clock_game_mask = 0x00000001

key_left_mask = 0x00000001
key_down_mask = 0x00000002
key_up_mask = 0x00000004
key_right_mask = 0x00000008

# 一些存储在 SRAM 中的变量
game_clock_counter_var = 'GAME_CLOCK_COUNTER'
game_clock_finish_var = "GAME_CLOCK_FINISH"
listener_clock_counter_var = "LISTENER_CLOCK_COUNTER"
listener_clock_finish_var = "LISTENER_CLOCK_FINISH"

res_x_var = "RES_X"
res_y_var = "RES_Y"

key_bits_var = "KEY_BITS"
key_up_var = "KEY_UP"
key_down_var = "KEY_DOWN"
key_left_var = "KEY_LEFT"
key_right_var = "KEY_RIGHT"


# 一些固定的label
game_loop_start_L = "GAME_LOOP_START:"
game_loop_wait_L = "GAME_LOOP_WAIT:"
key_listener_start_L = "KEY_LISTENER_START:"
key_listener_end_L = "KEY_LISTENER_END:"


emit_instr = []     # 保存的指令
var_map = {}        # 记录变量名到 id 的映射

class CMP(Enum):
    LT = 1
    GT = 2
    LE = 3
    GE = 4
    EQ = 5
    NE = 6
    JMP = 7

class ALU(Enum):
    ADD = 1
    SUB = 2
    AND = 3
    OR = 4
    SHR = 5
    SHL = 6
    XOR = 7
    # TODO:
    # 补全


# 生成游戏的逻辑

def emit_comment(comment:str):
    if enable_comment:
        emit_instr.append('\t// ' + comment)

# 将特定的值写入寄存器
def write_reg(reg, value):
    emit_instr.append(f'\tadd {reg}, zero, {hex(value)}')

# 寄存器移动,用于读取/腾出位置
def move_reg(reg1, reg2):
    emit_comment(f'{reg1} = {reg2}')
    emit_instr.append(f'\tadd {reg1}, zero, {reg2}')

def write_var_with_reg(var_name:str, reg):
    if var_name not in var_map.keys():
        print(f'varialbe {var_name} not defined.')
    var_index = var_map[var_name]

    emit_comment(f'{var_name} = {reg}')
    emit_instr.append(f'\tsw {reg}, {var_index*4}({rv})')

# 写入特定的变量
def write_var(var_name:str, value):
    if var_name not in var_map.keys():
        print(f'varialbe {var_name} not defined.')
    var_index = var_map[var_name]

    emit_comment(f'{var_name} = {hex(value)}')
    emit_instr.append(f'\tadd {r1}, zero, {hex(value)}')
    emit_instr.append(f'\tsw {r1}, {var_index*4}({rv})')

# 读取特定的变量
def read_var(var_name:str, reg):
    if var_name not in var_map.keys():
        print(f'varialbe {var_name} not defined.')
    var_index = var_map[var_name]

    emit_comment(f'{reg} = {var_name}')
    emit_instr.append(f'\tlw {reg}, {var_index*4}({rv})')

# TODO:
# 产生ALU操作 reg1 = reg2 x reg3
def alu(reg1, reg2, reg3, alu_op:ALU):
    match alu_op:
        case ALU.ADD:
            emit_instr.append(f'\tadd {reg1}, {reg2}, {reg3}')
        case ALU.SUB:
            emit_instr.append(f'\tsub {reg1}, {reg2}, {reg3}')
        case ALU.AND:
            emit_instr.append(f'\tsub {reg1}, {reg2}, {reg3}')
        case ALU.OR:
            emit_instr.append(f'\tsub {reg1}, {reg2}, {reg3}')
        case ALU.XOR:
            emit_instr.append(f'\txor {reg1}, {reg2}, {reg3}')
        case _:
            emit_instr.append(f'\tadd {zero}, {zero}, {zero}')

def alui(reg1, reg2, val, alu_op:ALU):
    match alu_op:
        case ALU.ADD:
            emit_instr.append(f'\taddi {reg1}, {reg2}, {hex(val)}')
        case ALU.SUB:
            emit_instr.append(f'\tsubi {reg1}, {reg2}, {hex(val)}')
        case ALU.AND:
            emit_instr.append(f'\tandi {reg1}, {reg2}, {hex(val)}')
        case ALU.OR:
            emit_instr.append(f'\tori {reg1}, {reg2}, {hex(val)}')
        case ALU.SHR:
            emit_instr.append(f'\tsrli {reg1}, {reg2}, {hex(val)}')
        case ALU.SHL:
            emit_instr.append(f'\tslli {reg1}, {reg2}, {hex(val)}')
        case _:
            emit_instr.append(f'\tadd {zero}, {zero}, {zero}')

# 定义新的变量
def def_var(var_name:str):
    global var_ptr
    var_map[var_name] = var_ptr
    var_ptr += 1

def emit_label(label_name:str):
    emit_instr.append(f'{label_name}')

def branch(reg1, reg2, label:str, cmp_op:CMP):
    match cmp_op:
        case CMP.LT:
            emit_instr.append(f'\tblt {reg1}, {reg2}, {label}')
        case CMP.GT:
            emit_instr.append(f'\tblt {reg2}, {reg1}, {label}')
        case CMP.LE:
            emit_instr.append(f'\tbge {reg2}, {reg1}, {label}')
        case CMP.GE:
            emit_instr.append(f'\tbge {reg1}, {reg2}, {label}')
        case CMP.EQ:
            emit_instr.append(f'\tbeq {reg1}, {reg2}, {label}')
        case CMP.NE:
            emit_instr.append(f'\tbne {reg1}, {reg2}, {label}')
        case _:
            emit_instr.append(f'\tj {label}')

# FIX:
# 尝试将所有的“硬件引起的交互”转变为对SRAM的读取

# 完成所有辅助变量的设置
def init():
    # 设置var ptr
    emit_instr.append(f'\tadd {rv}, zero, {hex(var_start)}')
    # 初始化一些寄存器
    write_reg(clock, 0)

    # ========== 定义系统变量==========
    # 渲染
    def_var(res_x_var)
    def_var(res_y_var)
    # 计时器
    def_var(game_clock_counter_var)
    def_var(game_clock_finish_var)
    def_var(listener_clock_counter_var)
    def_var(listener_clock_finish_var)
    # 按键
    def_var(key_bits_var)
    def_var(key_up_var)
    def_var(key_down_var)
    def_var(key_left_var)
    def_var(key_right_var)

    # =========== 变量初始化 =============
    # 设置game clk 和相关的寄存器
    write_var(game_clock_counter_var, 25000000) # 默认： 1s
    write_var(listener_clock_counter_var, 20000000) # 默认： 0.8s   # NOTE:可能时间过长
    write_var(game_clock_finish_var, 0)
    write_var(listener_clock_finish_var, 0)
    # 设置分辨率,默认 40*30网格
    write_var(res_x_var, 40) 
    write_var(res_y_var, 30) 

    # ============ 控制逻辑 ===============
    # 产生game clock的label
    emit_label(game_loop_start_L)
    
    # 在key listener循环的外面初始化key
    write_reg(key_bits_var, 0)
    # TODO:
    # 将监听的结果赋给key->up,down,left,right四个变量中，自己编写的程序可以直接调用"RIGHT"等常量
    
    # 监听键盘事件
    emit_label(key_listener_start_L)

    # 只要下列条件满足其一：读取到按键/时间终止，就结束这一轮的listen
    read_var(key_bits_var, key) # NOTE: 将变量读取到寄存器中，然后再使用
    read_var(listener_clock_finish_var, clock)
    branch(key, zero, key_listener_end_L, CMP.NE)
    branch(clock, zero, key_listener_end_L, CMP.NE)
    branch(zero, zero, key_listener_start_L, CMP.JMP)    
    emit_label(key_listener_end_L)

    # 记录本周期记录的按键
    alui(r1, key, 0x1, ALU.AND)
    write_var_with_reg(key_left_var, r1)
    alui(r1, key, 0x2, ALU.AND)
    alui(r1, r1, 1, ALU.SHR)
    write_var_with_reg(key_down_var, r1)
    alui(r1, key, 0x4, ALU.AND)
    alui(r1, r1, 2, ALU.SHR)
    write_var_with_reg(key_up_var, r1)
    alui(r1, key, 0x8, ALU.AND)
    alui(r1, r1, 3, ALU.SHR)
    write_var_with_reg(key_right_var, r1)

    
    # TODO: 生成用户的逻辑
    




    # 用于最后，等效生成game clk的while循环
    emit_label(game_loop_wait_L)
    read_var(game_clock_finish_var, clock)
    branch(clock, zero, game_loop_wait_L , CMP.EQ)
    branch(zero, zero, game_loop_start_L,  CMP.JMP)
    
    
    
    


    

init() 
    
# init



for instr in emit_instr:
    print(instr)
