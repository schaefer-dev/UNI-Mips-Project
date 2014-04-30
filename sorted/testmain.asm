	.text
	.globl main
main:
	jal	do_test
	li	$v0 10
	syscall
