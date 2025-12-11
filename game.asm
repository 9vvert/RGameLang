
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	80040137          	lui	sp,0x80040
   4:	168000ef          	jal	16c <main>

00000008 <loop>:
   8:	0000006f          	j	8 <loop>

0000000c <draw_cell>:
   c:	fc010113          	addi	sp,sp,-64 # 8003ffc0 <_end+0x8003fc9c>
  10:	02112e23          	sw	ra,60(sp)
  14:	02812c23          	sw	s0,56(sp)
  18:	04010413          	addi	s0,sp,64
  1c:	fca42623          	sw	a0,-52(s0)
  20:	fcb42423          	sw	a1,-56(s0)
  24:	fcc42223          	sw	a2,-60(s0)
  28:	fcc42783          	lw	a5,-52(s0)
  2c:	00279793          	slli	a5,a5,0x2
  30:	fef42223          	sw	a5,-28(s0)
  34:	fc842783          	lw	a5,-56(s0)
  38:	00279793          	slli	a5,a5,0x2
  3c:	fef42023          	sw	a5,-32(s0)
  40:	fe442783          	lw	a5,-28(s0)
  44:	fef42623          	sw	a5,-20(s0)
  48:	0800006f          	j	c8 <draw_cell+0xbc>
  4c:	fe042783          	lw	a5,-32(s0)
  50:	fef42423          	sw	a5,-24(s0)
  54:	0580006f          	j	ac <draw_cell+0xa0>
  58:	fec42703          	lw	a4,-20(s0)
  5c:	00070793          	mv	a5,a4
  60:	00179793          	slli	a5,a5,0x1
  64:	00e787b3          	add	a5,a5,a4
  68:	00379793          	slli	a5,a5,0x3
  6c:	00e787b3          	add	a5,a5,a4
  70:	00379793          	slli	a5,a5,0x3
  74:	00078713          	mv	a4,a5
  78:	fe842783          	lw	a5,-24(s0)
  7c:	00f707b3          	add	a5,a4,a5
  80:	00279793          	slli	a5,a5,0x2
  84:	00078713          	mv	a4,a5
  88:	800207b7          	lui	a5,0x80020
  8c:	00f707b3          	add	a5,a4,a5
  90:	fcf42e23          	sw	a5,-36(s0)
  94:	fdc42783          	lw	a5,-36(s0)
  98:	fc442703          	lw	a4,-60(s0)
  9c:	00e7a023          	sw	a4,0(a5) # 80020000 <_end+0x8001fcdc>
  a0:	fe842783          	lw	a5,-24(s0)
  a4:	00178793          	addi	a5,a5,1
  a8:	fef42423          	sw	a5,-24(s0)
  ac:	fe042783          	lw	a5,-32(s0)
  b0:	00378793          	addi	a5,a5,3
  b4:	fe842703          	lw	a4,-24(s0)
  b8:	fae7d0e3          	bge	a5,a4,58 <draw_cell+0x4c>
  bc:	fec42783          	lw	a5,-20(s0)
  c0:	00178793          	addi	a5,a5,1
  c4:	fef42623          	sw	a5,-20(s0)
  c8:	fe442783          	lw	a5,-28(s0)
  cc:	00378793          	addi	a5,a5,3
  d0:	fec42703          	lw	a4,-20(s0)
  d4:	f6e7dce3          	bge	a5,a4,4c <draw_cell+0x40>
  d8:	00000013          	nop
  dc:	00000013          	nop
  e0:	03c12083          	lw	ra,60(sp)
  e4:	03812403          	lw	s0,56(sp)
  e8:	04010113          	addi	sp,sp,64
  ec:	00008067          	ret

000000f0 <clear_screen>:
  f0:	fe010113          	addi	sp,sp,-32
  f4:	00112e23          	sw	ra,28(sp)
  f8:	00812c23          	sw	s0,24(sp)
  fc:	02010413          	addi	s0,sp,32
 100:	fe042623          	sw	zero,-20(s0)
 104:	0440006f          	j	148 <clear_screen+0x58>
 108:	fe042423          	sw	zero,-24(s0)
 10c:	0240006f          	j	130 <clear_screen+0x40>
 110:	333337b7          	lui	a5,0x33333
 114:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x3333300f>
 118:	fe842583          	lw	a1,-24(s0)
 11c:	fec42503          	lw	a0,-20(s0)
 120:	eedff0ef          	jal	c <draw_cell>
 124:	fe842783          	lw	a5,-24(s0)
 128:	00178793          	addi	a5,a5,1
 12c:	fef42423          	sw	a5,-24(s0)
 130:	fe842703          	lw	a4,-24(s0)
 134:	01300793          	li	a5,19
 138:	fce7dce3          	bge	a5,a4,110 <clear_screen+0x20>
 13c:	fec42783          	lw	a5,-20(s0)
 140:	00178793          	addi	a5,a5,1
 144:	fef42623          	sw	a5,-20(s0)
 148:	fec42703          	lw	a4,-20(s0)
 14c:	00e00793          	li	a5,14
 150:	fae7dce3          	bge	a5,a4,108 <clear_screen+0x18>
 154:	00000013          	nop
 158:	00000013          	nop
 15c:	01c12083          	lw	ra,28(sp)
 160:	01812403          	lw	s0,24(sp)
 164:	02010113          	addi	sp,sp,32
 168:	00008067          	ret

0000016c <main>:
 16c:	f1010113          	addi	sp,sp,-240
 170:	0e112623          	sw	ra,236(sp)
 174:	0e812423          	sw	s0,232(sp)
 178:	0f010413          	addi	s0,sp,240
 17c:	800107b7          	lui	a5,0x80010
 180:	fef42023          	sw	a5,-32(s0)
 184:	800107b7          	lui	a5,0x80010
 188:	00478793          	addi	a5,a5,4 # 80010004 <_end+0x8000fce0>
 18c:	fcf42e23          	sw	a5,-36(s0)
 190:	800107b7          	lui	a5,0x80010
 194:	00878793          	addi	a5,a5,8 # 80010008 <_end+0x8000fce4>
 198:	fcf42c23          	sw	a5,-40(s0)
 19c:	800107b7          	lui	a5,0x80010
 1a0:	00c78793          	addi	a5,a5,12 # 8001000c <_end+0x8000fce8>
 1a4:	fcf42a23          	sw	a5,-44(s0)
 1a8:	00300793          	li	a5,3
 1ac:	fcf42823          	sw	a5,-48(s0)
 1b0:	00500793          	li	a5,5
 1b4:	fcf42623          	sw	a5,-52(s0)
 1b8:	00a00793          	li	a5,10
 1bc:	fcf42423          	sw	a5,-56(s0)
 1c0:	00100793          	li	a5,1
 1c4:	fcf42223          	sw	a5,-60(s0)
 1c8:	00700793          	li	a5,7
 1cc:	fcf42023          	sw	a5,-64(s0)
 1d0:	00500793          	li	a5,5
 1d4:	faf42e23          	sw	a5,-68(s0)
 1d8:	00300793          	li	a5,3
 1dc:	faf42c23          	sw	a5,-72(s0)
 1e0:	fc042783          	lw	a5,-64(s0)
 1e4:	f6f42423          	sw	a5,-152(s0)
 1e8:	fbc42783          	lw	a5,-68(s0)
 1ec:	00278793          	addi	a5,a5,2
 1f0:	f0f42c23          	sw	a5,-232(s0)
 1f4:	fc042783          	lw	a5,-64(s0)
 1f8:	f6f42623          	sw	a5,-148(s0)
 1fc:	fbc42783          	lw	a5,-68(s0)
 200:	00178793          	addi	a5,a5,1
 204:	f0f42e23          	sw	a5,-228(s0)
 208:	fc042783          	lw	a5,-64(s0)
 20c:	f6f42823          	sw	a5,-144(s0)
 210:	fbc42783          	lw	a5,-68(s0)
 214:	f2f42023          	sw	a5,-224(s0)
 218:	fe042623          	sw	zero,-20(s0)
 21c:	04c0006f          	j	268 <main+0xfc>
 220:	fec42703          	lw	a4,-20(s0)
 224:	f6840793          	addi	a5,s0,-152
 228:	00271713          	slli	a4,a4,0x2
 22c:	00f707b3          	add	a5,a4,a5
 230:	0007a683          	lw	a3,0(a5)
 234:	fec42703          	lw	a4,-20(s0)
 238:	f1840793          	addi	a5,s0,-232
 23c:	00271713          	slli	a4,a4,0x2
 240:	00f707b3          	add	a5,a4,a5
 244:	0007a703          	lw	a4,0(a5)
 248:	00ff07b7          	lui	a5,0xff0
 24c:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfefddb>
 250:	00070593          	mv	a1,a4
 254:	00068513          	mv	a0,a3
 258:	db5ff0ef          	jal	c <draw_cell>
 25c:	fec42783          	lw	a5,-20(s0)
 260:	00178793          	addi	a5,a5,1
 264:	fef42623          	sw	a5,-20(s0)
 268:	fec42703          	lw	a4,-20(s0)
 26c:	fb842783          	lw	a5,-72(s0)
 270:	faf748e3          	blt	a4,a5,220 <main+0xb4>
 274:	010007b7          	lui	a5,0x1000
 278:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfffcdb>
 27c:	fc842583          	lw	a1,-56(s0)
 280:	fcc42503          	lw	a0,-52(s0)
 284:	d89ff0ef          	jal	c <draw_cell>
 288:	fe042423          	sw	zero,-24(s0)
 28c:	fe042223          	sw	zero,-28(s0)
 290:	0700006f          	j	300 <main+0x194>
 294:	9999a7b7          	lui	a5,0x9999a
 298:	99978613          	addi	a2,a5,-1639 # 99999999 <_end+0x99999675>
 29c:	fe442583          	lw	a1,-28(s0)
 2a0:	fe842503          	lw	a0,-24(s0)
 2a4:	d69ff0ef          	jal	c <draw_cell>
 2a8:	fe442703          	lw	a4,-28(s0)
 2ac:	01200793          	li	a5,18
 2b0:	00e7ca63          	blt	a5,a4,2c4 <main+0x158>
 2b4:	fe442783          	lw	a5,-28(s0)
 2b8:	00178793          	addi	a5,a5,1
 2bc:	fef42223          	sw	a5,-28(s0)
 2c0:	0280006f          	j	2e8 <main+0x17c>
 2c4:	fe042223          	sw	zero,-28(s0)
 2c8:	fe842703          	lw	a4,-24(s0)
 2cc:	00d00793          	li	a5,13
 2d0:	00e7ca63          	blt	a5,a4,2e4 <main+0x178>
 2d4:	fe842783          	lw	a5,-24(s0)
 2d8:	00178793          	addi	a5,a5,1
 2dc:	fef42423          	sw	a5,-24(s0)
 2e0:	0080006f          	j	2e8 <main+0x17c>
 2e4:	fe042423          	sw	zero,-24(s0)
 2e8:	00000013          	nop
 2ec:	fe042783          	lw	a5,-32(s0)
 2f0:	0007a783          	lw	a5,0(a5)
 2f4:	fe078ce3          	beqz	a5,2ec <main+0x180>
 2f8:	fe042783          	lw	a5,-32(s0)
 2fc:	0007a023          	sw	zero,0(a5)
 300:	fdc42783          	lw	a5,-36(s0)
 304:	0007a783          	lw	a5,0(a5)
 308:	f80786e3          	beqz	a5,294 <main+0x128>
 30c:	00000793          	li	a5,0
 310:	00078513          	mv	a0,a5
 314:	0ec12083          	lw	ra,236(sp)
 318:	0e812403          	lw	s0,232(sp)
 31c:	0f010113          	addi	sp,sp,240
 320:	00008067          	ret

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
