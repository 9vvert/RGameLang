
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	80040137          	lui	sp,0x80040
   4:	180000ef          	jal	184 <main>

00000008 <loop>:
   8:	0000006f          	j	8 <loop>

0000000c <draw_cell>:
   c:	fc010113          	addi	sp,sp,-64 # 8003ffc0 <_end+0x8003f7c8>
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
  b4:	00e7a023          	sw	a4,0(a5) # 80020000 <_end+0x8001f808>
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
 12c:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332b3b>
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
 1a0:	00478793          	addi	a5,a5,4 # 80010004 <_end+0x8000f80c>
 1a4:	faf42023          	sw	a5,-96(s0)
 1a8:	800107b7          	lui	a5,0x80010
 1ac:	00878793          	addi	a5,a5,8 # 80010008 <_end+0x8000f810>
 1b0:	f8f42e23          	sw	a5,-100(s0)
 1b4:	800107b7          	lui	a5,0x80010
 1b8:	00c78793          	addi	a5,a5,12 # 8001000c <_end+0x8000f814>
 1bc:	f8f42c23          	sw	a5,-104(s0)
 1c0:	00300793          	li	a5,3
 1c4:	fef42423          	sw	a5,-24(s0)
 1c8:	00500793          	li	a5,5
 1cc:	fef42223          	sw	a5,-28(s0)
 1d0:	00a00793          	li	a5,10
 1d4:	fef42023          	sw	a5,-32(s0)
 1d8:	00100793          	li	a5,1
 1dc:	fcf42e23          	sw	a5,-36(s0)
 1e0:	00700793          	li	a5,7
 1e4:	f8f42a23          	sw	a5,-108(s0)
 1e8:	00500793          	li	a5,5
 1ec:	f8f42823          	sw	a5,-112(s0)
 1f0:	00300793          	li	a5,3
 1f4:	fef42623          	sw	a5,-20(s0)
 1f8:	f9442783          	lw	a5,-108(s0)
 1fc:	f2f42423          	sw	a5,-216(s0)
 200:	f9042783          	lw	a5,-112(s0)
 204:	00278793          	addi	a5,a5,2
 208:	ecf42c23          	sw	a5,-296(s0)
 20c:	f9442783          	lw	a5,-108(s0)
 210:	f2f42623          	sw	a5,-212(s0)
 214:	f9042783          	lw	a5,-112(s0)
 218:	00178793          	addi	a5,a5,1
 21c:	ecf42e23          	sw	a5,-292(s0)
 220:	f9442783          	lw	a5,-108(s0)
 224:	f2f42823          	sw	a5,-208(s0)
 228:	f9042783          	lw	a5,-112(s0)
 22c:	eef42023          	sw	a5,-288(s0)
 230:	fc042c23          	sw	zero,-40(s0)
 234:	04c0006f          	j	280 <main+0xfc>
 238:	fd842703          	lw	a4,-40(s0)
 23c:	f2840793          	addi	a5,s0,-216
 240:	00271713          	slli	a4,a4,0x2
 244:	00f707b3          	add	a5,a4,a5
 248:	0007a683          	lw	a3,0(a5)
 24c:	fd842703          	lw	a4,-40(s0)
 250:	ed840793          	addi	a5,s0,-296
 254:	00271713          	slli	a4,a4,0x2
 258:	00f707b3          	add	a5,a4,a5
 25c:	0007a703          	lw	a4,0(a5)
 260:	00ff07b7          	lui	a5,0xff0
 264:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfef907>
 268:	00070593          	mv	a1,a4
 26c:	00068513          	mv	a0,a3
 270:	d9dff0ef          	jal	c <draw_cell>
 274:	fd842783          	lw	a5,-40(s0)
 278:	00178793          	addi	a5,a5,1
 27c:	fcf42c23          	sw	a5,-40(s0)
 280:	fd842703          	lw	a4,-40(s0)
 284:	fec42783          	lw	a5,-20(s0)
 288:	faf748e3          	blt	a4,a5,238 <main+0xb4>
 28c:	010007b7          	lui	a5,0x1000
 290:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfff807>
 294:	fe042583          	lw	a1,-32(s0)
 298:	fe442503          	lw	a0,-28(s0)
 29c:	d71ff0ef          	jal	c <draw_cell>
 2a0:	52c0006f          	j	7cc <main+0x648>
 2a4:	f9842783          	lw	a5,-104(s0)
 2a8:	0007a783          	lw	a5,0(a5)
 2ac:	f8f42623          	sw	a5,-116(s0)
 2b0:	f8c42783          	lw	a5,-116(s0)
 2b4:	0017f793          	andi	a5,a5,1
 2b8:	00078c63          	beqz	a5,2d0 <main+0x14c>
 2bc:	fe842703          	lw	a4,-24(s0)
 2c0:	00100793          	li	a5,1
 2c4:	06f70863          	beq	a4,a5,334 <main+0x1b0>
 2c8:	fe042423          	sw	zero,-24(s0)
 2cc:	0680006f          	j	334 <main+0x1b0>
 2d0:	f8c42783          	lw	a5,-116(s0)
 2d4:	0027f793          	andi	a5,a5,2
 2d8:	00078c63          	beqz	a5,2f0 <main+0x16c>
 2dc:	fe842783          	lw	a5,-24(s0)
 2e0:	04078a63          	beqz	a5,334 <main+0x1b0>
 2e4:	00100793          	li	a5,1
 2e8:	fef42423          	sw	a5,-24(s0)
 2ec:	0480006f          	j	334 <main+0x1b0>
 2f0:	f8c42783          	lw	a5,-116(s0)
 2f4:	0047f793          	andi	a5,a5,4
 2f8:	00078e63          	beqz	a5,314 <main+0x190>
 2fc:	fe842703          	lw	a4,-24(s0)
 300:	00300793          	li	a5,3
 304:	02f70863          	beq	a4,a5,334 <main+0x1b0>
 308:	00200793          	li	a5,2
 30c:	fef42423          	sw	a5,-24(s0)
 310:	0240006f          	j	334 <main+0x1b0>
 314:	f8c42783          	lw	a5,-116(s0)
 318:	0087f793          	andi	a5,a5,8
 31c:	00078c63          	beqz	a5,334 <main+0x1b0>
 320:	fe842703          	lw	a4,-24(s0)
 324:	00200793          	li	a5,2
 328:	00f70663          	beq	a4,a5,334 <main+0x1b0>
 32c:	00300793          	li	a5,3
 330:	fef42423          	sw	a5,-24(s0)
 334:	f2842783          	lw	a5,-216(s0)
 338:	f8f42423          	sw	a5,-120(s0)
 33c:	ed842783          	lw	a5,-296(s0)
 340:	f8f42223          	sw	a5,-124(s0)
 344:	f8842783          	lw	a5,-120(s0)
 348:	fcf42a23          	sw	a5,-44(s0)
 34c:	f8442783          	lw	a5,-124(s0)
 350:	fcf42823          	sw	a5,-48(s0)
 354:	fe842783          	lw	a5,-24(s0)
 358:	02079263          	bnez	a5,37c <main+0x1f8>
 35c:	f8842783          	lw	a5,-120(s0)
 360:	fff78793          	addi	a5,a5,-1
 364:	fcf42a23          	sw	a5,-44(s0)
 368:	fd442783          	lw	a5,-44(s0)
 36c:	0807d863          	bgez	a5,3fc <main+0x278>
 370:	00e00793          	li	a5,14
 374:	fcf42a23          	sw	a5,-44(s0)
 378:	0840006f          	j	3fc <main+0x278>
 37c:	fe842703          	lw	a4,-24(s0)
 380:	00100793          	li	a5,1
 384:	02f71263          	bne	a4,a5,3a8 <main+0x224>
 388:	f8842783          	lw	a5,-120(s0)
 38c:	00178793          	addi	a5,a5,1
 390:	fcf42a23          	sw	a5,-44(s0)
 394:	fd442703          	lw	a4,-44(s0)
 398:	00e00793          	li	a5,14
 39c:	06e7d063          	bge	a5,a4,3fc <main+0x278>
 3a0:	fc042a23          	sw	zero,-44(s0)
 3a4:	0580006f          	j	3fc <main+0x278>
 3a8:	fe842703          	lw	a4,-24(s0)
 3ac:	00200793          	li	a5,2
 3b0:	02f71263          	bne	a4,a5,3d4 <main+0x250>
 3b4:	f8442783          	lw	a5,-124(s0)
 3b8:	fff78793          	addi	a5,a5,-1
 3bc:	fcf42823          	sw	a5,-48(s0)
 3c0:	fd042783          	lw	a5,-48(s0)
 3c4:	0207dc63          	bgez	a5,3fc <main+0x278>
 3c8:	01300793          	li	a5,19
 3cc:	fcf42823          	sw	a5,-48(s0)
 3d0:	02c0006f          	j	3fc <main+0x278>
 3d4:	fe842703          	lw	a4,-24(s0)
 3d8:	00300793          	li	a5,3
 3dc:	02f71063          	bne	a4,a5,3fc <main+0x278>
 3e0:	f8442783          	lw	a5,-124(s0)
 3e4:	00178793          	addi	a5,a5,1
 3e8:	fcf42823          	sw	a5,-48(s0)
 3ec:	fd042703          	lw	a4,-48(s0)
 3f0:	01300793          	li	a5,19
 3f4:	00e7d463          	bge	a5,a4,3fc <main+0x278>
 3f8:	fc042823          	sw	zero,-48(s0)
 3fc:	fc042623          	sw	zero,-52(s0)
 400:	fc042423          	sw	zero,-56(s0)
 404:	0540006f          	j	458 <main+0x2d4>
 408:	fc842703          	lw	a4,-56(s0)
 40c:	f2840793          	addi	a5,s0,-216
 410:	00271713          	slli	a4,a4,0x2
 414:	00f707b3          	add	a5,a4,a5
 418:	0007a783          	lw	a5,0(a5)
 41c:	fd442703          	lw	a4,-44(s0)
 420:	02f71663          	bne	a4,a5,44c <main+0x2c8>
 424:	fc842703          	lw	a4,-56(s0)
 428:	ed840793          	addi	a5,s0,-296
 42c:	00271713          	slli	a4,a4,0x2
 430:	00f707b3          	add	a5,a4,a5
 434:	0007a783          	lw	a5,0(a5)
 438:	fd042703          	lw	a4,-48(s0)
 43c:	00f71863          	bne	a4,a5,44c <main+0x2c8>
 440:	00100793          	li	a5,1
 444:	fcf42623          	sw	a5,-52(s0)
 448:	01c0006f          	j	464 <main+0x2e0>
 44c:	fc842783          	lw	a5,-56(s0)
 450:	00178793          	addi	a5,a5,1
 454:	fcf42423          	sw	a5,-56(s0)
 458:	fc842703          	lw	a4,-56(s0)
 45c:	fec42783          	lw	a5,-20(s0)
 460:	faf744e3          	blt	a4,a5,408 <main+0x284>
 464:	fcc42783          	lw	a5,-52(s0)
 468:	00078863          	beqz	a5,478 <main+0x2f4>
 46c:	fa042783          	lw	a5,-96(s0)
 470:	00100713          	li	a4,1
 474:	00e7a023          	sw	a4,0(a5)
 478:	fa042783          	lw	a5,-96(s0)
 47c:	0007a783          	lw	a5,0(a5)
 480:	34079e63          	bnez	a5,7dc <main+0x658>
 484:	fc042223          	sw	zero,-60(s0)
 488:	fdc42783          	lw	a5,-36(s0)
 48c:	02078463          	beqz	a5,4b4 <main+0x330>
 490:	fd442703          	lw	a4,-44(s0)
 494:	fe442783          	lw	a5,-28(s0)
 498:	00f71e63          	bne	a4,a5,4b4 <main+0x330>
 49c:	fd042703          	lw	a4,-48(s0)
 4a0:	fe042783          	lw	a5,-32(s0)
 4a4:	00f71863          	bne	a4,a5,4b4 <main+0x330>
 4a8:	00100793          	li	a5,1
 4ac:	fcf42223          	sw	a5,-60(s0)
 4b0:	fc042e23          	sw	zero,-36(s0)
 4b4:	fc442783          	lw	a5,-60(s0)
 4b8:	04079863          	bnez	a5,508 <main+0x384>
 4bc:	fec42783          	lw	a5,-20(s0)
 4c0:	fff78713          	addi	a4,a5,-1
 4c4:	f2840793          	addi	a5,s0,-216
 4c8:	00271713          	slli	a4,a4,0x2
 4cc:	00f707b3          	add	a5,a4,a5
 4d0:	0007a783          	lw	a5,0(a5)
 4d4:	f8f42023          	sw	a5,-128(s0)
 4d8:	fec42783          	lw	a5,-20(s0)
 4dc:	fff78713          	addi	a4,a5,-1
 4e0:	ed840793          	addi	a5,s0,-296
 4e4:	00271713          	slli	a4,a4,0x2
 4e8:	00f707b3          	add	a5,a4,a5
 4ec:	0007a783          	lw	a5,0(a5)
 4f0:	f6f42e23          	sw	a5,-132(s0)
 4f4:	333337b7          	lui	a5,0x33333
 4f8:	33378613          	addi	a2,a5,819 # 33333333 <_end+0x33332b3b>
 4fc:	f7c42583          	lw	a1,-132(s0)
 500:	f8042503          	lw	a0,-128(s0)
 504:	b09ff0ef          	jal	c <draw_cell>
 508:	fc442783          	lw	a5,-60(s0)
 50c:	08079a63          	bnez	a5,5a0 <main+0x41c>
 510:	fec42783          	lw	a5,-20(s0)
 514:	fff78793          	addi	a5,a5,-1
 518:	fcf42023          	sw	a5,-64(s0)
 51c:	0680006f          	j	584 <main+0x400>
 520:	fc042783          	lw	a5,-64(s0)
 524:	fff78713          	addi	a4,a5,-1
 528:	f2840793          	addi	a5,s0,-216
 52c:	00271713          	slli	a4,a4,0x2
 530:	00f707b3          	add	a5,a4,a5
 534:	0007a703          	lw	a4,0(a5)
 538:	fc042683          	lw	a3,-64(s0)
 53c:	f2840793          	addi	a5,s0,-216
 540:	00269693          	slli	a3,a3,0x2
 544:	00f687b3          	add	a5,a3,a5
 548:	00e7a023          	sw	a4,0(a5)
 54c:	fc042783          	lw	a5,-64(s0)
 550:	fff78713          	addi	a4,a5,-1
 554:	ed840793          	addi	a5,s0,-296
 558:	00271713          	slli	a4,a4,0x2
 55c:	00f707b3          	add	a5,a4,a5
 560:	0007a703          	lw	a4,0(a5)
 564:	fc042683          	lw	a3,-64(s0)
 568:	ed840793          	addi	a5,s0,-296
 56c:	00269693          	slli	a3,a3,0x2
 570:	00f687b3          	add	a5,a3,a5
 574:	00e7a023          	sw	a4,0(a5)
 578:	fc042783          	lw	a5,-64(s0)
 57c:	fff78793          	addi	a5,a5,-1
 580:	fcf42023          	sw	a5,-64(s0)
 584:	fc042783          	lw	a5,-64(s0)
 588:	f8f04ce3          	bgtz	a5,520 <main+0x39c>
 58c:	fd442783          	lw	a5,-44(s0)
 590:	f2f42423          	sw	a5,-216(s0)
 594:	fd042783          	lw	a5,-48(s0)
 598:	ecf42c23          	sw	a5,-296(s0)
 59c:	0a40006f          	j	640 <main+0x4bc>
 5a0:	fec42783          	lw	a5,-20(s0)
 5a4:	faf42e23          	sw	a5,-68(s0)
 5a8:	0680006f          	j	610 <main+0x48c>
 5ac:	fbc42783          	lw	a5,-68(s0)
 5b0:	fff78713          	addi	a4,a5,-1
 5b4:	f2840793          	addi	a5,s0,-216
 5b8:	00271713          	slli	a4,a4,0x2
 5bc:	00f707b3          	add	a5,a4,a5
 5c0:	0007a703          	lw	a4,0(a5)
 5c4:	fbc42683          	lw	a3,-68(s0)
 5c8:	f2840793          	addi	a5,s0,-216
 5cc:	00269693          	slli	a3,a3,0x2
 5d0:	00f687b3          	add	a5,a3,a5
 5d4:	00e7a023          	sw	a4,0(a5)
 5d8:	fbc42783          	lw	a5,-68(s0)
 5dc:	fff78713          	addi	a4,a5,-1
 5e0:	ed840793          	addi	a5,s0,-296
 5e4:	00271713          	slli	a4,a4,0x2
 5e8:	00f707b3          	add	a5,a4,a5
 5ec:	0007a703          	lw	a4,0(a5)
 5f0:	fbc42683          	lw	a3,-68(s0)
 5f4:	ed840793          	addi	a5,s0,-296
 5f8:	00269693          	slli	a3,a3,0x2
 5fc:	00f687b3          	add	a5,a3,a5
 600:	00e7a023          	sw	a4,0(a5)
 604:	fbc42783          	lw	a5,-68(s0)
 608:	fff78793          	addi	a5,a5,-1
 60c:	faf42e23          	sw	a5,-68(s0)
 610:	fbc42783          	lw	a5,-68(s0)
 614:	f8f04ce3          	bgtz	a5,5ac <main+0x428>
 618:	fd442783          	lw	a5,-44(s0)
 61c:	f2f42423          	sw	a5,-216(s0)
 620:	fd042783          	lw	a5,-48(s0)
 624:	ecf42c23          	sw	a5,-296(s0)
 628:	fec42703          	lw	a4,-20(s0)
 62c:	01300793          	li	a5,19
 630:	00e7c863          	blt	a5,a4,640 <main+0x4bc>
 634:	fec42783          	lw	a5,-20(s0)
 638:	00178793          	addi	a5,a5,1
 63c:	fef42623          	sw	a5,-20(s0)
 640:	00ff07b7          	lui	a5,0xff0
 644:	0ff78613          	addi	a2,a5,255 # ff00ff <_end+0xfef907>
 648:	fd042583          	lw	a1,-48(s0)
 64c:	fd442503          	lw	a0,-44(s0)
 650:	9bdff0ef          	jal	c <draw_cell>
 654:	fdc42783          	lw	a5,-36(s0)
 658:	14079e63          	bnez	a5,7b4 <main+0x630>
 65c:	f9c42783          	lw	a5,-100(s0)
 660:	0007a783          	lw	a5,0(a5)
 664:	f6f42c23          	sw	a5,-136(s0)
 668:	f7842783          	lw	a5,-136(s0)
 66c:	00f7f793          	andi	a5,a5,15
 670:	faf42c23          	sw	a5,-72(s0)
 674:	f7842783          	lw	a5,-136(s0)
 678:	0087d793          	srli	a5,a5,0x8
 67c:	01f7f793          	andi	a5,a5,31
 680:	faf42a23          	sw	a5,-76(s0)
 684:	fb842703          	lw	a4,-72(s0)
 688:	00e00793          	li	a5,14
 68c:	00e7d863          	bge	a5,a4,69c <main+0x518>
 690:	fb842783          	lw	a5,-72(s0)
 694:	ff178793          	addi	a5,a5,-15
 698:	faf42c23          	sw	a5,-72(s0)
 69c:	fb442703          	lw	a4,-76(s0)
 6a0:	01300793          	li	a5,19
 6a4:	02e7d463          	bge	a5,a4,6cc <main+0x548>
 6a8:	fb442783          	lw	a5,-76(s0)
 6ac:	ff478793          	addi	a5,a5,-12
 6b0:	faf42a23          	sw	a5,-76(s0)
 6b4:	fb442703          	lw	a4,-76(s0)
 6b8:	01300793          	li	a5,19
 6bc:	00e7d863          	bge	a5,a4,6cc <main+0x548>
 6c0:	fb442783          	lw	a5,-76(s0)
 6c4:	ff478793          	addi	a5,a5,-12
 6c8:	faf42a23          	sw	a5,-76(s0)
 6cc:	00100793          	li	a5,1
 6d0:	faf42823          	sw	a5,-80(s0)
 6d4:	fa042623          	sw	zero,-84(s0)
 6d8:	09c0006f          	j	774 <main+0x5f0>
 6dc:	fa042823          	sw	zero,-80(s0)
 6e0:	fa042423          	sw	zero,-88(s0)
 6e4:	0540006f          	j	738 <main+0x5b4>
 6e8:	fa842703          	lw	a4,-88(s0)
 6ec:	f2840793          	addi	a5,s0,-216
 6f0:	00271713          	slli	a4,a4,0x2
 6f4:	00f707b3          	add	a5,a4,a5
 6f8:	0007a783          	lw	a5,0(a5)
 6fc:	fb842703          	lw	a4,-72(s0)
 700:	02f71663          	bne	a4,a5,72c <main+0x5a8>
 704:	fa842703          	lw	a4,-88(s0)
 708:	ed840793          	addi	a5,s0,-296
 70c:	00271713          	slli	a4,a4,0x2
 710:	00f707b3          	add	a5,a4,a5
 714:	0007a783          	lw	a5,0(a5)
 718:	fb442703          	lw	a4,-76(s0)
 71c:	00f71863          	bne	a4,a5,72c <main+0x5a8>
 720:	00100793          	li	a5,1
 724:	faf42823          	sw	a5,-80(s0)
 728:	01c0006f          	j	744 <main+0x5c0>
 72c:	fa842783          	lw	a5,-88(s0)
 730:	00178793          	addi	a5,a5,1
 734:	faf42423          	sw	a5,-88(s0)
 738:	fa842703          	lw	a4,-88(s0)
 73c:	fec42783          	lw	a5,-20(s0)
 740:	faf744e3          	blt	a4,a5,6e8 <main+0x564>
 744:	fb042783          	lw	a5,-80(s0)
 748:	02078663          	beqz	a5,774 <main+0x5f0>
 74c:	fb442783          	lw	a5,-76(s0)
 750:	00178793          	addi	a5,a5,1
 754:	faf42a23          	sw	a5,-76(s0)
 758:	fb442703          	lw	a4,-76(s0)
 75c:	01300793          	li	a5,19
 760:	00e7d463          	bge	a5,a4,768 <main+0x5e4>
 764:	fa042a23          	sw	zero,-76(s0)
 768:	fac42783          	lw	a5,-84(s0)
 76c:	00178793          	addi	a5,a5,1
 770:	faf42623          	sw	a5,-84(s0)
 774:	fb042783          	lw	a5,-80(s0)
 778:	00078863          	beqz	a5,788 <main+0x604>
 77c:	fac42703          	lw	a4,-84(s0)
 780:	03100793          	li	a5,49
 784:	f4e7dce3          	bge	a5,a4,6dc <main+0x558>
 788:	fb842783          	lw	a5,-72(s0)
 78c:	fef42223          	sw	a5,-28(s0)
 790:	fb442783          	lw	a5,-76(s0)
 794:	fef42023          	sw	a5,-32(s0)
 798:	00100793          	li	a5,1
 79c:	fcf42e23          	sw	a5,-36(s0)
 7a0:	010007b7          	lui	a5,0x1000
 7a4:	fff78613          	addi	a2,a5,-1 # ffffff <_end+0xfff807>
 7a8:	fe042583          	lw	a1,-32(s0)
 7ac:	fe442503          	lw	a0,-28(s0)
 7b0:	85dff0ef          	jal	c <draw_cell>
 7b4:	00000013          	nop
 7b8:	fa442783          	lw	a5,-92(s0)
 7bc:	0007a783          	lw	a5,0(a5)
 7c0:	fe078ce3          	beqz	a5,7b8 <main+0x634>
 7c4:	fa442783          	lw	a5,-92(s0)
 7c8:	0007a023          	sw	zero,0(a5)
 7cc:	fa042783          	lw	a5,-96(s0)
 7d0:	0007a783          	lw	a5,0(a5)
 7d4:	ac0788e3          	beqz	a5,2a4 <main+0x120>
 7d8:	0080006f          	j	7e0 <main+0x65c>
 7dc:	00000013          	nop
 7e0:	00000793          	li	a5,0
 7e4:	00078513          	mv	a0,a5
 7e8:	12c12083          	lw	ra,300(sp)
 7ec:	12812403          	lw	s0,296(sp)
 7f0:	13010113          	addi	sp,sp,304
 7f4:	00008067          	ret

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
