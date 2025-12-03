import re
from enum import Enum
import argparse

enable_comment = 0
var_start = 0x80010000
# var_start = 0x20000000

pixel_h = 200
pixel_v = 150
video_mem_start = var_start + 0x1000
vm_ptr = (0x1000//4)
stack_ptr = var_start + 0x00020000
var_ptr = 0

# 寄存器划分
zero = "zero"
rv = "s0"   # 指向变量起始地址
r1 = "t0"
r2 = "t1"
r3 = "t2"
r4 = "t3"
r5 = "t4"
sp = "sp"   # Stack pointer

# 一些和掩码有关的常量
clock_game_mask = 0x00000001

key_left_mask = 0x00000001
key_down_mask = 0x00000002
key_up_mask = 0x00000004
key_right_mask = 0x00000008

# 一些存储在 SRAM 中的变量
game_clock_counter_var = 'GAME_CLOCK_COUNTER'
game_clock_finish_var = "GAME_CLOCK_FINISH"
listener_clock_counter_var = "LISTENER_CLOCK_"
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
label_counter = 0

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
    MUL = 8
    DIV = 9

def get_rand(rand_index):
    pass

def new_label(prefix="L"):
    global label_counter
    label_counter += 1
    return f"{prefix}_{label_counter}"

# 生成游戏的逻辑

def emit_comment(comment:str):
    if enable_comment:
        emit_instr.append('\t// ' + comment)

# 将特定的值写入寄存器
def write_reg(reg, value):
    emit_instr.append(f'\tli {reg}, {hex(value)}')

# 寄存器移动,用于读取/腾出位置
def move_reg(reg1, reg2):
    # emit_comment(f'{reg1} = {reg2}')
    emit_instr.append(f'\tadd {reg1}, zero, {reg2}')

def write_var_with_reg(var_name:str, reg):
    if var_name not in var_map.keys():
        print(f'variable {var_name} not defined.')
        return
    var_index = var_map[var_name]

    emit_comment(f'{var_name} = {reg}')
    emit_instr.append(f'\tsw {reg}, {var_index*4}({rv})')

# 写入特定的变量
def write_var(var_name:str, value):
    if var_name not in var_map.keys():
        print(f'variable {var_name} not defined.')
        return
    var_index = var_map[var_name]

    emit_comment(f'{var_name} = {hex(value)}')
    emit_instr.append(f'\tli {r1}, {hex(value)}')
    emit_instr.append(f'\tsw {r1}, {var_index*4}({rv})')

# 读取特定的变量
def read_var(var_name:str, reg):
    if var_name not in var_map.keys():
        print(f'variable {var_name} not defined.')
        return
    var_index = var_map[var_name]

    # emit_comment(f'{reg} = {var_name}')
    emit_instr.append(f'\tlw {reg}, {var_index*4}({rv})')

def emit_mul_const(reg_dest, reg_src, constant):
    # Decompose constant into powers of 2
    if constant == 0:
        emit_instr.append(f'\tadd {reg_dest}, zero, zero')
        return
    
    powers = []
    temp_c = constant
    p = 0
    while temp_c > 0:
        if temp_c & 1:
            powers.append(p)
        temp_c >>= 1
        p += 1
    
    if constant == 1:
        if reg_dest != reg_src:
            emit_instr.append(f'\tadd {reg_dest}, {reg_src}, zero')
        return

    # Use r3 as temp if needed
    # Fix register conflict: if dest == src and we have multiple steps,
    # the first step might overwrite src, corrupting subsequent steps.
    src_to_use = reg_src
    if reg_dest == reg_src and len(powers) > 1:
        move_reg(r4, reg_src)
        src_to_use = r4

    first = True
    for p in powers:
        if first:
            if p == 0:
                emit_instr.append(f'\tadd {reg_dest}, {src_to_use}, zero')
            else:
                emit_instr.append(f'\tslli {reg_dest}, {src_to_use}, {p}')
            first = False
        else:
            if p == 0:
                emit_instr.append(f'\tadd {reg_dest}, {reg_dest}, {src_to_use}')
            else:
                emit_instr.append(f'\tslli {r3}, {src_to_use}, {p}')
                emit_instr.append(f'\tadd {reg_dest}, {reg_dest}, {r3}')

# 产生ALU操作 reg1 = reg2 x reg3
def alu(reg1, reg2, reg3, alu_op:ALU):
    match alu_op:
        case ALU.ADD:
            emit_instr.append(f'\tadd {reg1}, {reg2}, {reg3}')
        case ALU.SUB:
            emit_instr.append(f'\tsub {reg1}, {reg2}, {reg3}')
        case ALU.AND:
            emit_instr.append(f'\tand {reg1}, {reg2}, {reg3}')
        case ALU.OR:
            emit_instr.append(f'\tor {reg1}, {reg2}, {reg3}')
        case ALU.XOR:
            emit_instr.append(f'\txor {reg1}, {reg2}, {reg3}')
        case ALU.SHL:
            emit_instr.append(f'\tsll {reg1}, {reg2}, {reg3}')
        case ALU.SHR:
            emit_instr.append(f'\tsrl {reg1}, {reg2}, {reg3}')
        case ALU.MUL:
             # Assuming no MUL instruction, use loop or error? 
             # For now, let's assume MUL instruction exists or user only does const mul
             emit_instr.append(f'\tmul {reg1}, {reg2}, {reg3}')
        case ALU.DIV:
             emit_instr.append(f'\tdiv {reg1}, {reg2}, {reg3}')
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
        case ALU.MUL:
            emit_mul_const(reg1, reg2, val)
        case _:
            emit_instr.append(f'\tadd {zero}, {zero}, {zero}')

# 定义新的变量
def def_var(var_name:str):
    global var_ptr
    emit_comment(f'Define var {var_name} at index {var_ptr}')
    var_map[var_name] = var_ptr
    var_ptr += 1

def def_arr(arr_name:str, size):
    for i in range(size):
        def_var(arr_name + f"@{i}")

# 
def get_ref_var(var_name:str):
    if var_name not in var_map.keys():
        print(f'variable {var_name} not defined.')
        return 0
    return var_map[var_name]

# 使用：r1, r2, r3
# 将指针变量ptr_name（指向一个index, 范围为0, 1, 2,...） 指向的值写入 r1
def deref_var_to_reg(ptr_name:str):
    if ptr_name not in var_map.keys():
        print(f'variable {ptr_name} not defined.')
        return
    var_index = var_map[ptr_name]

    emit_comment(f'{r1} = *{ptr_name}')
    emit_instr.append(f'\tlw {r2}, {var_index*4}({rv})')
    alui(r3, r2, 2, ALU.SHL)
    alu(r3, r3, rv, ALU.ADD)   # r3 = 4*ptr_val + rv
    emit_instr.append(f'\tlw {r1}, {r3}')
    
    

def emit_label(label_name:str):
    emit_instr.append(f'{label_name}:')

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

# ================= LEXER & PARSER =================

class Token:
    def __init__(self, type, value):
        self.type = type
        self.value = value
    def __repr__(self):
        return f"Token({self.type}, {self.value})"

class Lexer:
    def __init__(self, code):
        self.code = code
        self.tokens = []
        self.tokenize()

    def tokenize(self):
        token_specification = [
            ('VAR',    r'var'),
            ('IF',     r'if'),
            ('ELSE',   r'else'),
            ('WHILE',  r'while'),
            ('FOR',    r'for'),
            ('GOTO',   r'goto'),
            ('LAND',   r'&&'),
            ('LOR',    r'\|\|'),
            ('ID',     r'[a-zA-Z_][a-zA-Z0-9_]*'),
            ('NUM',    r'\d+'),
            ('PLUS',   r'\+'),
            ('MINUS',  r'-'),
            ('MUL',    r'\*'),
            ('DIV',    r'/'),
            ('EQ',     r'=='),
            ('NE',     r'!='),
            ('LNOT',   r'!'),
            ('LE',     r'<='),
            ('GE',     r'>='),
            ('LT',     r'<'),
            ('GT',     r'>'),
            ('ASSIGN', r'='),
            ('LPAREN', r'\('),
            ('RPAREN', r'\)'),
            ('LBRACE', r'\{'),
            ('RBRACE', r'\}'),
            ('LBRACKET', r'\['),
            ('RBRACKET', r'\]'),
            ('SEMI',   r';'),
            ('COMMA',  r','),
            ('AMP',    r'&'),
            ('BOR',    r'\|'),
            ('BNOT',   r'~'),
            ('COLON',  r':'),
            ('SKIP',   r'[ \t\n]+'),
            ('MISMATCH', r'.'),
        ]
        tok_regex = '|'.join('(?P<%s>%s)' % pair for pair in token_specification)
        for mo in re.finditer(tok_regex, self.code):
            kind = mo.lastgroup
            value = mo.group()
            if kind == 'SKIP':
                continue
            elif kind == 'MISMATCH':
                # print(mo)
                raise RuntimeError(f'{value} unexpected')
            elif kind == 'NUM':
                value = int(value)
            self.tokens.append(Token(kind, value))
        self.tokens.append(Token('EOF', None))

class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0
        self.current_token = self.tokens[0]

    def eat(self, token_type):
        if self.current_token.type == token_type:
            self.pos += 1
            self.current_token = self.tokens[self.pos]
        else:
            # print(self.current_token)
            # print(self.current_token.type)
            # print(token_type)
            raise Exception(f'Expected {token_type}, got {self.current_token.type}')

    def parse(self):
        while self.current_token.type != 'EOF':
            self.statement()

    def statement(self):
        if self.current_token.type == 'VAR':
            self.var_decl()
        elif self.current_token.type == 'IF':
            self.if_stmt()
        elif self.current_token.type == 'WHILE':
            self.while_stmt()
        elif self.current_token.type == 'FOR':
            self.for_stmt()
        elif self.current_token.type == 'GOTO':
            self.goto_stmt()
        elif self.current_token.type == 'LBRACE':
            self.block()
        elif self.current_token.type == 'ID':
            # Could be assignment or label
            if self.tokens[self.pos+1].type == 'COLON':
                self.label_stmt()
            else:
                self.assignment()
        elif self.current_token.type == 'MUL': # *p = ...
            self.assignment()
        else:
            # print(f'{self.current_token}')
            raise Exception(f'Unexpected token {self.current_token}')

    def var_decl(self):
        self.eat('VAR')
        while True:
            name = self.current_token.value
            self.eat('ID')
            if self.current_token.type == 'LBRACKET':
                self.eat('LBRACKET')
                size = self.current_token.value
                self.eat('NUM')
                self.eat('RBRACKET')
                def_arr(name, size)
            else:
                def_var(name)
                if self.current_token.type == 'ASSIGN':
                    # print(self.current_token)
                    self.eat('ASSIGN')
                    self.expr()
                    # Result is in r1
                    write_var_with_reg(name, r1)
            
            if self.current_token.type == 'COMMA':
                self.eat('COMMA')
            else:
                break
        self.eat('SEMI')

    def assignment(self):
        # lvalue = expr ;
        # lvalue: ID, ID[expr], *ID
        is_deref = False
        is_array = False
        target_name = ""
        
        if self.current_token.type == 'MUL':
            self.eat('MUL')
            target_name = self.current_token.value
            self.eat('ID')
            is_deref = True
        else:
            target_name = self.current_token.value
            self.eat('ID')
            if self.current_token.type == 'LBRACKET':
                self.eat('LBRACKET')
                # Calculate index
                self.expr() # Result in r1
                # Save index to stack or temp
                emit_instr.append(f'\taddi sp, sp, -4')
                emit_instr.append(f'\tsw {r1}, 0(sp)')
                self.eat('RBRACKET')
                is_array = True

        self.eat('ASSIGN')
        self.expr() # Result in r1
        
        # Now assign r1 to target
        if is_deref:
            # *p = r1
            # Load p value (address) to r2
            read_var(target_name, r2)
            # Store r1 to 0(r2)
            # But wait, r2 is an index in SRAM? Or a real address?
            # The README says: p = &x; y = *p;
            # &x gives the index? Or the address?
            # In deref_var_to_reg: 
            # lw r2, var_index*4(rv) -> r2 gets value of p.
            # alui r3, r2, 2, SHL -> r3 = p * 4
            # alu r3, r3, rv, ADD -> r3 = address
            # So p stores the "index" (0, 1, 2...) if we follow deref_var_to_reg logic?
            # Wait, deref_var_to_reg implementation:
            # lw r2, ... (load p)
            # r3 = r2 * 4 + rv
            # lw r1, 0(r3)
            # This implies p stores an INDEX relative to rv.
            # But &x should probably return the index?
            # Let's check how &x is handled in factor().
            
            # If p stores index, then:
            read_var(target_name, r2) # r2 = index
            emit_instr.append(f'\tslli {r2}, {r2}, 2')
            emit_instr.append(f'\tadd {r2}, {r2}, {rv}')
            emit_instr.append(f'\tsw {r1}, 0({r2})')
            
        elif is_array:
            # a[i] = r1
            # Restore index from stack to r2
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            
            # Calculate address of a[i]
            # a is at var_map[target_name + "@0"]
            base_index = get_ref_var(target_name + "@0")
            # Address = rv + (base_index + index) * 4
            emit_instr.append(f'\taddi {r2}, {r2}, {base_index}')
            emit_instr.append(f'\tslli {r2}, {r2}, 2')
            emit_instr.append(f'\tadd {r2}, {r2}, {rv}')
            emit_instr.append(f'\tsw {r1}, 0({r2})')
            
        else:
            write_var_with_reg(target_name, r1)
            
        self.eat('SEMI')

    def if_stmt(self):
        self.eat('IF')
        self.expr() # Result in r1. Assume non-zero is true.
        
        l_else = new_label("ELSE")
        l_end = new_label("ENDIF")
        
        branch(r1, zero, l_else, CMP.EQ)
        
        self.block()
        
        if self.current_token.type == 'ELSE':
            emit_instr.append(f'\tj {l_end}')
            emit_label(l_else)
            self.eat('ELSE')
            self.block()
            emit_label(l_end)
        else:
            emit_label(l_else)

    def while_stmt(self):
        self.eat('WHILE')
        l_start = new_label("WHILE_START")
        l_end = new_label("WHILE_END")
        
        emit_label(l_start)
        self.expr()
        branch(r1, zero, l_end, CMP.EQ)
        
        self.block()
        emit_instr.append(f'\tj {l_start}')
        emit_label(l_end)

    def for_stmt(self):
        self.eat('FOR')
        self.eat('LPAREN')
        self.assignment() # Includes SEMI
        
        l_start = new_label("FOR_START")
        l_cond = new_label("FOR_COND")
        l_end = new_label("FOR_END")
        
        emit_label(l_start)
        self.expr() # Condition
        self.eat('SEMI')
        branch(r1, zero, l_end, CMP.EQ)
        
        # We need to execute body then increment.
        # But increment is parsed here.
        # We can parse increment and save it? Or jump?
        # Structure:
        # Init
        # Start:
        # Check Cond -> Jump End
        # Jump Body
        # Incr:
        # Do Incr
        # Jump Start
        # Body:
        # Do Body
        # Jump Incr
        # End:
        
        l_body = new_label("FOR_BODY")
        l_incr = new_label("FOR_INCR")
        
        emit_instr.append(f'\tj {l_body}')
        
        emit_label(l_incr)
        # Parse assignment but without SEMI?
        # The grammar says: assignment expr ; assignment
        # My assignment() eats SEMI.
        # I should probably refactor assignment to not eat SEMI, or handle it.
        # Let's assume the user writes `i = i + 1` without semi in the for loop?
        # README: `for(i=0; i<10; i = i+1){`
        # No semi after last assignment.
        
        # Hack: Parse assignment but expect it NOT to have semi?
        # Or just peek and consume?
        # My assignment() expects SEMI.
        # I'll make a helper `assignment_no_semi`
        self.assignment_no_semi()
        self.eat('RPAREN')
        emit_instr.append(f'\tj {l_start}')
        
        emit_label(l_body)
        self.block()
        emit_instr.append(f'\tj {l_incr}')
        
        emit_label(l_end)

    def assignment_no_semi(self):
        # Copy of assignment but without eating SEMI
        is_deref = False
        is_array = False
        target_name = ""
        
        if self.current_token.type == 'MUL':
            self.eat('MUL')
            target_name = self.current_token.value
            self.eat('ID')
            is_deref = True
        else:
            target_name = self.current_token.value
            self.eat('ID')
            if self.current_token.type == 'LBRACKET':
                self.eat('LBRACKET')
                self.expr()
                emit_instr.append(f'\taddi sp, sp, -4')
                emit_instr.append(f'\tsw {r1}, 0(sp)')
                self.eat('RBRACKET')
                is_array = True

        self.eat('ASSIGN')
        self.expr()
        
        if is_deref:
            read_var(target_name, r2)
            emit_instr.append(f'\tslli {r2}, {r2}, 2')
            emit_instr.append(f'\tadd {r2}, {r2}, {rv}')
            emit_instr.append(f'\tsw {r1}, 0({r2})')
        elif is_array:
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            base_index = get_ref_var(target_name + "@0")
            emit_instr.append(f'\taddi {r2}, {r2}, {base_index}')
            emit_instr.append(f'\tslli {r2}, {r2}, 2')
            emit_instr.append(f'\tadd {r2}, {r2}, {rv}')
            emit_instr.append(f'\tsw {r1}, 0({r2})')
        else:
            write_var_with_reg(target_name, r1)

    def goto_stmt(self):
        self.eat('GOTO')
        label = self.current_token.value
        self.eat('ID')
        self.eat('SEMI')
        emit_instr.append(f'\tj {label}')

    def label_stmt(self):
        label = self.current_token.value
        self.eat('ID')
        self.eat('COLON')
        emit_label(label)

    def block(self):
        self.eat('LBRACE')
        while self.current_token.type != 'RBRACE' and self.current_token.type != 'EOF':
            self.statement()
        self.eat('RBRACE')

    # Expressions
    def expr(self):
        self.logic_or()

    def logic_or(self):
        self.logic_and()
        while self.current_token.type == 'LOR':
            self.eat('LOR')
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.logic_and()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            # Eager logical OR: (r2 != 0) | (r1 != 0)
            emit_instr.append(f'\tsnez {r2}, {r2}')
            emit_instr.append(f'\tsnez {r1}, {r1}')
            alu(r1, r2, r1, ALU.OR)
            emit_instr.append(f'\tsnez {r1}, {r1}') # Normalize to 0/1

    def logic_and(self):
        self.bitwise_or()
        while self.current_token.type == 'LAND':
            self.eat('LAND')
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.bitwise_or()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            # Eager logical AND: (r2 != 0) & (r1 != 0)
            emit_instr.append(f'\tsnez {r2}, {r2}')
            emit_instr.append(f'\tsnez {r1}, {r1}')
            alu(r1, r2, r1, ALU.AND)

    def bitwise_or(self):
        self.bitwise_and()
        while self.current_token.type == 'BOR':
            self.eat('BOR')
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.bitwise_and()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            alu(r1, r2, r1, ALU.OR)

    def bitwise_and(self):
        self.equality()
        while self.current_token.type == 'AMP':
            self.eat('AMP')
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.equality()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            alu(r1, r2, r1, ALU.AND)

    def equality(self):
        self.relational()
        while self.current_token.type in ('EQ', 'NE'):
            op = self.current_token.type
            self.eat(op)
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.relational()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            if op == 'EQ':
                emit_instr.append(f'\tsub {r1}, {r2}, {r1}')
                emit_instr.append(f'\tseqz {r1}, {r1}')
            elif op == 'NE':
                emit_instr.append(f'\tsub {r1}, {r2}, {r1}')
                emit_instr.append(f'\tsnez {r1}, {r1}')

    def relational(self):
        self.simple_expr()
        while self.current_token.type in ('LT', 'GT', 'LE', 'GE'):
            op = self.current_token.type
            self.eat(op)
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.simple_expr()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            if op == 'LT':
                emit_instr.append(f'\tslt {r1}, {r2}, {r1}')
            elif op == 'GT':
                emit_instr.append(f'\tslt {r1}, {r1}, {r2}')
            elif op == 'LE':
                emit_instr.append(f'\tslt {r1}, {r1}, {r2}')
                emit_instr.append(f'\txori {r1}, {r1}, 1')
            elif op == 'GE':
                emit_instr.append(f'\tslt {r1}, {r2}, {r1}')
                emit_instr.append(f'\txori {r1}, {r1}, 1')

    def simple_expr(self):
        self.term()
        while self.current_token.type in ('PLUS', 'MINUS'):
            op = self.current_token.type
            self.eat(op)
            emit_instr.append(f'\taddi sp, sp, -4')
            emit_instr.append(f'\tsw {r1}, 0(sp)')
            self.term()
            emit_instr.append(f'\tlw {r2}, 0(sp)')
            emit_instr.append(f'\taddi sp, sp, 4')
            if op == 'PLUS':
                alu(r1, r2, r1, ALU.ADD)
            else:
                alu(r1, r2, r1, ALU.SUB)

    def term(self):
        self.unary()
        while self.current_token.type in ('MUL', 'DIV'):
            op = self.current_token.type
            self.eat(op)
            
            # Optimization for MUL with constant
            # If the next factor is a number, we can optimize
            if op == 'MUL' and self.current_token.type == 'NUM':
                val = self.current_token.value
                self.eat('NUM')
                # r1 has left operand
                alui(r1, r1, val, ALU.MUL)
            else:
                emit_instr.append(f'\taddi sp, sp, -4')
                emit_instr.append(f'\tsw {r1}, 0(sp)')
                self.unary()
                emit_instr.append(f'\tlw {r2}, 0(sp)')
                emit_instr.append(f'\taddi sp, sp, 4')
                if op == 'MUL':
                    alu(r1, r2, r1, ALU.MUL)
                else:
                    alu(r1, r2, r1, ALU.DIV)

    def unary(self):
        if self.current_token.type == 'LNOT':
            self.eat('LNOT')
            self.unary()
            emit_instr.append(f'\tseqz {r1}, {r1}')
        elif self.current_token.type == 'BNOT':
            self.eat('BNOT')
            self.unary()
            emit_instr.append(f'\txori {r1}, {r1}, -1')
        elif self.current_token.type == 'AMP':
            self.eat('AMP')
            name = self.current_token.value
            self.eat('ID')
            idx = get_ref_var(name)
            write_reg(r1, idx)
        elif self.current_token.type == 'MUL':
            self.eat('MUL')
            name = self.current_token.value
            self.eat('ID')
            read_var(name, r2)
            emit_instr.append(f'\tslli {r2}, {r2}, 2')
            emit_instr.append(f'\tadd {r2}, {r2}, {rv}')
            emit_instr.append(f'\tlw {r1}, 0({r2})')
        else:
            self.factor()

    def factor(self):
        if self.current_token.type == 'NUM':
            val = self.current_token.value
            self.eat('NUM')
            write_reg(r1, val)
        elif self.current_token.type == 'ID':
            name = self.current_token.value
            self.eat('ID')
            if self.current_token.type == 'LBRACKET':
                self.eat('LBRACKET')
                # Array access
                # Save current r1 if needed? No, factor produces r1.
                # But we need to calculate index.
                # We need to save registers if we are in the middle of expression?
                # Recursive calls handle stack.
                
                # We need to calculate index expression.
                # But wait, we are inside factor.
                # We need to preserve context?
                # The caller (term/simple_expr) pushes r1 to stack before calling right side.
                # So we are safe to use r1.
                
                # But inside here:
                # We need to evaluate index expr.
                # Then load array value.
                
                # We need to be careful not to overwrite anything important.
                # But since we are at the start of factor, r1 is "free" (it's the output).
                
                # However, we need to calculate index.
                # Let's call expr(). It puts result in r1.
                # But we need to know the array base.
                
                # So:
                # 1. Calculate index -> r1
                # 2. Load array base index -> r2
                # 3. Add -> r2
                # 4. Load value -> r1
                
                # But expr() uses r1.
                # So we just call expr().
                
                # Wait, if we are in `a[b[i]]`, it recurses.
                
                # So:
                self.expr() # Index in r1
                
                base_index = get_ref_var(name + "@0")
                emit_instr.append(f'\taddi {r1}, {r1}, {base_index}')
                emit_instr.append(f'\tslli {r1}, {r1}, 2')
                emit_instr.append(f'\tadd {r1}, {r1}, {rv}')
                emit_instr.append(f'\tlw {r1}, 0({r1})')
                
                self.eat('RBRACKET')
            else:
                read_var(name, r1)
        elif self.current_token.type == 'LPAREN':
            self.eat('LPAREN')
            self.expr()
            self.eat('RPAREN')
        else:
            raise Exception(f'Unexpected token in factor: {self.current_token}')

def init():
    emit_instr.append(f'\tli {rv}, {hex(var_start)}')
    # Initialize Stack Pointer (arbitrary high address or just assume it's set?)
    # Let's set it to something safe if not set.
    # But usually SP is set by crt0.
    # I'll assume SP is valid or set it to end of SRAM?
    # Let's set it to 0x40000000 for now?
    emit_instr.append(f'\tli {sp}, {hex(stack_ptr)}')


# 宏定义
table_cell_size = 1

def USE_TABLE(size):
    global table_cell_size
    table_cell_size = size
    return ""

# 在特定位置画正方形
def draw_recv(hpos, vpos, hlen, vlen, color):
    print('**********')
    print(hpos, hlen, vpos, vlen)
    # Handle potential string concatenation for code generation
    if isinstance(vpos, str) or isinstance(vlen, str):
        v_limit = f"{vpos} + {vlen}"
    else:
        v_limit = vpos + vlen
        
    if isinstance(hpos, str) or isinstance(hlen, str):
        h_limit = f"{hpos} + {hlen}"
    else:
        h_limit = hpos + hlen

    return f"""
        for(draw_x = { vpos }; draw_x < { v_limit }; draw_x =draw_x + 1){{
            for(draw_y = { hpos }; draw_y < { h_limit }; draw_y =draw_y + 1){{
                vm_index = (draw_x) * 200 + draw_y;
                vm_addr = VM_START + vm_index;
                *vm_addr = {color};
            }}
        }}

    """

def DRAW_CELL(x, y, color):
    # x: row (vertical), y: col (horizontal)
    # print('---')
    # print(x, y, color)
    # print('#####')
    # print(draw_recv(f"({y})*{table_cell_size}", f"({x})*{table_cell_size}", table_cell_size, table_cell_size, int(color,16)))
    # print('#####')
    return draw_recv(f"({y})*{table_cell_size}", f"({x})*{table_cell_size}", table_cell_size, table_cell_size, int(color,16))
    
    


def compile(init_code, loop_code):
    # code = """
    # var a,b;
    # var c;
    # a = 3*5;
    # var x = 8;

    # if a> 3{
    #     b = 5;
    #     if(b < 0){
    #         c = 4;
    #     }
    #     else{
    #         c = 3;
    #     }
    # }

    # var i;
    # var arr[10];
    # for(i=0; i<10; i = i+1){
    #     arr[i] = 8;              
    # }

    # var p;
    # x = 3;
    # p = &x;
    # var y;
    # y = *p;

    # var j = 0;
    # while(j < 3){
    #     j = j+1;
    #     if j >=2 {
    #         goto out;
    #     }
    # }
    # out:
    # j = 7;
    # """
    # init_code = f"""
    #     var x = 32;
    #     var y = 32;
    #     {USE_TABLE(10)}
    # """
    # init_code = ''

    # loop_code = """
    #     var a; 
    #     var b; 
    #     var c;
    #     var d;
    #     a = KEY_PUSH & 1;
    #     b = KEY_PUSH & 2;
    #     c = KEY_PUSH & 4;
    #     d = KEY_PUSH & 8;
    #
    #     if(a) {
    #         x = x - 1;       
    #     }
    #     if(b) {
    #         x = x + 1;       
    #     }
    #     if(c) {
    #         y = y - 1;       
    #     }
    #     if(d) {
    #         y = y + 1;       
    #     }
    #
    #     var i;
    #     var p;
    #     var vm_addr;
    #     
    # """

    # loop_code = f"""
    #     {DRAW_CELL(15, 20, 0x55555555)}
    # """
    #
    # loop_code = ''

    code = f"""
        var FINISH_TURN;
        var KEY_PUSH;
        var RAND_VAL;
        var VM_START = {vm_ptr};
        var draw_x, draw_y;
        var vm_addr, vm_index;
        var nan;
        var NULL = 4294967295;
        var KEY1 = KEY_PUSH & 1;
        var KEY2 = KEY_PUSH & 2;
        var KEY3 = KEY_PUSH & 4;
        var KEY4 = KEY_PUSH & 8;
    """ + init_code +""" 
        while(1) {
    """ + loop_code +"""
            KEY_PUSH = 0;
            while(FINISH_TURN == 0){
                nan = nan;
            }
            FINISH_TURN = 0;
        }
    """

    # print(code)

    # code = """ var x;
    #         x = 4*15;
    #         var y = &x;
    # """

    
    init()
    
    lexer = Lexer(code)
    parser = Parser(lexer.tokens)
    parser.parse()

    # 用于最后，等效生成game clk的while循环
    # emit_label(game_loop_wait_L[:-1])
    # read_var(game_clock_finish_var, clock)
    # branch(clock, zero, game_loop_wait_L[:-1] , CMP.EQ)
    # branch(zero, zero, game_loop_start_L[:-1],  CMP.JMP)

    for instr in emit_instr:
        print(instr)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='-f <source file>')
    parser.add_argument('-f', '--file', type=str, help='path to file')
    args = parser.parse_args()

    init_code = ''
    loop_code = ''
    in_init, in_loop = False, False

    USE_TABLE_MACRO =  r'USE_TABLE\(\s*([0-9]+)\s*\)'
    DRAW_CELL_MACRO =  r'DRAW_CELL\(\s*([0-9a-zA-Z_]+)\s*,\s*([0-9a-zA-Z_]+)\s*,\s*([0-9a-zA-Z]+)\s*\)'
    with open(args.file) as f:
        lines = f.readlines()

        
        tmp_code = ''

        for line in lines:
            try:
                if line[0] == '/':
                    line = ''
                else:
                    comment_start = line.index('//')
                    line = line[:comment_start - 1]
            except:
                pass

            if 'Init:' in line:
                in_init = True
            elif 'Update:' in line:
                in_loop = True
            else:
                
                use_m =  re.search(USE_TABLE_MACRO, line) 
                use_d =  re.search(DRAW_CELL_MACRO, line) 
                if use_m:
                    tmp_code = USE_TABLE(use_m.group(1))
                        
                elif use_d:
                    tmp_code = DRAW_CELL(use_d.group(1), use_d.group(2), use_d.group(3))
                else:
                    tmp_code = line
                
                if in_loop:
                    loop_code += tmp_code
                elif in_init:
                    init_code += tmp_code


    compile(init_code, loop_code)
