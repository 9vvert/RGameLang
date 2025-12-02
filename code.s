	li s0, 0x80410000
	li sp, 2151874560
	li t0, 0x400
	sw t0, 12(s0)
	li t0, 0x20
	sw t0, 16(s0)
	li t0, 0x20
	sw t0, 20(s0)
WHILE_START_1:
	li t0, 0x1
	beq t0, zero, WHILE_END_2
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 24(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x2
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 28(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x4
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 32(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x8
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 36(s0)
	lw t0, 24(s0)
	beq t0, zero, ELSE_3
	lw t0, 16(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	sw t0, 16(s0)
ELSE_3:
	lw t0, 28(s0)
	beq t0, zero, ELSE_5
	lw t0, 16(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 16(s0)
ELSE_5:
	lw t0, 32(s0)
	beq t0, zero, ELSE_7
	lw t0, 20(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	sw t0, 20(s0)
ELSE_7:
	lw t0, 36(s0)
	beq t0, zero, ELSE_9
	lw t0, 20(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 20(s0)
ELSE_9:
	li t0, 0x0
	sw t0, 40(s0)
FOR_START_11:
	lw t0, 40(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x96
	add t3, zero, t0
	slli t0, t3, 3
	slli t2, t3, 6
	add t0, t0, t2
	slli t2, t3, 7
	add t0, t0, t2
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_13
	j FOR_BODY_14
FOR_INCR_15:
	lw t0, 40(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 40(s0)
	j FOR_START_11
FOR_BODY_14:
	lw t0, 12(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 40(s0)
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 44(s0)
	lw t0, 40(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x96
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, ELSE_16
	li t0, 0x22222222
	lw t1, 44(s0)
	lw t1, 44(s0)
	slli t1, t1, 2
	add t1, t1, s0
	sw t0, 0(t1)
	j ENDIF_17
ELSE_16:
	li t0, 0x88888888
	lw t1, 44(s0)
	lw t1, 44(s0)
	slli t1, t1, 2
	add t1, t1, s0
	sw t0, 0(t1)
ENDIF_17:
	j FOR_INCR_15
FOR_END_13:
WHILE_START_18:
	lw t0, 0(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x0
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	seqz t0, t0
	beq t0, zero, WHILE_END_19
	lw t0, 16(s0)
	sw t0, 16(s0)
	j WHILE_START_18
WHILE_END_19:
	li t0, 0x0
	sw t0, 0(s0)
	li t0, 0x0
	sw t0, 4(s0)
	j WHILE_START_1
WHILE_END_2:
