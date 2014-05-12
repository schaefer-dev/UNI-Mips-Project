	.data
	.globl data
data:
	.word -50, -19, 23, -1, 36, 42, 49, 55, 100,
	.globl data_end
data_end:

	.text
	.globl do_test
do_test:
	addiu	$sp $sp -4
	sw	$ra 0($sp)

	la	$a0 data
	la	$a1 data_end
	jal	is_sorted

	la	$a0 data
	move	$a1 $v0
	jal	print_result

	lw	$ra 0($sp)
	addiu	$sp $sp 4
	jr	$ra
