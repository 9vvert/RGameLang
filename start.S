    .section .init
    .globl _start
_start:
    li   sp, 0x80040000     # set stack pointer to 0x80100000
    call main               # jump to C main()
loop:
	j loop

