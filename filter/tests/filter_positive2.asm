	.data
head:
	.word l1
	.word 42
l1:
	.word l2
	.word 12
	
l2:
	.word l3
	.word 0
	
l3:
	.word 0
	.word 23

	.text
pred_positive:
	lw	$t0 0($a0)
	slt	$v0 $t0 $0
	xori	$v0 $v0 1
	jr	$ra

	.globl do_test
do_test:
	addiu	$sp $sp -4
	sw	$ra 0($sp)

	la	$a0 head
	la	$a1 pred_positive
	jal	filter_list
	move	$a0 $v0
	jal	print_list_int

	lw	$ra 0($sp)
	addiu	$sp $sp 4
	jr	$ra
