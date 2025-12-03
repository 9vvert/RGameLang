	li s0, 0x80010000
	li sp, 0x80030000
	li t0, 0x400
	sw t0, 12(s0)
	li t0, 0xffffffff
	sw t0, 36(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 40(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x2
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 44(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x4
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 48(s0)
	lw t0, 4(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x8
	lw t1, 0(sp)
	addi sp, sp, 4
	and t0, t1, t0
	sw t0, 52(s0)
	li t0, 0x0
	sw t0, 56(s0)
	li t0, 0x0
	sw t0, 60(s0)
	li t0, 0x0
	sw t0, 64(s0)
FOR_START_1:
	lw t0, 64(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0xf
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_3
	j FOR_BODY_4
FOR_INCR_5:
	lw t0, 64(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 64(s0)
	j FOR_START_1
FOR_BODY_4:
	li t0, 0x0
	sw t0, 68(s0)
FOR_START_6:
	lw t0, 68(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x14
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_8
	j FOR_BODY_9
FOR_INCR_10:
	lw t0, 68(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 68(s0)
	j FOR_START_6
FOR_BODY_9:
	lw t0, 64(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	sw t0, 16(s0)
FOR_START_11:
	lw t0, 16(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 64(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0xa
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_13
	j FOR_BODY_14
FOR_INCR_15:
	lw t0, 16(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 16(s0)
	j FOR_START_11
FOR_BODY_14:
	lw t0, 68(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	sw t0, 20(s0)
FOR_START_16:
	lw t0, 20(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 68(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0xa
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_18
	j FOR_BODY_19
FOR_INCR_20:
	lw t0, 20(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 20(s0)
	j FOR_START_16
FOR_BODY_19:
	lw t0, 16(s0)
	add t3, zero, t0
	slli t0, t3, 3
	slli t2, t3, 6
	add t0, t0, t2
	slli t2, t3, 7
	add t0, t0, t2
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 20(s0)
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 28(s0)
	lw t0, 12(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 28(s0)
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 24(s0)
	li t0, 0x55555555
	lw t1, 24(s0)
	lw t1, 24(s0)
	slli t1, t1, 2
	add t1, t1, s0
	sw t0, 0(t1)
	j FOR_INCR_20
FOR_END_18:
	j FOR_INCR_15
FOR_END_13:
	j FOR_INCR_10
FOR_END_8:
	j FOR_INCR_5
FOR_END_3:
WHILE_START_21:
	li t0, 0x1
	beq t0, zero, WHILE_END_22
	lw t0, 56(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	sw t0, 16(s0)
FOR_START_23:
	lw t0, 16(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 56(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0xa
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_25
	j FOR_BODY_26
FOR_INCR_27:
	lw t0, 16(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 16(s0)
	j FOR_START_23
FOR_BODY_26:
	lw t0, 60(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	sw t0, 20(s0)
FOR_START_28:
	lw t0, 20(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 60(s0)
	add t3, zero, t0
	slli t0, t3, 1
	slli t2, t3, 3
	add t0, t0, t2
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0xa
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, FOR_END_30
	j FOR_BODY_31
FOR_INCR_32:
	lw t0, 20(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 20(s0)
	j FOR_START_28
FOR_BODY_31:
	lw t0, 16(s0)
	add t3, zero, t0
	slli t0, t3, 3
	slli t2, t3, 6
	add t0, t0, t2
	slli t2, t3, 7
	add t0, t0, t2
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 20(s0)
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 28(s0)
	lw t0, 12(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 28(s0)
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 24(s0)
	li t0, 0x99999999
	lw t1, 24(s0)
	lw t1, 24(s0)
	slli t1, t1, 2
	add t1, t1, s0
	sw t0, 0(t1)
	j FOR_INCR_32
FOR_END_30:
	j FOR_INCR_27
FOR_END_25:
	lw t0, 56(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x14
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, ELSE_33
	lw t0, 56(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 56(s0)
	j ENDIF_34
ELSE_33:
	li t0, 0x0
	sw t0, 56(s0)
	lw t0, 60(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0xf
	lw t1, 0(sp)
	addi sp, sp, 4
	slt t0, t1, t0
	beq t0, zero, ELSE_35
	lw t0, 60(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x1
	lw t1, 0(sp)
	addi sp, sp, 4
	add t0, t1, t0
	sw t0, 60(s0)
	j ENDIF_36
ELSE_35:
	li t0, 0x0
	sw t0, 60(s0)
ENDIF_36:
ENDIF_34:
	li t0, 0x0
	sw t0, 4(s0)
WHILE_START_37:
	lw t0, 0(s0)
	addi sp, sp, -4
	sw t0, 0(sp)
	li t0, 0x0
	lw t1, 0(sp)
	addi sp, sp, 4
	sub t0, t1, t0
	seqz t0, t0
	beq t0, zero, WHILE_END_38
	lw t0, 32(s0)
	sw t0, 32(s0)
	j WHILE_START_37
WHILE_END_38:
	li t0, 0x0
	sw t0, 0(s0)
	j WHILE_START_21
WHILE_END_22:
