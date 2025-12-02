	li s0, 0x20000000
	li sp, 0x20002000
	li t0, 0x3
	slli t0, t0, 3
	sw t0, 0(s0)
	li t0, 0x4
	add t3, zero, t0
	add t0, t3, zero
	slli t2, t3, 1
	add t0, t0, t2
	slli t2, t3, 2
	add t0, t0, t2
	slli t2, t3, 3
	add t0, t0, t2
	sw t0, 0(s0)
	lw t0, 0(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x8
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	sw t0, 4(s0)
	li t0, 0x0
	sw t0, 52(s0)
	li t0, 0x1
	sw t0, 8(s0)
FOR_START_1:
	lw t0, 8(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x64
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t0, t1
	xori t0, t0, 1
	beq t0, zero, FOR_END_3
	j FOR_BODY_4
FOR_INCR_5:
	lw t0, 8(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 8(s0)
	j FOR_START_1
FOR_BODY_4:
	lw t0, 52(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 8(s0)
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 52(s0)
	j FOR_INCR_5
FOR_END_3:
	li t0, 0xa
	sw t0, 8(s0)
WHILE_START_6:
	lw t0, 8(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x3
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	snez t0, t0
	beq t0, zero, WHILE_END_7
	lw t0, 8(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	sw t0, 8(s0)
	j WHILE_START_6
WHILE_END_7:
