	.set	noreorder

# savedata utility is opened here (used to load H.BIN) but isn't closed, use p5_close_savedata from VHBL source in your code if you wanna close it.

do_exploit:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)
	bal	FindFunctions
	nop

	bal	$gameName
	nop
	move	$a0, $ra

	bal	$saveName
	nop
	move	$a1, $ra

	bal	$fileName
	nop
	move	$a2, $ra

	bal	$LoadAddress
	nop
	lw	$a3, 0($ra)

	lw	$ra, 4($sp)
	bal	p5_load_decrypted
	addiu	$sp, $sp, 8

	bal	$LoadAddress
	nop
	lw	$a0, 0($ra)
	jr	$a0
	nop

FindFunctions:
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	sw	$s1, 8($sp)
	sw	$s0, 4($sp)

	bal	$ThreadManForUser
	nop
	move	$a0, $ra
	lui	$a1, 0xCEAD
	ori	$a1, $a1, 0xEB47
	bal	FindImport		# sceKernelDelayThread
	move	$a2, $0

	bal	$sceUtility
	nop
	move	$s1, $ra
	move	$a0, $s1
	lui	$a1, 0x50C4
	ori	$a1, $a1, 0xCD57

	bal	$funcs
	nop
	move	$s0, $ra
	move	$a2, $0
	bal	FindImport		# sceUtilitySavedataInitStart
	sw	$v0, 0($s0)

	move	$a0, $s1
	lui	$a1, 0x8874
	ori	$a1, $a1, 0xDBE0
	move	$a2, $0
	bal	FindImport		# sceUtilitySavedataGetStatus
	sw	$v0, 4($s0)

	move	$a0, $s1
	lui	$a1, 0xD4B9
	ori	$a1, $a1, 0x5FFB
	move	$a2, $0
	bal	FindImport		# sceUtilitySavedataUpdate
	sw	$v0, 8($s0)

	move	$a0, $s1
	lui	$a1, 0x9790
	ori	$a1, $a1, 0xB33C
	move	$a2, $0
	bal	FindImport		# sceUtilitySavedataShutdownStart
	sw	$v0, 12($s0)

	lw	$ra, 12($sp)
	sw	$v0, 16($s0)
	lw	$s1, 8($sp)
	lw	$s0, 4($sp)
	jr	$ra
	addiu	$sp, $sp, 16

FindImport:
	lui	$v1, 0x0880
	lui	$t4, 0x0A00
	lui	$v0, 0x0840
	move	$t1, $v1
	movn	$t1, $v0, $a2
	move	$t2, $a0
	movn	$t4, $v1, $a2
	lui	$t9, 0xF780
	lui	$t8, 0x0180
	lui	$t7, 0xF7C0
	lui	$t6, 0x0040
	lw	$t0, 0($t1)
$L184:
	beql	$t0, $t2, $L183
	addiu	$t1, $t1, 4

	beq	$a2, $0, $L157
	addu	$v0, $t0, $t9

	addu	$v0, $t0, $t7
	sltu	$v0, $v0, $t6
$L158:
	beql	$v0, $0, $L183
	addiu	$t1, $t1, 4

	beq	$a2, $0, $L159
	lw	$t3, 12($t1)

	addu	$v0, $t3, $t7
	sltu	$v0, $v0, $t6
$L160:
	beql	$v0, $0, $L183
	addiu	$t1, $t1, 4

	beq	$a2, $0, $L161
	lw	$t5, 16($t1)

	addu	$v0, $t5, $t7
	sltu	$v0, $v0, $t6
$L162:
	beql	$v0, $0, $L183
	addiu	$t1, $t1, 4

	lbu	$v0, 0($t2)
	lbu	$v1, 0($t0)
	bnel	$v1, $v0, $L183
	addiu	$t1, $t1, 4

	bne	$v1, $0, $L179
	move	$a3, $0

	lhu	$a3, 10($t1)
$L182:
	beql	$a3, $0, $L183
	addiu	$t1, $t1, 4

	lw	$v0, 0($t3)
	beq	$v0, $a1, $L180
	move	$a0, $t3

	b	$L169
	move	$v1, $0

$L171:
	beq	$v0, $a1, $L181
	addiu	$a0, $a0, 4

$L169:
	addiu	$v1, $v1, 1
	slt	$v0, $v1, $a3
	bnel	$v0, $0, $L171
	lw	$v0, 4($a0)

$L156:
	addiu	$t1, $t1, 4
$L183:
	sltu	$v0, $t1, $t4
	bnel	$v0, $0, $L184
	lw	$t0, 0($t1)

	jr	$ra
	move	$v0, $0

$L157:
	b	$L158
	sltu	$v0, $v0, $t8

$L159:
	addu	$v0, $t3, $t9
	b	$L160
	sltu	$v0, $v0, $t8

$L161:
	addu	$v0, $t5, $t9
	b	$L162
	sltu	$v0, $v0, $t8

$L179:
	addu	$v0, $t2, $a3
$L185:
	addu	$v1, $t0, $a3
	lbu	$v1, 1($v1)
	lbu	$a0, 1($v0)
	bne	$v1, $a0, $L156
	addiu	$a3, $a3, 1

	bne	$v1, $0, $L185
	addu	$v0, $t2, $a3

	b	$L182
	lhu	$a3, 10($t1)

$L181:
	sll	$v0, $v1, 3
$L167:
	jr	$ra
	addu	$v0, $t5, $v0

$L180:
	b	$L167
	move	$v0, $0

p5_load_decrypted:
	addiu	$sp, $sp, -1568
	sw	$ra, 1564($sp)
	sw	$s5, 1560($sp)
	sw	$s4, 1556($sp)
	sw	$s3, 1552($sp)
	sw	$s2, 1548($sp)
	sw	$s1, 1544($sp)
	sw	$s0, 1540($sp)
	move	$t1, $a0
	move	$t2, $a1
	move	$v0, $sp
	addiu	$v1, $sp, 1536
	sb	$0, 0($v0)
$L233:
	addiu	$v0, $v0, 1
	bnel	$v0, $v1, $L233
	sb	$0, 0($v0)

	lb	$t0, 0($t1)
	li	$v0, 1536			# 0x600
	sw	$v0, 0($sp)
	li	$v0, 17			# 0x11
	li	$a0, 1			# 0x1
	li	$a1, 16			# 0x10
	li	$v1, 19			# 0x13
	sw	$v0, 12($sp)
	li	$v0, 18			# 0x12
	sw	$v1, 16($sp)
	sw	$a0, 8($sp)
	sw	$v0, 20($sp)
	sw	$a1, 48($sp)
	sw	$a0, 4($sp)
	sw	$a1, 24($sp)
	beq	$t0, $0, $L206
	addiu	$v1, $sp, 60

$L223:
	sb	$t0, 0($v1)
	addiu	$t1, $t1, 1
	lb	$t0, 0($t1)
	bne	$t0, $0, $L223
	addiu	$v1, $v1, 1

$L206:
	lb	$v0, 0($t2)
	sb	$0, 0($v1)
	beq	$v0, $0, $L208
	addiu	$v1, $sp, 76

$L222:
	sb	$v0, 0($v1)
	addiu	$t2, $t2, 1
	lb	$v0, 0($t2)
	bne	$v0, $0, $L222
	addiu	$v1, $v1, 1

$L208:
	lb	$v0, 0($a2)
	addiu	$a1, $sp, 100
	beq	$v0, $0, $L210
	sb	$0, 0($v1)

$L221:
	sb	$v0, 0($a1)
	addiu	$a2, $a2, 1
	lb	$v0, 0($a2)
	bne	$v0, $0, $L221
	addiu	$a1, $a1, 1

$L210:
	bal	$funcs
	nop
	move	$s2, $ra
	move	$s1, $s2
	lw	$v1, 4($s1)
	lui	$v0, 0x0010
	li	$a0, 3			# 0x3
	sb	$0, 0($a1)
	sw	$a0, 1480($sp)
	sw	$a0, 1408($sp)
	sw	$a3, 116($sp)
	sw	$v0, 124($sp)
	sw	$v0, 120($sp)
	jalr	$v1			# sceUtilitySavedataInitStart
	move	$a0, $sp

	b	$L212
	move	$s0, $s2

$L213:
	lw	$v1, 0($s0)
	jalr	$v1			# sceKernelDelayThread
	nop

$L212:
	lw	$v1, 8($s1)
	jalr	$v1			# sceUtilitySavedataGetStatus
	nop

	slt	$v0, $v0, 2
	bne	$v0, $0, $L213
	li	$a0, 100		# 0x64

	move	$s5, $s1
	move	$s4, $s1
	li	$s0, 2			# 0x2
	li	$s3, 3			# 0x3
	lw	$v1, 8($s1)
$L231:
	jalr	$v1			# sceUtilitySavedataGetStatus
	nop

	beql	$v0, $s0, $L216
	lw	$v1, 12($s4)

	beql	$v0, $s3, $L217
	lw	$v1, 16($s4)

	bne	$v0, $0, $L230
	lw	$v1, 0($s5)

	lw	$v1, 0($s5)
	jalr	$v1			# sceKernelDelayThread
	li	$a0, 100		# 0x64

	lw	$ra, 1564($sp)
	lw	$s5, 1560($sp)
	lw	$s4, 1556($sp)
	lw	$s3, 1552($sp)
	lw	$s2, 1548($sp)
	lw	$s1, 1544($sp)
	lw	$s0, 1540($sp)
	jr	$ra
	addiu	$sp, $sp, 1568

$L216:
	jalr	$v1			# sceUtilitySavedataUpdate
	li	$a0, 1			# 0x1

	lw	$v1, 0($s2)
$L232:
	jalr	$v1			# sceKernelDelayThread
	li	$a0, 100		# 0x64

	b	$L231
	lw	$v1, 8($s1)

$L217:
	jalr	$v1			# sceUtilitySavedataGetStatus
	nop

	b	$L232
	lw	$v1, 0($s2)

$L230:
	jalr	$v1			# sceKernelDelayThread
	li	$a0, 100		# 0x64

	b	$L231
	lw	$v1, 8($s1)

$funcs:
	.word	0x03E0F809		# jalr	$ra
	nop
					# reserved for function offsets
	nop				# sceKernelDelayThread
	nop				# sceUtilitySavedataInitStart
	nop				# sceUtilitySavedataGetStatus
	nop				# sceUtilitySavedataUpdate
	nop				# sceUtilitySavedataShutdownStart

$ThreadManForUser:
	.word	0x03E0F809	# jalr	$ra
	nop
	.asciz	"ThreadManForUser\0\0\0"

$sceUtility:
	.word	0x03E0F809	# jalr	$ra
	nop
	.asciz	"sceUtility\0"

$fileName:
	.word	0x03E0F809	# jalr	$ra
	nop
	.asciz	"H.BIN\0\0"

$LoadAddress:
	.word	0x03E0F809	# jalr	$ra
	nop
	.word	0x09800000

$gameName:
	.word	0x03E0F809	# jalr	$ra
	nop
	.asciz	"ULUS10126\0\0"

$saveName:
	.word	0x03E0F809	# jalr	$ra
	nop
	.asciz	"DATA01\0"	# name for after the game id, e.g., NPUZ00097SLOT00
