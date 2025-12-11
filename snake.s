	.file	"snake.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	draw_cell
	.type	draw_cell, @function
draw_cell:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	lw	a4,-52(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	sw	a5,-28(s0)
	lw	a4,-56(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	sw	a5,-32(s0)
	lw	a5,-28(s0)
	sw	a5,-20(s0)
	j	.L2
.L5:
	lw	a5,-32(s0)
	sw	a5,-24(s0)
	j	.L3
.L4:
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,3
	mv	a4,a5
	lw	a5,-24(s0)
	add	a5,a4,a5
	slli	a5,a5,2
	mv	a4,a5
	li	a5,-2147352576
	add	a5,a4,a5
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	lw	a4,-60(s0)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a5,-32(s0)
	addi	a5,a5,9
	lw	a4,-24(s0)
	ble	a4,a5,.L4
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-28(s0)
	addi	a5,a5,9
	lw	a4,-20(s0)
	ble	a4,a5,.L5
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	draw_cell, .-draw_cell
	.align	2
	.globl	clear_screen
	.type	clear_screen, @function
clear_screen:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L7
.L10:
	sw	zero,-24(s0)
	j	.L8
.L9:
	li	a5,858992640
	addi	a2,a5,819
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	draw_cell
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L8:
	lw	a4,-24(s0)
	li	a5,19
	ble	a4,a5,.L9
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L7:
	lw	a4,-20(s0)
	li	a5,14
	ble	a4,a5,.L10
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	clear_screen, .-clear_screen
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-304
	sw	ra,300(sp)
	sw	s0,296(sp)
	addi	s0,sp,304
	li	a5,-2147418112
	sw	a5,-92(s0)
	li	a5,-2147418112
	addi	a5,a5,4
	sw	a5,-96(s0)
	li	a5,-2147418112
	addi	a5,a5,8
	sw	a5,-100(s0)
	li	a5,-2147418112
	addi	a5,a5,12
	sw	a5,-104(s0)
	li	a5,3
	sw	a5,-24(s0)
	li	a5,5
	sw	a5,-28(s0)
	li	a5,10
	sw	a5,-32(s0)
	li	a5,1
	sw	a5,-36(s0)
	call	clear_screen
	li	a5,7
	sw	a5,-108(s0)
	li	a5,5
	sw	a5,-112(s0)
	li	a5,3
	sw	a5,-20(s0)
	lw	a5,-108(s0)
	sw	a5,-216(s0)
	lw	a5,-112(s0)
	addi	a5,a5,2
	sw	a5,-296(s0)
	lw	a5,-108(s0)
	sw	a5,-212(s0)
	lw	a5,-112(s0)
	addi	a5,a5,1
	sw	a5,-292(s0)
	lw	a5,-108(s0)
	sw	a5,-208(s0)
	lw	a5,-112(s0)
	sw	a5,-288(s0)
	sw	zero,-40(s0)
	j	.L12
.L13:
	lw	a4,-40(s0)
	addi	a5,s0,-216
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a4,-40(s0)
	addi	a5,s0,-296
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a4,0(a5)
	li	a5,16711680
	addi	a2,a5,255
	mv	a1,a4
	mv	a0,a3
	call	draw_cell
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L12:
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L13
	li	a5,16777216
	addi	a2,a5,-1
	lw	a1,-32(s0)
	lw	a0,-28(s0)
	call	draw_cell
	j	.L14
.L50:
	lw	a5,-104(s0)
	lw	a5,0(a5)
	sw	a5,-116(s0)
	lw	a5,-116(s0)
	andi	a5,a5,1
	beq	a5,zero,.L15
	lw	a4,-24(s0)
	li	a5,1
	beq	a4,a5,.L16
	sw	zero,-24(s0)
	j	.L16
.L15:
	lw	a5,-116(s0)
	andi	a5,a5,2
	beq	a5,zero,.L17
	lw	a5,-24(s0)
	beq	a5,zero,.L16
	li	a5,1
	sw	a5,-24(s0)
	j	.L16
.L17:
	lw	a5,-116(s0)
	andi	a5,a5,4
	beq	a5,zero,.L18
	lw	a4,-24(s0)
	li	a5,3
	beq	a4,a5,.L16
	li	a5,2
	sw	a5,-24(s0)
	j	.L16
.L18:
	lw	a5,-116(s0)
	andi	a5,a5,8
	beq	a5,zero,.L16
	lw	a4,-24(s0)
	li	a5,2
	beq	a4,a5,.L16
	li	a5,3
	sw	a5,-24(s0)
.L16:
	lw	a5,-216(s0)
	sw	a5,-120(s0)
	lw	a5,-296(s0)
	sw	a5,-124(s0)
	lw	a5,-120(s0)
	sw	a5,-44(s0)
	lw	a5,-124(s0)
	sw	a5,-48(s0)
	lw	a5,-24(s0)
	bne	a5,zero,.L19
	lw	a5,-120(s0)
	addi	a5,a5,-1
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	bge	a5,zero,.L20
	li	a5,14
	sw	a5,-44(s0)
	j	.L20
.L19:
	lw	a4,-24(s0)
	li	a5,1
	bne	a4,a5,.L21
	lw	a5,-120(s0)
	addi	a5,a5,1
	sw	a5,-44(s0)
	lw	a4,-44(s0)
	li	a5,14
	ble	a4,a5,.L20
	sw	zero,-44(s0)
	j	.L20
.L21:
	lw	a4,-24(s0)
	li	a5,2
	bne	a4,a5,.L22
	lw	a5,-124(s0)
	addi	a5,a5,-1
	sw	a5,-48(s0)
	lw	a5,-48(s0)
	bge	a5,zero,.L20
	li	a5,19
	sw	a5,-48(s0)
	j	.L20
.L22:
	lw	a4,-24(s0)
	li	a5,3
	bne	a4,a5,.L20
	lw	a5,-124(s0)
	addi	a5,a5,1
	sw	a5,-48(s0)
	lw	a4,-48(s0)
	li	a5,19
	ble	a4,a5,.L20
	sw	zero,-48(s0)
.L20:
	sw	zero,-52(s0)
	sw	zero,-56(s0)
	j	.L23
.L26:
	lw	a4,-56(s0)
	addi	a5,s0,-216
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-44(s0)
	bne	a4,a5,.L24
	lw	a4,-56(s0)
	addi	a5,s0,-296
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-48(s0)
	bne	a4,a5,.L24
	li	a5,1
	sw	a5,-52(s0)
	j	.L25
.L24:
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
.L23:
	lw	a4,-56(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L26
.L25:
	lw	a5,-52(s0)
	beq	a5,zero,.L27
	lw	a5,-96(s0)
	li	a4,1
	sw	a4,0(a5)
.L27:
	lw	a5,-96(s0)
	lw	a5,0(a5)
	bne	a5,zero,.L52
	sw	zero,-60(s0)
	lw	a5,-36(s0)
	beq	a5,zero,.L30
	lw	a4,-44(s0)
	lw	a5,-28(s0)
	bne	a4,a5,.L30
	lw	a4,-48(s0)
	lw	a5,-32(s0)
	bne	a4,a5,.L30
	li	a5,1
	sw	a5,-60(s0)
	sw	zero,-36(s0)
.L30:
	lw	a5,-60(s0)
	bne	a5,zero,.L31
	lw	a5,-20(s0)
	addi	a4,a5,-1
	addi	a5,s0,-216
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-128(s0)
	lw	a5,-20(s0)
	addi	a4,a5,-1
	addi	a5,s0,-296
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-132(s0)
	li	a5,858992640
	addi	a2,a5,819
	lw	a1,-132(s0)
	lw	a0,-128(s0)
	call	draw_cell
.L31:
	lw	a5,-60(s0)
	bne	a5,zero,.L32
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-64(s0)
	j	.L33
.L34:
	lw	a5,-64(s0)
	addi	a4,a5,-1
	addi	a5,s0,-216
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a3,-64(s0)
	addi	a5,s0,-216
	slli	a3,a3,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-64(s0)
	addi	a4,a5,-1
	addi	a5,s0,-296
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a3,-64(s0)
	addi	a5,s0,-296
	slli	a3,a3,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-64(s0)
	addi	a5,a5,-1
	sw	a5,-64(s0)
.L33:
	lw	a5,-64(s0)
	bgt	a5,zero,.L34
	lw	a5,-44(s0)
	sw	a5,-216(s0)
	lw	a5,-48(s0)
	sw	a5,-296(s0)
	j	.L35
.L32:
	lw	a5,-20(s0)
	sw	a5,-68(s0)
	j	.L36
.L37:
	lw	a5,-68(s0)
	addi	a4,a5,-1
	addi	a5,s0,-216
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a3,-68(s0)
	addi	a5,s0,-216
	slli	a3,a3,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-68(s0)
	addi	a4,a5,-1
	addi	a5,s0,-296
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a3,-68(s0)
	addi	a5,s0,-296
	slli	a3,a3,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-68(s0)
	addi	a5,a5,-1
	sw	a5,-68(s0)
.L36:
	lw	a5,-68(s0)
	bgt	a5,zero,.L37
	lw	a5,-44(s0)
	sw	a5,-216(s0)
	lw	a5,-48(s0)
	sw	a5,-296(s0)
	lw	a4,-20(s0)
	li	a5,19
	bgt	a4,a5,.L35
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L35:
	li	a5,16711680
	addi	a2,a5,255
	lw	a1,-48(s0)
	lw	a0,-44(s0)
	call	draw_cell
	lw	a5,-36(s0)
	bne	a5,zero,.L53
	lw	a5,-100(s0)
	lw	a5,0(a5)
	sw	a5,-136(s0)
	lw	a5,-136(s0)
	andi	a5,a5,15
	sw	a5,-72(s0)
	lw	a5,-136(s0)
	srli	a5,a5,8
	andi	a5,a5,31
	sw	a5,-76(s0)
	lw	a4,-72(s0)
	li	a5,14
	ble	a4,a5,.L39
	lw	a5,-72(s0)
	addi	a5,a5,-15
	sw	a5,-72(s0)
.L39:
	lw	a4,-76(s0)
	li	a5,19
	ble	a4,a5,.L40
	lw	a5,-76(s0)
	addi	a5,a5,-12
	sw	a5,-76(s0)
	lw	a4,-76(s0)
	li	a5,19
	ble	a4,a5,.L40
	lw	a5,-76(s0)
	addi	a5,a5,-12
	sw	a5,-76(s0)
.L40:
	li	a5,1
	sw	a5,-80(s0)
	sw	zero,-84(s0)
	j	.L41
.L48:
	sw	zero,-80(s0)
	sw	zero,-88(s0)
	j	.L42
.L45:
	lw	a4,-88(s0)
	addi	a5,s0,-216
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-72(s0)
	bne	a4,a5,.L43
	lw	a4,-88(s0)
	addi	a5,s0,-296
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-76(s0)
	bne	a4,a5,.L43
	li	a5,1
	sw	a5,-80(s0)
	j	.L44
.L43:
	lw	a5,-88(s0)
	addi	a5,a5,1
	sw	a5,-88(s0)
.L42:
	lw	a4,-88(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L45
.L44:
	lw	a5,-80(s0)
	beq	a5,zero,.L41
	lw	a5,-76(s0)
	addi	a5,a5,1
	sw	a5,-76(s0)
	lw	a4,-76(s0)
	li	a5,19
	ble	a4,a5,.L46
	sw	zero,-76(s0)
.L46:
	lw	a5,-84(s0)
	addi	a5,a5,1
	sw	a5,-84(s0)
.L41:
	lw	a5,-80(s0)
	beq	a5,zero,.L47
	lw	a4,-84(s0)
	li	a5,49
	ble	a4,a5,.L48
.L47:
	lw	a5,-72(s0)
	sw	a5,-28(s0)
	lw	a5,-76(s0)
	sw	a5,-32(s0)
	li	a5,1
	sw	a5,-36(s0)
	li	a5,16777216
	addi	a2,a5,-1
	lw	a1,-32(s0)
	lw	a0,-28(s0)
	call	draw_cell
.L53:
	nop
.L49:
	lw	a5,-92(s0)
	lw	a5,0(a5)
	beq	a5,zero,.L49
	lw	a5,-92(s0)
	sw	zero,0(a5)
.L14:
	lw	a5,-96(s0)
	lw	a5,0(a5)
	beq	a5,zero,.L50
	j	.L29
.L52:
	nop
.L29:
	li	a5,0
	mv	a0,a5
	lw	ra,300(sp)
	lw	s0,296(sp)
	addi	sp,sp,304
	jr	ra
	.size	main, .-main
	.ident	"GCC: () 15.1.0"
	.section	.note.GNU-stack,"",@progbits
