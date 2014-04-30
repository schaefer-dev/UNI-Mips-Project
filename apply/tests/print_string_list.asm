	.data
head:
	.word l1
	.asciiz "Hallo"
l1:
	.word l2
	.asciiz "Welt"
l2:
	.word 0
	.asciiz "!"

	.text
	.globl do_test
do_test:
	addiu	$sp $sp -4
	sw	$ra 0($sp)

	la	$a0 head
	la	$a1 print_string
	jal	apply

	lw	$ra 0($sp)
	addiu	$sp $sp 4
	jr	$ra
