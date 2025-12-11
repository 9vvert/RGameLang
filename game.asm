
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	80040137          	lui	sp,0x80040
   4:	180000ef          	jal	184 <main>

00000008 <loop>:
   8:	0000006f          	j	8 <loop>

0000000c <draw_cell>:
   c:	fc010113          	addi	sp,sp,-64 # 8003ffc0 <_end+0x8003fc84>
  10:	02112e23          	sw	ra,60(sp)
  14:	02812c23          	sw	s0,56(sp)
  18:	04010413          	addi	s0,sp,64
  1c:	fca42623          	sw	a0,-52(s0)
  20:	fcb42423          	sw	a1,-56(s0)
  24:	fcc42223          	sw	a2,-60(s0)
  28:	fcc42703          	lw	a4,-52(s0)
  2c:	00070793          	mv	a5,a4
  30:	00279793          	slli	a5,a5,0x2
  34:	00e787b3          	add	a5,a5,a4
  38:	00179793          	slli	a5,a5,0x1
  3c:	fef42223          	sw	a5,-28(s0)
  40:	fc842703          	lw	a4,-56(s0)
  44:	00070793          	mv	a5,a4
  48:	00279793          	slli	a5,a5,0x2
  4c:	00e787b3          	add	a5,a5,a4
  50:	00179793          	slli	a5,a5,0x1
  54:	fef42023          	sw	a5,-32(s0)
  58:	fe442783          	lw	a5,-28(s0)
  5c:	fef42623          	sw	a5,-20(s0)
  60:	0800006f          	j	e0 <draw_cell+0xd4>
  64:	fe042783          	lw	a5,-32(s0)
  68:	fef42423          	sw	a5,-24(s0)
  6c:	0580006f          	j	c4 <draw_cell+0xb8>
  70:	fec42703          	lw	a4,-20(s0)
  74:	00070793          	mv	a5,a4
  78:	00179793          	slli	a5,a5,0x1
  7c:	00e787b3          	add	a5,a5,a4
  80:	00379793          	slli	a5,a5,0x3
  84:	00e787b3          	add	a5,a5,a4
  88:	00379793          	slli	a5,a5,0x3
  8c:	00078713          	mv	a4,a5
  90:	fe842783          	lw	a5,-24(s0)
  94:	00f707b3          	add	a5,a4,a5
  98:	00279793          	slli	a5,a5,0x2
  9c:	00078713          	mv	a4,a5
  a0:	800207b7          	lui	a5,0x80020
  a4:	00f707b3          	add	a5,a4,a5
  a8:	fcf42e23          	sw	a5,-36(s0)
  ac:	fdc42783          	lw	a5,-36(s0)
  b0:	fc442703          	lw	a4,-60(s0)
  b4:	00e7a023          	sw	a4,0(a5) # 80020000 <_end+0x8001fcc4>
  b8:	fe842783          	lw	a5,-24(s0)
  bc:	00178793          	addi	a5,a5,1
  c0:	fef42423          	sw	a5,-24(s0)
  c4:	fe042783          	lw	a5,-32(s0)
  c8:	00978793          	addi	a5,a5,9
  cc:	fe842703          	lw	a4,-24(s0)
  d0:	fae7d0e3          	bge	a5,a4,70 <draw_cell+0x64>
  d4:	fec42783          	lw	a5,-20(s0)
  d8:	00178793          	addi	a5,a5,1
  dc:	fef42623          	sw	a5,-20(s0)
  e0:	fe442783          	lw	a5,-28(s0)
  e4:	00978793          	addi	a5,a5,9
  e8:	fec42703          	lw	a4,-20(s0)
  ec:	f6e7dce3          	bge	a5,a4,64 <draw_cell+0x58>
  f0:	00000013          	nop
  f4:	00000013          	nop
  f8:	03c12083          	lw	ra,60(sp)
  fc:	03812403          	lw	s0,56(sp)
 100:	04010113          	addi	sp,sp,64
 104:	00008067          	ret

00000108 <clear_screen>:
 108:	fe010113          	addi	sp,sp,-32
 10c:	00112e23          	sw	ra,28(sp)
 110:	00812c23          	sw	s0,24(sp)
 114:	02010413          	addi	s0,sp,32
 118:	fe042623          	sw	zero,-20(s0)
 11c:	0440006f          	j	160 <clear_screen+0x58>
 120:	fe042423          	sw	zero,-24(s0)
 124:	0240006f          	j	148 <clear_screen+0x40>
 128:	333337b7          	lui	a5,0x33333
 12c:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332ff7>
 130:	fe842583          	lw	a1,-24(s0)
 134:	fec42503          	lw	a0,-20(s0)
 138:	ed5ff0ef          	jal	c <draw_cell>
 13c:	fe842783          	lw	a5,-24(s0)
 140:	00178793          	addi	a5,a5,1
 144:	fef42423          	sw	a5,-24(s0)
 148:	fe842703          	lw	a4,-24(s0)
 14c:	01300793          	li	a5,19
 150:	fce7dce3          	bge	a5,a4,128 <clear_screen+0x20>
 154:	fec42783          	lw	a5,-20(s0)
 158:	00178793          	addi	a5,a5,1
 15c:	fef42623          	sw	a5,-20(s0)
 160:	fec42703          	lw	a4,-20(s0)
 164:	00e00793          	li	a5,14
 168:	fae7dce3          	bge	a5,a4,120 <clear_screen+0x18>
 16c:	00000013          	nop
 170:	00000013          	nop
 174:	01c12083          	lw	ra,28(sp)
 178:	01812403          	lw	s0,24(sp)
 17c:	02010113          	addi	sp,sp,32
 180:	00008067          	ret

00000184 <main>:
 184:	f1010113          	addi	sp,sp,-240
 188:	0e112623          	sw	ra,236(sp)
 18c:	0e812423          	sw	s0,232(sp)
 190:	0f010413          	addi	s0,sp,240
 194:	800107b7          	lui	a5,0x80010
 198:	fef42023          	sw	a5,-32(s0)
 19c:	800107b7          	lui	a5,0x80010
 1a0:	00478793          	addi	a5,a5,4 # 80010004 <_end+0x8000fcc8>
 1a4:	fcf42e23          	sw	a5,-36(s0)
 1a8:	800107b7          	lui	a5,0x80010
 1ac:	00878793          	addi	a5,a5,8 # 80010008 <_end+0x8000fccc>
 1b0:	fcf42c23          	sw	a5,-40(s0)
 1b4:	800107b7          	lui	a5,0x80010
 1b8:	00c78793          	addi	a5,a5,12 # 8001000c <_end+0x8000fcd0>
 1bc:	fcf42a23          	sw	a5,-44(s0)
 1c0:	00300793          	li	a5,3
 1c4:	fcf42823          	sw	a5,-48(s0)
 1c8:	00500793          	li	a5,5
 1cc:	fcf42623          	sw	a5,-52(s0)
 1d0:	00a00793          	li	a5,10
 1d4:	fcf42423          	sw	a5,-56(s0)
 1d8:	00100793          	li	a5,1
 1dc:	fcf42223          	sw	a5,-60(s0)
 1e0:	00700793          	li	a5,7
 1e4:	fcf42023          	sw	a5,-64(s0)
 1e8:	00500793          	li	a5,5
 1ec:	faf42e23          	sw	a5,-68(s0)
 1f0:	00300793          	li	a5,3
 1f4:	faf42c23          	sw	a5,-72(s0)
 1f8:	fc042783          	lw	a5,-64(s0)
 1fc:	f6f42423          	sw	a5,-152(s0)
 200:	fbc42783          	lw	a5,-68(s0)
 204:	00278793          	addi	a5,a5,2
 208:	f0f42c23          	sw	a5,-232(s0)
 20c:	fc042783          	lw	a5,-64(s0)
 210:	f6f42623          	sw	a5,-148(s0)
 214:	fbc42783          	lw	a5,-68(s0)
 218:	00178793          	addi	a5,a5,1
 21c:	f0f42e23          	sw	a5,-228(s0)
 220:	fc042783          	lw	a5,-64(s0)
 224:	f6f42823          	sw	a5,-144(s0)
 228:	fbc42783          	lw	a5,-68(s0)
 22c:	f2f42023          	sw	a5,-224(s0)
 230:	fe042623          	sw	zero,-20(s0)
 234:	04c0006f          	j	280 <main+0xfc>
 238:	fec42703          	lw	a4,-20(s0)
 23c:	f6840793          	addi	a5,s0,-152
 240:	00271713          	slli	a4,a4,0x2
 244:	00f707b3          	add	a5,a4,a5
 248:	0007a683          	lw	a3,0(a5)
 24c:	fec42703          	lw	a4,-20(s0)
 250:	f1840793          	addi	a5,s0,-232
 254:	00271713          	slli	a4,a4,0x2
 258:	00f707b3          	add	a5,a4,a5
 25c:	0007a703          	lw	a4,0(a5)
 260:	00ff07b7          	lui	a5,0xff0
 264:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfefdc3>
 268:	00070593          	mv	a1,a4
 26c:	00068513          	mv	a0,a3
 270:	d9dff0ef          	jal	c <draw_cell>
 274:	fec42783          	lw	a5,-20(s0)
 278:	00178793          	addi	a5,a5,1
 27c:	fef42623          	sw	a5,-20(s0)
 280:	fec42703          	lw	a4,-20(s0)
 284:	fb842783          	lw	a5,-72(s0)
 288:	faf748e3          	blt	a4,a5,238 <main+0xb4>
 28c:	010007b7          	lui	a5,0x1000
 290:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfffcc3>
 294:	fc842583          	lw	a1,-56(s0)
 298:	fcc42503          	lw	a0,-52(s0)
 29c:	d71ff0ef          	jal	c <draw_cell>
 2a0:	fe042423          	sw	zero,-24(s0)
 2a4:	fe042223          	sw	zero,-28(s0)
 2a8:	0700006f          	j	318 <main+0x194>
 2ac:	9999a7b7          	lui	a5,0x9999a
 2b0:	99978613          	addi	a2,a5,-1639 # 99999999 <_end+0x9999965d>
 2b4:	fe442583          	lw	a1,-28(s0)
 2b8:	fe842503          	lw	a0,-24(s0)
 2bc:	d51ff0ef          	jal	c <draw_cell>
 2c0:	fe442703          	lw	a4,-28(s0)
 2c4:	01200793          	li	a5,18
 2c8:	00e7ca63          	blt	a5,a4,2dc <main+0x158>
 2cc:	fe442783          	lw	a5,-28(s0)
 2d0:	00178793          	addi	a5,a5,1
 2d4:	fef42223          	sw	a5,-28(s0)
 2d8:	0280006f          	j	300 <main+0x17c>
 2dc:	fe042223          	sw	zero,-28(s0)
 2e0:	fe842703          	lw	a4,-24(s0)
 2e4:	00d00793          	li	a5,13
 2e8:	00e7ca63          	blt	a5,a4,2fc <main+0x178>
 2ec:	fe842783          	lw	a5,-24(s0)
 2f0:	00178793          	addi	a5,a5,1
 2f4:	fef42423          	sw	a5,-24(s0)
 2f8:	0080006f          	j	300 <main+0x17c>
 2fc:	fe042423          	sw	zero,-24(s0)
 300:	00000013          	nop
 304:	fe042783          	lw	a5,-32(s0)
 308:	0007a783          	lw	a5,0(a5)
 30c:	fe078ce3          	beqz	a5,304 <main+0x180>
 310:	fe042783          	lw	a5,-32(s0)
 314:	0007a023          	sw	zero,0(a5)
 318:	fdc42783          	lw	a5,-36(s0)
 31c:	0007a783          	lw	a5,0(a5)
 320:	f80786e3          	beqz	a5,2ac <main+0x128>
 324:	00000793          	li	a5,0
 328:	00078513          	mv	a0,a5
 32c:	0ec12083          	lw	ra,236(sp)
 330:	0e812403          	lw	s0,232(sp)
 334:	0f010113          	addi	sp,sp,240
 338:	00008067          	ret

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <draw_cell+0x8>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x0000
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031
