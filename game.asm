
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	80040137          	lui	sp,0x80040
   4:	168000ef          	jal	16c <main>

00000008 <loop>:
   8:	0000006f          	j	8 <loop>

0000000c <draw_cell>:
   c:	fc010113          	addi	sp,sp,-64 # 8003ffc0 <_end+0x8003f7e0>
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
  9c:	00e7a023          	sw	a4,0(a5) # 80020000 <_end+0x8001f820>
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
 114:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332b53>
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
 16c:	ed010113          	addi	sp,sp,-304
 170:	12112623          	sw	ra,300(sp)
 174:	12812423          	sw	s0,296(sp)
 178:	13010413          	addi	s0,sp,304
 17c:	800107b7          	lui	a5,0x80010
 180:	faf42223          	sw	a5,-92(s0)
 184:	800107b7          	lui	a5,0x80010
 188:	00478793          	addi	a5,a5,4 # 80010004 <_end+0x8000f824>
 18c:	faf42023          	sw	a5,-96(s0)
 190:	800107b7          	lui	a5,0x80010
 194:	00878793          	addi	a5,a5,8 # 80010008 <_end+0x8000f828>
 198:	f8f42e23          	sw	a5,-100(s0)
 19c:	800107b7          	lui	a5,0x80010
 1a0:	00c78793          	addi	a5,a5,12 # 8001000c <_end+0x8000f82c>
 1a4:	f8f42c23          	sw	a5,-104(s0)
 1a8:	00300793          	li	a5,3
 1ac:	fef42423          	sw	a5,-24(s0)
 1b0:	00500793          	li	a5,5
 1b4:	fef42223          	sw	a5,-28(s0)
 1b8:	00a00793          	li	a5,10
 1bc:	fef42023          	sw	a5,-32(s0)
 1c0:	00100793          	li	a5,1
 1c4:	fcf42e23          	sw	a5,-36(s0)
 1c8:	00700793          	li	a5,7
 1cc:	f8f42a23          	sw	a5,-108(s0)
 1d0:	00500793          	li	a5,5
 1d4:	f8f42823          	sw	a5,-112(s0)
 1d8:	00300793          	li	a5,3
 1dc:	fef42623          	sw	a5,-20(s0)
 1e0:	f9442783          	lw	a5,-108(s0)
 1e4:	f2f42423          	sw	a5,-216(s0)
 1e8:	f9042783          	lw	a5,-112(s0)
 1ec:	00278793          	addi	a5,a5,2
 1f0:	ecf42c23          	sw	a5,-296(s0)
 1f4:	f9442783          	lw	a5,-108(s0)
 1f8:	f2f42623          	sw	a5,-212(s0)
 1fc:	f9042783          	lw	a5,-112(s0)
 200:	00178793          	addi	a5,a5,1
 204:	ecf42e23          	sw	a5,-292(s0)
 208:	f9442783          	lw	a5,-108(s0)
 20c:	f2f42823          	sw	a5,-208(s0)
 210:	f9042783          	lw	a5,-112(s0)
 214:	eef42023          	sw	a5,-288(s0)
 218:	fc042c23          	sw	zero,-40(s0)
 21c:	04c0006f          	j	268 <main+0xfc>
 220:	fd842703          	lw	a4,-40(s0)
 224:	f2840793          	addi	a5,s0,-216
 228:	00271713          	slli	a4,a4,0x2
 22c:	00f707b3          	add	a5,a4,a5
 230:	0007a683          	lw	a3,0(a5)
 234:	fd842703          	lw	a4,-40(s0)
 238:	ed840793          	addi	a5,s0,-296
 23c:	00271713          	slli	a4,a4,0x2
 240:	00f707b3          	add	a5,a4,a5
 244:	0007a703          	lw	a4,0(a5)
 248:	00ff07b7          	lui	a5,0xff0
 24c:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfef91f>
 250:	00070593          	mv	a1,a4
 254:	00068513          	mv	a0,a3
 258:	db5ff0ef          	jal	c <draw_cell>
 25c:	fd842783          	lw	a5,-40(s0)
 260:	00178793          	addi	a5,a5,1
 264:	fcf42c23          	sw	a5,-40(s0)
 268:	fd842703          	lw	a4,-40(s0)
 26c:	fec42783          	lw	a5,-20(s0)
 270:	faf748e3          	blt	a4,a5,220 <main+0xb4>
 274:	010007b7          	lui	a5,0x1000
 278:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfff81f>
 27c:	fe042583          	lw	a1,-32(s0)
 280:	fe442503          	lw	a0,-28(s0)
 284:	d89ff0ef          	jal	c <draw_cell>
 288:	52c0006f          	j	7b4 <main+0x648>
 28c:	f9842783          	lw	a5,-104(s0)
 290:	0007a783          	lw	a5,0(a5)
 294:	f8f42623          	sw	a5,-116(s0)
 298:	f8c42783          	lw	a5,-116(s0)
 29c:	0017f793          	andi	a5,a5,1
 2a0:	00078c63          	beqz	a5,2b8 <main+0x14c>
 2a4:	fe842703          	lw	a4,-24(s0)
 2a8:	00100793          	li	a5,1
 2ac:	06f70863          	beq	a4,a5,31c <main+0x1b0>
 2b0:	fe042423          	sw	zero,-24(s0)
 2b4:	0680006f          	j	31c <main+0x1b0>
 2b8:	f8c42783          	lw	a5,-116(s0)
 2bc:	0027f793          	andi	a5,a5,2
 2c0:	00078c63          	beqz	a5,2d8 <main+0x16c>
 2c4:	fe842783          	lw	a5,-24(s0)
 2c8:	04078a63          	beqz	a5,31c <main+0x1b0>
 2cc:	00100793          	li	a5,1
 2d0:	fef42423          	sw	a5,-24(s0)
 2d4:	0480006f          	j	31c <main+0x1b0>
 2d8:	f8c42783          	lw	a5,-116(s0)
 2dc:	0047f793          	andi	a5,a5,4
 2e0:	00078e63          	beqz	a5,2fc <main+0x190>
 2e4:	fe842703          	lw	a4,-24(s0)
 2e8:	00300793          	li	a5,3
 2ec:	02f70863          	beq	a4,a5,31c <main+0x1b0>
 2f0:	00200793          	li	a5,2
 2f4:	fef42423          	sw	a5,-24(s0)
 2f8:	0240006f          	j	31c <main+0x1b0>
 2fc:	f8c42783          	lw	a5,-116(s0)
 300:	0087f793          	andi	a5,a5,8
 304:	00078c63          	beqz	a5,31c <main+0x1b0>
 308:	fe842703          	lw	a4,-24(s0)
 30c:	00200793          	li	a5,2
 310:	00f70663          	beq	a4,a5,31c <main+0x1b0>
 314:	00300793          	li	a5,3
 318:	fef42423          	sw	a5,-24(s0)
 31c:	f2842783          	lw	a5,-216(s0)
 320:	f8f42423          	sw	a5,-120(s0)
 324:	ed842783          	lw	a5,-296(s0)
 328:	f8f42223          	sw	a5,-124(s0)
 32c:	f8842783          	lw	a5,-120(s0)
 330:	fcf42a23          	sw	a5,-44(s0)
 334:	f8442783          	lw	a5,-124(s0)
 338:	fcf42823          	sw	a5,-48(s0)
 33c:	fe842783          	lw	a5,-24(s0)
 340:	02079263          	bnez	a5,364 <main+0x1f8>
 344:	f8842783          	lw	a5,-120(s0)
 348:	fff78793          	addi	a5,a5,-1
 34c:	fcf42a23          	sw	a5,-44(s0)
 350:	fd442783          	lw	a5,-44(s0)
 354:	0807d863          	bgez	a5,3e4 <main+0x278>
 358:	00e00793          	li	a5,14
 35c:	fcf42a23          	sw	a5,-44(s0)
 360:	0840006f          	j	3e4 <main+0x278>
 364:	fe842703          	lw	a4,-24(s0)
 368:	00100793          	li	a5,1
 36c:	02f71263          	bne	a4,a5,390 <main+0x224>
 370:	f8842783          	lw	a5,-120(s0)
 374:	00178793          	addi	a5,a5,1
 378:	fcf42a23          	sw	a5,-44(s0)
 37c:	fd442703          	lw	a4,-44(s0)
 380:	00e00793          	li	a5,14
 384:	06e7d063          	bge	a5,a4,3e4 <main+0x278>
 388:	fc042a23          	sw	zero,-44(s0)
 38c:	0580006f          	j	3e4 <main+0x278>
 390:	fe842703          	lw	a4,-24(s0)
 394:	00200793          	li	a5,2
 398:	02f71263          	bne	a4,a5,3bc <main+0x250>
 39c:	f8442783          	lw	a5,-124(s0)
 3a0:	fff78793          	addi	a5,a5,-1
 3a4:	fcf42823          	sw	a5,-48(s0)
 3a8:	fd042783          	lw	a5,-48(s0)
 3ac:	0207dc63          	bgez	a5,3e4 <main+0x278>
 3b0:	01300793          	li	a5,19
 3b4:	fcf42823          	sw	a5,-48(s0)
 3b8:	02c0006f          	j	3e4 <main+0x278>
 3bc:	fe842703          	lw	a4,-24(s0)
 3c0:	00300793          	li	a5,3
 3c4:	02f71063          	bne	a4,a5,3e4 <main+0x278>
 3c8:	f8442783          	lw	a5,-124(s0)
 3cc:	00178793          	addi	a5,a5,1
 3d0:	fcf42823          	sw	a5,-48(s0)
 3d4:	fd042703          	lw	a4,-48(s0)
 3d8:	01300793          	li	a5,19
 3dc:	00e7d463          	bge	a5,a4,3e4 <main+0x278>
 3e0:	fc042823          	sw	zero,-48(s0)
 3e4:	fc042623          	sw	zero,-52(s0)
 3e8:	fc042423          	sw	zero,-56(s0)
 3ec:	0540006f          	j	440 <main+0x2d4>
 3f0:	fc842703          	lw	a4,-56(s0)
 3f4:	f2840793          	addi	a5,s0,-216
 3f8:	00271713          	slli	a4,a4,0x2
 3fc:	00f707b3          	add	a5,a4,a5
 400:	0007a783          	lw	a5,0(a5)
 404:	fd442703          	lw	a4,-44(s0)
 408:	02f71663          	bne	a4,a5,434 <main+0x2c8>
 40c:	fc842703          	lw	a4,-56(s0)
 410:	ed840793          	addi	a5,s0,-296
 414:	00271713          	slli	a4,a4,0x2
 418:	00f707b3          	add	a5,a4,a5
 41c:	0007a783          	lw	a5,0(a5)
 420:	fd042703          	lw	a4,-48(s0)
 424:	00f71863          	bne	a4,a5,434 <main+0x2c8>
 428:	00100793          	li	a5,1
 42c:	fcf42623          	sw	a5,-52(s0)
 430:	01c0006f          	j	44c <main+0x2e0>
 434:	fc842783          	lw	a5,-56(s0)
 438:	00178793          	addi	a5,a5,1
 43c:	fcf42423          	sw	a5,-56(s0)
 440:	fc842703          	lw	a4,-56(s0)
 444:	fec42783          	lw	a5,-20(s0)
 448:	faf744e3          	blt	a4,a5,3f0 <main+0x284>
 44c:	fcc42783          	lw	a5,-52(s0)
 450:	00078863          	beqz	a5,460 <main+0x2f4>
 454:	fa042783          	lw	a5,-96(s0)
 458:	00100713          	li	a4,1
 45c:	00e7a023          	sw	a4,0(a5)
 460:	fa042783          	lw	a5,-96(s0)
 464:	0007a783          	lw	a5,0(a5)
 468:	34079e63          	bnez	a5,7c4 <main+0x658>
 46c:	fc042223          	sw	zero,-60(s0)
 470:	fdc42783          	lw	a5,-36(s0)
 474:	02078463          	beqz	a5,49c <main+0x330>
 478:	fd442703          	lw	a4,-44(s0)
 47c:	fe442783          	lw	a5,-28(s0)
 480:	00f71e63          	bne	a4,a5,49c <main+0x330>
 484:	fd042703          	lw	a4,-48(s0)
 488:	fe042783          	lw	a5,-32(s0)
 48c:	00f71863          	bne	a4,a5,49c <main+0x330>
 490:	00100793          	li	a5,1
 494:	fcf42223          	sw	a5,-60(s0)
 498:	fc042e23          	sw	zero,-36(s0)
 49c:	fc442783          	lw	a5,-60(s0)
 4a0:	04079863          	bnez	a5,4f0 <main+0x384>
 4a4:	fec42783          	lw	a5,-20(s0)
 4a8:	fff78713          	addi	a4,a5,-1
 4ac:	f2840793          	addi	a5,s0,-216
 4b0:	00271713          	slli	a4,a4,0x2
 4b4:	00f707b3          	add	a5,a4,a5
 4b8:	0007a783          	lw	a5,0(a5)
 4bc:	f8f42023          	sw	a5,-128(s0)
 4c0:	fec42783          	lw	a5,-20(s0)
 4c4:	fff78713          	addi	a4,a5,-1
 4c8:	ed840793          	addi	a5,s0,-296
 4cc:	00271713          	slli	a4,a4,0x2
 4d0:	00f707b3          	add	a5,a4,a5
 4d4:	0007a783          	lw	a5,0(a5)
 4d8:	f6f42e23          	sw	a5,-132(s0)
 4dc:	333337b7          	lui	a5,0x33333
 4e0:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332b53>
 4e4:	f7c42583          	lw	a1,-132(s0)
 4e8:	f8042503          	lw	a0,-128(s0)
 4ec:	b21ff0ef          	jal	c <draw_cell>
 4f0:	fc442783          	lw	a5,-60(s0)
 4f4:	08079a63          	bnez	a5,588 <main+0x41c>
 4f8:	fec42783          	lw	a5,-20(s0)
 4fc:	fff78793          	addi	a5,a5,-1
 500:	fcf42023          	sw	a5,-64(s0)
 504:	0680006f          	j	56c <main+0x400>
 508:	fc042783          	lw	a5,-64(s0)
 50c:	fff78713          	addi	a4,a5,-1
 510:	f2840793          	addi	a5,s0,-216
 514:	00271713          	slli	a4,a4,0x2
 518:	00f707b3          	add	a5,a4,a5
 51c:	0007a703          	lw	a4,0(a5)
 520:	fc042683          	lw	a3,-64(s0)
 524:	f2840793          	addi	a5,s0,-216
 528:	00269693          	slli	a3,a3,0x2
 52c:	00f687b3          	add	a5,a3,a5
 530:	00e7a023          	sw	a4,0(a5)
 534:	fc042783          	lw	a5,-64(s0)
 538:	fff78713          	addi	a4,a5,-1
 53c:	ed840793          	addi	a5,s0,-296
 540:	00271713          	slli	a4,a4,0x2
 544:	00f707b3          	add	a5,a4,a5
 548:	0007a703          	lw	a4,0(a5)
 54c:	fc042683          	lw	a3,-64(s0)
 550:	ed840793          	addi	a5,s0,-296
 554:	00269693          	slli	a3,a3,0x2
 558:	00f687b3          	add	a5,a3,a5
 55c:	00e7a023          	sw	a4,0(a5)
 560:	fc042783          	lw	a5,-64(s0)
 564:	fff78793          	addi	a5,a5,-1
 568:	fcf42023          	sw	a5,-64(s0)
 56c:	fc042783          	lw	a5,-64(s0)
 570:	f8f04ce3          	bgtz	a5,508 <main+0x39c>
 574:	fd442783          	lw	a5,-44(s0)
 578:	f2f42423          	sw	a5,-216(s0)
 57c:	fd042783          	lw	a5,-48(s0)
 580:	ecf42c23          	sw	a5,-296(s0)
 584:	0a40006f          	j	628 <main+0x4bc>
 588:	fec42783          	lw	a5,-20(s0)
 58c:	faf42e23          	sw	a5,-68(s0)
 590:	0680006f          	j	5f8 <main+0x48c>
 594:	fbc42783          	lw	a5,-68(s0)
 598:	fff78713          	addi	a4,a5,-1
 59c:	f2840793          	addi	a5,s0,-216
 5a0:	00271713          	slli	a4,a4,0x2
 5a4:	00f707b3          	add	a5,a4,a5
 5a8:	0007a703          	lw	a4,0(a5)
 5ac:	fbc42683          	lw	a3,-68(s0)
 5b0:	f2840793          	addi	a5,s0,-216
 5b4:	00269693          	slli	a3,a3,0x2
 5b8:	00f687b3          	add	a5,a3,a5
 5bc:	00e7a023          	sw	a4,0(a5)
 5c0:	fbc42783          	lw	a5,-68(s0)
 5c4:	fff78713          	addi	a4,a5,-1
 5c8:	ed840793          	addi	a5,s0,-296
 5cc:	00271713          	slli	a4,a4,0x2
 5d0:	00f707b3          	add	a5,a4,a5
 5d4:	0007a703          	lw	a4,0(a5)
 5d8:	fbc42683          	lw	a3,-68(s0)
 5dc:	ed840793          	addi	a5,s0,-296
 5e0:	00269693          	slli	a3,a3,0x2
 5e4:	00f687b3          	add	a5,a3,a5
 5e8:	00e7a023          	sw	a4,0(a5)
 5ec:	fbc42783          	lw	a5,-68(s0)
 5f0:	fff78793          	addi	a5,a5,-1
 5f4:	faf42e23          	sw	a5,-68(s0)
 5f8:	fbc42783          	lw	a5,-68(s0)
 5fc:	f8f04ce3          	bgtz	a5,594 <main+0x428>
 600:	fd442783          	lw	a5,-44(s0)
 604:	f2f42423          	sw	a5,-216(s0)
 608:	fd042783          	lw	a5,-48(s0)
 60c:	ecf42c23          	sw	a5,-296(s0)
 610:	fec42703          	lw	a4,-20(s0)
 614:	01300793          	li	a5,19
 618:	00e7c863          	blt	a5,a4,628 <main+0x4bc>
 61c:	fec42783          	lw	a5,-20(s0)
 620:	00178793          	addi	a5,a5,1
 624:	fef42623          	sw	a5,-20(s0)
 628:	00ff07b7          	lui	a5,0xff0
 62c:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfef91f>
 630:	fd042583          	lw	a1,-48(s0)
 634:	fd442503          	lw	a0,-44(s0)
 638:	9d5ff0ef          	jal	c <draw_cell>
 63c:	fdc42783          	lw	a5,-36(s0)
 640:	14079e63          	bnez	a5,79c <main+0x630>
 644:	f9c42783          	lw	a5,-100(s0)
 648:	0007a783          	lw	a5,0(a5)
 64c:	f6f42c23          	sw	a5,-136(s0)
 650:	f7842783          	lw	a5,-136(s0)
 654:	00f7f793          	andi	a5,a5,15
 658:	faf42c23          	sw	a5,-72(s0)
 65c:	f7842783          	lw	a5,-136(s0)
 660:	0087d793          	srli	a5,a5,0x8
 664:	01f7f793          	andi	a5,a5,31
 668:	faf42a23          	sw	a5,-76(s0)
 66c:	fb842703          	lw	a4,-72(s0)
 670:	00e00793          	li	a5,14
 674:	00e7d863          	bge	a5,a4,684 <main+0x518>
 678:	fb842783          	lw	a5,-72(s0)
 67c:	ff178793          	addi	a5,a5,-15
 680:	faf42c23          	sw	a5,-72(s0)
 684:	fb442703          	lw	a4,-76(s0)
 688:	01300793          	li	a5,19
 68c:	02e7d463          	bge	a5,a4,6b4 <main+0x548>
 690:	fb442783          	lw	a5,-76(s0)
 694:	ff478793          	addi	a5,a5,-12
 698:	faf42a23          	sw	a5,-76(s0)
 69c:	fb442703          	lw	a4,-76(s0)
 6a0:	01300793          	li	a5,19
 6a4:	00e7d863          	bge	a5,a4,6b4 <main+0x548>
 6a8:	fb442783          	lw	a5,-76(s0)
 6ac:	ff478793          	addi	a5,a5,-12
 6b0:	faf42a23          	sw	a5,-76(s0)
 6b4:	00100793          	li	a5,1
 6b8:	faf42823          	sw	a5,-80(s0)
 6bc:	fa042623          	sw	zero,-84(s0)
 6c0:	09c0006f          	j	75c <main+0x5f0>
 6c4:	fa042823          	sw	zero,-80(s0)
 6c8:	fa042423          	sw	zero,-88(s0)
 6cc:	0540006f          	j	720 <main+0x5b4>
 6d0:	fa842703          	lw	a4,-88(s0)
 6d4:	f2840793          	addi	a5,s0,-216
 6d8:	00271713          	slli	a4,a4,0x2
 6dc:	00f707b3          	add	a5,a4,a5
 6e0:	0007a783          	lw	a5,0(a5)
 6e4:	fb842703          	lw	a4,-72(s0)
 6e8:	02f71663          	bne	a4,a5,714 <main+0x5a8>
 6ec:	fa842703          	lw	a4,-88(s0)
 6f0:	ed840793          	addi	a5,s0,-296
 6f4:	00271713          	slli	a4,a4,0x2
 6f8:	00f707b3          	add	a5,a4,a5
 6fc:	0007a783          	lw	a5,0(a5)
 700:	fb442703          	lw	a4,-76(s0)
 704:	00f71863          	bne	a4,a5,714 <main+0x5a8>
 708:	00100793          	li	a5,1
 70c:	faf42823          	sw	a5,-80(s0)
 710:	01c0006f          	j	72c <main+0x5c0>
 714:	fa842783          	lw	a5,-88(s0)
 718:	00178793          	addi	a5,a5,1
 71c:	faf42423          	sw	a5,-88(s0)
 720:	fa842703          	lw	a4,-88(s0)
 724:	fec42783          	lw	a5,-20(s0)
 728:	faf744e3          	blt	a4,a5,6d0 <main+0x564>
 72c:	fb042783          	lw	a5,-80(s0)
 730:	02078663          	beqz	a5,75c <main+0x5f0>
 734:	fb442783          	lw	a5,-76(s0)
 738:	00178793          	addi	a5,a5,1
 73c:	faf42a23          	sw	a5,-76(s0)
 740:	fb442703          	lw	a4,-76(s0)
 744:	01300793          	li	a5,19
 748:	00e7d463          	bge	a5,a4,750 <main+0x5e4>
 74c:	fa042a23          	sw	zero,-76(s0)
 750:	fac42783          	lw	a5,-84(s0)
 754:	00178793          	addi	a5,a5,1
 758:	faf42623          	sw	a5,-84(s0)
 75c:	fb042783          	lw	a5,-80(s0)
 760:	00078863          	beqz	a5,770 <main+0x604>
 764:	fac42703          	lw	a4,-84(s0)
 768:	03100793          	li	a5,49
 76c:	f4e7dce3          	bge	a5,a4,6c4 <main+0x558>
 770:	fb842783          	lw	a5,-72(s0)
 774:	fef42223          	sw	a5,-28(s0)
 778:	fb442783          	lw	a5,-76(s0)
 77c:	fef42023          	sw	a5,-32(s0)
 780:	00100793          	li	a5,1
 784:	fcf42e23          	sw	a5,-36(s0)
 788:	010007b7          	lui	a5,0x1000
 78c:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfff81f>
 790:	fe042583          	lw	a1,-32(s0)
 794:	fe442503          	lw	a0,-28(s0)
 798:	875ff0ef          	jal	c <draw_cell>
 79c:	00000013          	nop
 7a0:	fa442783          	lw	a5,-92(s0)
 7a4:	0007a783          	lw	a5,0(a5)
 7a8:	fe078ce3          	beqz	a5,7a0 <main+0x634>
 7ac:	fa442783          	lw	a5,-92(s0)
 7b0:	0007a023          	sw	zero,0(a5)
 7b4:	fa042783          	lw	a5,-96(s0)
 7b8:	0007a783          	lw	a5,0(a5)
 7bc:	ac0788e3          	beqz	a5,28c <main+0x120>
 7c0:	0080006f          	j	7c8 <main+0x65c>
 7c4:	00000013          	nop
 7c8:	00000793          	li	a5,0
 7cc:	00078513          	mv	a0,a5
 7d0:	12c12083          	lw	ra,300(sp)
 7d4:	12812403          	lw	s0,296(sp)
 7d8:	13010113          	addi	sp,sp,304
 7dc:	00008067          	ret

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
