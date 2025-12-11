
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	80040137          	lui	sp,0x80040
   4:	180000ef          	jal	184 <main>

00000008 <loop>:
   8:	0000006f          	j	8 <loop>

0000000c <draw_cell>:
   c:	fc010113          	addi	sp,sp,-64 # 8003ffc0 <_end+0x8003f7c4>
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
  b4:	00e7a023          	sw	a4,0(a5) # 80020000 <_end+0x8001f804>
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
 12c:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332b37>
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
 184:	ed010113          	addi	sp,sp,-304
 188:	12112623          	sw	ra,300(sp)
 18c:	12812423          	sw	s0,296(sp)
 190:	13010413          	addi	s0,sp,304
 194:	800107b7          	lui	a5,0x80010
 198:	faf42223          	sw	a5,-92(s0)
 19c:	800107b7          	lui	a5,0x80010
 1a0:	00478793          	addi	a5,a5,4 # 80010004 <_end+0x8000f808>
 1a4:	faf42023          	sw	a5,-96(s0)
 1a8:	800107b7          	lui	a5,0x80010
 1ac:	00878793          	addi	a5,a5,8 # 80010008 <_end+0x8000f80c>
 1b0:	f8f42e23          	sw	a5,-100(s0)
 1b4:	800107b7          	lui	a5,0x80010
 1b8:	00c78793          	addi	a5,a5,12 # 8001000c <_end+0x8000f810>
 1bc:	f8f42c23          	sw	a5,-104(s0)
 1c0:	00300793          	li	a5,3
 1c4:	fef42423          	sw	a5,-24(s0)
 1c8:	00500793          	li	a5,5
 1cc:	fef42223          	sw	a5,-28(s0)
 1d0:	00a00793          	li	a5,10
 1d4:	fef42023          	sw	a5,-32(s0)
 1d8:	00100793          	li	a5,1
 1dc:	fcf42e23          	sw	a5,-36(s0)
 1e0:	f29ff0ef          	jal	108 <clear_screen>
 1e4:	00700793          	li	a5,7
 1e8:	f8f42a23          	sw	a5,-108(s0)
 1ec:	00500793          	li	a5,5
 1f0:	f8f42823          	sw	a5,-112(s0)
 1f4:	00300793          	li	a5,3
 1f8:	fef42623          	sw	a5,-20(s0)
 1fc:	f9442783          	lw	a5,-108(s0)
 200:	f2f42423          	sw	a5,-216(s0)
 204:	f9042783          	lw	a5,-112(s0)
 208:	00278793          	addi	a5,a5,2
 20c:	ecf42c23          	sw	a5,-296(s0)
 210:	f9442783          	lw	a5,-108(s0)
 214:	f2f42623          	sw	a5,-212(s0)
 218:	f9042783          	lw	a5,-112(s0)
 21c:	00178793          	addi	a5,a5,1
 220:	ecf42e23          	sw	a5,-292(s0)
 224:	f9442783          	lw	a5,-108(s0)
 228:	f2f42823          	sw	a5,-208(s0)
 22c:	f9042783          	lw	a5,-112(s0)
 230:	eef42023          	sw	a5,-288(s0)
 234:	fc042c23          	sw	zero,-40(s0)
 238:	04c0006f          	j	284 <main+0x100>
 23c:	fd842703          	lw	a4,-40(s0)
 240:	f2840793          	addi	a5,s0,-216
 244:	00271713          	slli	a4,a4,0x2
 248:	00f707b3          	add	a5,a4,a5
 24c:	0007a683          	lw	a3,0(a5)
 250:	fd842703          	lw	a4,-40(s0)
 254:	ed840793          	addi	a5,s0,-296
 258:	00271713          	slli	a4,a4,0x2
 25c:	00f707b3          	add	a5,a4,a5
 260:	0007a703          	lw	a4,0(a5)
 264:	00ff07b7          	lui	a5,0xff0
 268:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfef903>
 26c:	00070593          	mv	a1,a4
 270:	00068513          	mv	a0,a3
 274:	d99ff0ef          	jal	c <draw_cell>
 278:	fd842783          	lw	a5,-40(s0)
 27c:	00178793          	addi	a5,a5,1
 280:	fcf42c23          	sw	a5,-40(s0)
 284:	fd842703          	lw	a4,-40(s0)
 288:	fec42783          	lw	a5,-20(s0)
 28c:	faf748e3          	blt	a4,a5,23c <main+0xb8>
 290:	010007b7          	lui	a5,0x1000
 294:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfff803>
 298:	fe042583          	lw	a1,-32(s0)
 29c:	fe442503          	lw	a0,-28(s0)
 2a0:	d6dff0ef          	jal	c <draw_cell>
 2a4:	52c0006f          	j	7d0 <main+0x64c>
 2a8:	f9842783          	lw	a5,-104(s0)
 2ac:	0007a783          	lw	a5,0(a5)
 2b0:	f8f42623          	sw	a5,-116(s0)
 2b4:	f8c42783          	lw	a5,-116(s0)
 2b8:	0027f793          	andi	a5,a5,2
 2bc:	00078c63          	beqz	a5,2d4 <main+0x150>
 2c0:	fe842703          	lw	a4,-24(s0)
 2c4:	00100793          	li	a5,1
 2c8:	06f70863          	beq	a4,a5,338 <main+0x1b4>
 2cc:	fe042423          	sw	zero,-24(s0)
 2d0:	0680006f          	j	338 <main+0x1b4>
 2d4:	f8c42783          	lw	a5,-116(s0)
 2d8:	0047f793          	andi	a5,a5,4
 2dc:	00078c63          	beqz	a5,2f4 <main+0x170>
 2e0:	fe842783          	lw	a5,-24(s0)
 2e4:	04078a63          	beqz	a5,338 <main+0x1b4>
 2e8:	00100793          	li	a5,1
 2ec:	fef42423          	sw	a5,-24(s0)
 2f0:	0480006f          	j	338 <main+0x1b4>
 2f4:	f8c42783          	lw	a5,-116(s0)
 2f8:	0087f793          	andi	a5,a5,8
 2fc:	00078e63          	beqz	a5,318 <main+0x194>
 300:	fe842703          	lw	a4,-24(s0)
 304:	00300793          	li	a5,3
 308:	02f70863          	beq	a4,a5,338 <main+0x1b4>
 30c:	00200793          	li	a5,2
 310:	fef42423          	sw	a5,-24(s0)
 314:	0240006f          	j	338 <main+0x1b4>
 318:	f8c42783          	lw	a5,-116(s0)
 31c:	0017f793          	andi	a5,a5,1
 320:	00078c63          	beqz	a5,338 <main+0x1b4>
 324:	fe842703          	lw	a4,-24(s0)
 328:	00200793          	li	a5,2
 32c:	00f70663          	beq	a4,a5,338 <main+0x1b4>
 330:	00300793          	li	a5,3
 334:	fef42423          	sw	a5,-24(s0)
 338:	f2842783          	lw	a5,-216(s0)
 33c:	f8f42423          	sw	a5,-120(s0)
 340:	ed842783          	lw	a5,-296(s0)
 344:	f8f42223          	sw	a5,-124(s0)
 348:	f8842783          	lw	a5,-120(s0)
 34c:	fcf42a23          	sw	a5,-44(s0)
 350:	f8442783          	lw	a5,-124(s0)
 354:	fcf42823          	sw	a5,-48(s0)
 358:	fe842783          	lw	a5,-24(s0)
 35c:	02079263          	bnez	a5,380 <main+0x1fc>
 360:	f8842783          	lw	a5,-120(s0)
 364:	fff78793          	addi	a5,a5,-1
 368:	fcf42a23          	sw	a5,-44(s0)
 36c:	fd442783          	lw	a5,-44(s0)
 370:	0807d863          	bgez	a5,400 <main+0x27c>
 374:	00e00793          	li	a5,14
 378:	fcf42a23          	sw	a5,-44(s0)
 37c:	0840006f          	j	400 <main+0x27c>
 380:	fe842703          	lw	a4,-24(s0)
 384:	00100793          	li	a5,1
 388:	02f71263          	bne	a4,a5,3ac <main+0x228>
 38c:	f8842783          	lw	a5,-120(s0)
 390:	00178793          	addi	a5,a5,1
 394:	fcf42a23          	sw	a5,-44(s0)
 398:	fd442703          	lw	a4,-44(s0)
 39c:	00e00793          	li	a5,14
 3a0:	06e7d063          	bge	a5,a4,400 <main+0x27c>
 3a4:	fc042a23          	sw	zero,-44(s0)
 3a8:	0580006f          	j	400 <main+0x27c>
 3ac:	fe842703          	lw	a4,-24(s0)
 3b0:	00200793          	li	a5,2
 3b4:	02f71263          	bne	a4,a5,3d8 <main+0x254>
 3b8:	f8442783          	lw	a5,-124(s0)
 3bc:	fff78793          	addi	a5,a5,-1
 3c0:	fcf42823          	sw	a5,-48(s0)
 3c4:	fd042783          	lw	a5,-48(s0)
 3c8:	0207dc63          	bgez	a5,400 <main+0x27c>
 3cc:	01300793          	li	a5,19
 3d0:	fcf42823          	sw	a5,-48(s0)
 3d4:	02c0006f          	j	400 <main+0x27c>
 3d8:	fe842703          	lw	a4,-24(s0)
 3dc:	00300793          	li	a5,3
 3e0:	02f71063          	bne	a4,a5,400 <main+0x27c>
 3e4:	f8442783          	lw	a5,-124(s0)
 3e8:	00178793          	addi	a5,a5,1
 3ec:	fcf42823          	sw	a5,-48(s0)
 3f0:	fd042703          	lw	a4,-48(s0)
 3f4:	01300793          	li	a5,19
 3f8:	00e7d463          	bge	a5,a4,400 <main+0x27c>
 3fc:	fc042823          	sw	zero,-48(s0)
 400:	fc042623          	sw	zero,-52(s0)
 404:	fc042423          	sw	zero,-56(s0)
 408:	0540006f          	j	45c <main+0x2d8>
 40c:	fc842703          	lw	a4,-56(s0)
 410:	f2840793          	addi	a5,s0,-216
 414:	00271713          	slli	a4,a4,0x2
 418:	00f707b3          	add	a5,a4,a5
 41c:	0007a783          	lw	a5,0(a5)
 420:	fd442703          	lw	a4,-44(s0)
 424:	02f71663          	bne	a4,a5,450 <main+0x2cc>
 428:	fc842703          	lw	a4,-56(s0)
 42c:	ed840793          	addi	a5,s0,-296
 430:	00271713          	slli	a4,a4,0x2
 434:	00f707b3          	add	a5,a4,a5
 438:	0007a783          	lw	a5,0(a5)
 43c:	fd042703          	lw	a4,-48(s0)
 440:	00f71863          	bne	a4,a5,450 <main+0x2cc>
 444:	00100793          	li	a5,1
 448:	fcf42623          	sw	a5,-52(s0)
 44c:	01c0006f          	j	468 <main+0x2e4>
 450:	fc842783          	lw	a5,-56(s0)
 454:	00178793          	addi	a5,a5,1
 458:	fcf42423          	sw	a5,-56(s0)
 45c:	fc842703          	lw	a4,-56(s0)
 460:	fec42783          	lw	a5,-20(s0)
 464:	faf744e3          	blt	a4,a5,40c <main+0x288>
 468:	fcc42783          	lw	a5,-52(s0)
 46c:	00078863          	beqz	a5,47c <main+0x2f8>
 470:	fa042783          	lw	a5,-96(s0)
 474:	00100713          	li	a4,1
 478:	00e7a023          	sw	a4,0(a5)
 47c:	fa042783          	lw	a5,-96(s0)
 480:	0007a783          	lw	a5,0(a5)
 484:	34079e63          	bnez	a5,7e0 <main+0x65c>
 488:	fc042223          	sw	zero,-60(s0)
 48c:	fdc42783          	lw	a5,-36(s0)
 490:	02078463          	beqz	a5,4b8 <main+0x334>
 494:	fd442703          	lw	a4,-44(s0)
 498:	fe442783          	lw	a5,-28(s0)
 49c:	00f71e63          	bne	a4,a5,4b8 <main+0x334>
 4a0:	fd042703          	lw	a4,-48(s0)
 4a4:	fe042783          	lw	a5,-32(s0)
 4a8:	00f71863          	bne	a4,a5,4b8 <main+0x334>
 4ac:	00100793          	li	a5,1
 4b0:	fcf42223          	sw	a5,-60(s0)
 4b4:	fc042e23          	sw	zero,-36(s0)
 4b8:	fc442783          	lw	a5,-60(s0)
 4bc:	04079863          	bnez	a5,50c <main+0x388>
 4c0:	fec42783          	lw	a5,-20(s0)
 4c4:	fff78713          	addi	a4,a5,-1
 4c8:	f2840793          	addi	a5,s0,-216
 4cc:	00271713          	slli	a4,a4,0x2
 4d0:	00f707b3          	add	a5,a4,a5
 4d4:	0007a783          	lw	a5,0(a5)
 4d8:	f8f42023          	sw	a5,-128(s0)
 4dc:	fec42783          	lw	a5,-20(s0)
 4e0:	fff78713          	addi	a4,a5,-1
 4e4:	ed840793          	addi	a5,s0,-296
 4e8:	00271713          	slli	a4,a4,0x2
 4ec:	00f707b3          	add	a5,a4,a5
 4f0:	0007a783          	lw	a5,0(a5)
 4f4:	f6f42e23          	sw	a5,-132(s0)
 4f8:	333337b7          	lui	a5,0x33333
 4fc:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332b37>
 500:	f7c42583          	lw	a1,-132(s0)
 504:	f8042503          	lw	a0,-128(s0)
 508:	b05ff0ef          	jal	c <draw_cell>
 50c:	fc442783          	lw	a5,-60(s0)
 510:	08079a63          	bnez	a5,5a4 <main+0x420>
 514:	fec42783          	lw	a5,-20(s0)
 518:	fff78793          	addi	a5,a5,-1
 51c:	fcf42023          	sw	a5,-64(s0)
 520:	0680006f          	j	588 <main+0x404>
 524:	fc042783          	lw	a5,-64(s0)
 528:	fff78713          	addi	a4,a5,-1
 52c:	f2840793          	addi	a5,s0,-216
 530:	00271713          	slli	a4,a4,0x2
 534:	00f707b3          	add	a5,a4,a5
 538:	0007a703          	lw	a4,0(a5)
 53c:	fc042683          	lw	a3,-64(s0)
 540:	f2840793          	addi	a5,s0,-216
 544:	00269693          	slli	a3,a3,0x2
 548:	00f687b3          	add	a5,a3,a5
 54c:	00e7a023          	sw	a4,0(a5)
 550:	fc042783          	lw	a5,-64(s0)
 554:	fff78713          	addi	a4,a5,-1
 558:	ed840793          	addi	a5,s0,-296
 55c:	00271713          	slli	a4,a4,0x2
 560:	00f707b3          	add	a5,a4,a5
 564:	0007a703          	lw	a4,0(a5)
 568:	fc042683          	lw	a3,-64(s0)
 56c:	ed840793          	addi	a5,s0,-296
 570:	00269693          	slli	a3,a3,0x2
 574:	00f687b3          	add	a5,a3,a5
 578:	00e7a023          	sw	a4,0(a5)
 57c:	fc042783          	lw	a5,-64(s0)
 580:	fff78793          	addi	a5,a5,-1
 584:	fcf42023          	sw	a5,-64(s0)
 588:	fc042783          	lw	a5,-64(s0)
 58c:	f8f04ce3          	bgtz	a5,524 <main+0x3a0>
 590:	fd442783          	lw	a5,-44(s0)
 594:	f2f42423          	sw	a5,-216(s0)
 598:	fd042783          	lw	a5,-48(s0)
 59c:	ecf42c23          	sw	a5,-296(s0)
 5a0:	0a40006f          	j	644 <main+0x4c0>
 5a4:	fec42783          	lw	a5,-20(s0)
 5a8:	faf42e23          	sw	a5,-68(s0)
 5ac:	0680006f          	j	614 <main+0x490>
 5b0:	fbc42783          	lw	a5,-68(s0)
 5b4:	fff78713          	addi	a4,a5,-1
 5b8:	f2840793          	addi	a5,s0,-216
 5bc:	00271713          	slli	a4,a4,0x2
 5c0:	00f707b3          	add	a5,a4,a5
 5c4:	0007a703          	lw	a4,0(a5)
 5c8:	fbc42683          	lw	a3,-68(s0)
 5cc:	f2840793          	addi	a5,s0,-216
 5d0:	00269693          	slli	a3,a3,0x2
 5d4:	00f687b3          	add	a5,a3,a5
 5d8:	00e7a023          	sw	a4,0(a5)
 5dc:	fbc42783          	lw	a5,-68(s0)
 5e0:	fff78713          	addi	a4,a5,-1
 5e4:	ed840793          	addi	a5,s0,-296
 5e8:	00271713          	slli	a4,a4,0x2
 5ec:	00f707b3          	add	a5,a4,a5
 5f0:	0007a703          	lw	a4,0(a5)
 5f4:	fbc42683          	lw	a3,-68(s0)
 5f8:	ed840793          	addi	a5,s0,-296
 5fc:	00269693          	slli	a3,a3,0x2
 600:	00f687b3          	add	a5,a3,a5
 604:	00e7a023          	sw	a4,0(a5)
 608:	fbc42783          	lw	a5,-68(s0)
 60c:	fff78793          	addi	a5,a5,-1
 610:	faf42e23          	sw	a5,-68(s0)
 614:	fbc42783          	lw	a5,-68(s0)
 618:	f8f04ce3          	bgtz	a5,5b0 <main+0x42c>
 61c:	fd442783          	lw	a5,-44(s0)
 620:	f2f42423          	sw	a5,-216(s0)
 624:	fd042783          	lw	a5,-48(s0)
 628:	ecf42c23          	sw	a5,-296(s0)
 62c:	fec42703          	lw	a4,-20(s0)
 630:	01300793          	li	a5,19
 634:	00e7c863          	blt	a5,a4,644 <main+0x4c0>
 638:	fec42783          	lw	a5,-20(s0)
 63c:	00178793          	addi	a5,a5,1
 640:	fef42623          	sw	a5,-20(s0)
 644:	00ff07b7          	lui	a5,0xff0
 648:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfef903>
 64c:	fd042583          	lw	a1,-48(s0)
 650:	fd442503          	lw	a0,-44(s0)
 654:	9b9ff0ef          	jal	c <draw_cell>
 658:	fdc42783          	lw	a5,-36(s0)
 65c:	14079e63          	bnez	a5,7b8 <main+0x634>
 660:	f9c42783          	lw	a5,-100(s0)
 664:	0007a783          	lw	a5,0(a5)
 668:	f6f42c23          	sw	a5,-136(s0)
 66c:	f7842783          	lw	a5,-136(s0)
 670:	00f7f793          	andi	a5,a5,15
 674:	faf42c23          	sw	a5,-72(s0)
 678:	f7842783          	lw	a5,-136(s0)
 67c:	0087d793          	srli	a5,a5,0x8
 680:	01f7f793          	andi	a5,a5,31
 684:	faf42a23          	sw	a5,-76(s0)
 688:	fb842703          	lw	a4,-72(s0)
 68c:	00e00793          	li	a5,14
 690:	00e7d863          	bge	a5,a4,6a0 <main+0x51c>
 694:	fb842783          	lw	a5,-72(s0)
 698:	ff178793          	addi	a5,a5,-15
 69c:	faf42c23          	sw	a5,-72(s0)
 6a0:	fb442703          	lw	a4,-76(s0)
 6a4:	01300793          	li	a5,19
 6a8:	02e7d463          	bge	a5,a4,6d0 <main+0x54c>
 6ac:	fb442783          	lw	a5,-76(s0)
 6b0:	ff478793          	addi	a5,a5,-12
 6b4:	faf42a23          	sw	a5,-76(s0)
 6b8:	fb442703          	lw	a4,-76(s0)
 6bc:	01300793          	li	a5,19
 6c0:	00e7d863          	bge	a5,a4,6d0 <main+0x54c>
 6c4:	fb442783          	lw	a5,-76(s0)
 6c8:	ff478793          	addi	a5,a5,-12
 6cc:	faf42a23          	sw	a5,-76(s0)
 6d0:	00100793          	li	a5,1
 6d4:	faf42823          	sw	a5,-80(s0)
 6d8:	fa042623          	sw	zero,-84(s0)
 6dc:	09c0006f          	j	778 <main+0x5f4>
 6e0:	fa042823          	sw	zero,-80(s0)
 6e4:	fa042423          	sw	zero,-88(s0)
 6e8:	0540006f          	j	73c <main+0x5b8>
 6ec:	fa842703          	lw	a4,-88(s0)
 6f0:	f2840793          	addi	a5,s0,-216
 6f4:	00271713          	slli	a4,a4,0x2
 6f8:	00f707b3          	add	a5,a4,a5
 6fc:	0007a783          	lw	a5,0(a5)
 700:	fb842703          	lw	a4,-72(s0)
 704:	02f71663          	bne	a4,a5,730 <main+0x5ac>
 708:	fa842703          	lw	a4,-88(s0)
 70c:	ed840793          	addi	a5,s0,-296
 710:	00271713          	slli	a4,a4,0x2
 714:	00f707b3          	add	a5,a4,a5
 718:	0007a783          	lw	a5,0(a5)
 71c:	fb442703          	lw	a4,-76(s0)
 720:	00f71863          	bne	a4,a5,730 <main+0x5ac>
 724:	00100793          	li	a5,1
 728:	faf42823          	sw	a5,-80(s0)
 72c:	01c0006f          	j	748 <main+0x5c4>
 730:	fa842783          	lw	a5,-88(s0)
 734:	00178793          	addi	a5,a5,1
 738:	faf42423          	sw	a5,-88(s0)
 73c:	fa842703          	lw	a4,-88(s0)
 740:	fec42783          	lw	a5,-20(s0)
 744:	faf744e3          	blt	a4,a5,6ec <main+0x568>
 748:	fb042783          	lw	a5,-80(s0)
 74c:	02078663          	beqz	a5,778 <main+0x5f4>
 750:	fb442783          	lw	a5,-76(s0)
 754:	00178793          	addi	a5,a5,1
 758:	faf42a23          	sw	a5,-76(s0)
 75c:	fb442703          	lw	a4,-76(s0)
 760:	01300793          	li	a5,19
 764:	00e7d463          	bge	a5,a4,76c <main+0x5e8>
 768:	fa042a23          	sw	zero,-76(s0)
 76c:	fac42783          	lw	a5,-84(s0)
 770:	00178793          	addi	a5,a5,1
 774:	faf42623          	sw	a5,-84(s0)
 778:	fb042783          	lw	a5,-80(s0)
 77c:	00078863          	beqz	a5,78c <main+0x608>
 780:	fac42703          	lw	a4,-84(s0)
 784:	03100793          	li	a5,49
 788:	f4e7dce3          	bge	a5,a4,6e0 <main+0x55c>
 78c:	fb842783          	lw	a5,-72(s0)
 790:	fef42223          	sw	a5,-28(s0)
 794:	fb442783          	lw	a5,-76(s0)
 798:	fef42023          	sw	a5,-32(s0)
 79c:	00100793          	li	a5,1
 7a0:	fcf42e23          	sw	a5,-36(s0)
 7a4:	010007b7          	lui	a5,0x1000
 7a8:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfff803>
 7ac:	fe042583          	lw	a1,-32(s0)
 7b0:	fe442503          	lw	a0,-28(s0)
 7b4:	859ff0ef          	jal	c <draw_cell>
 7b8:	00000013          	nop
 7bc:	fa442783          	lw	a5,-92(s0)
 7c0:	0007a783          	lw	a5,0(a5)
 7c4:	fe078ce3          	beqz	a5,7bc <main+0x638>
 7c8:	fa442783          	lw	a5,-92(s0)
 7cc:	0007a023          	sw	zero,0(a5)
 7d0:	fa042783          	lw	a5,-96(s0)
 7d4:	0007a783          	lw	a5,0(a5)
 7d8:	ac0788e3          	beqz	a5,2a8 <main+0x124>
 7dc:	0080006f          	j	7e4 <main+0x660>
 7e0:	00000013          	nop
 7e4:	00000793          	li	a5,0
 7e8:	00078513          	mv	a0,a5
 7ec:	12c12083          	lw	ra,300(sp)
 7f0:	12812403          	lw	s0,296(sp)
 7f4:	13010113          	addi	sp,sp,304
 7f8:	00008067          	ret

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
