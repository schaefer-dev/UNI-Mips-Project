	.data
	.globl data
	.globl data_end
data:
	.word -10, 19, 23, 36, 42
data_end:

	.text
	.globl do_test
do_test:
	addiu	$sp $sp -4
	sw	$ra 0($sp)

	la	$a0 data
	la	$a1 data_end
	li	$a2 -10
	jal	binary_search

	la	$a0 data
	move	$a1 $v0
	jal	print_result

	lw	$ra 0($sp)
	addiu	$sp $sp 4
	jr	$ra
