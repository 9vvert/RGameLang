	.file	"test.c"
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
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,-2147418112
	sw	a5,-20(s0)
	li	a5,-2147418112
	addi	a5,a5,4
	sw	a5,-24(s0)
	call	clear_screen
	li	a5,1431654400
	addi	a2,a5,1365
	li	a1,0
	li	a0,0
	call	draw_cell
	li	a5,1431654400
	addi	a2,a5,1365
	li	a1,7
	li	a0,3
	call	draw_cell
	li	a5,-1717985280
	addi	a2,a5,-1639
	li	a1,8
	li	a0,8
	call	draw_cell
	li	a5,0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: () 15.1.0"
	.section	.note.GNU-stack,"",@progbits
