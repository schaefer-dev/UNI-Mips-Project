	.include "binary_search.asm"
	.include "tests/filter_positive.asm"
	.include "util.asm"

	.text
	.globl main
main:
	jal	do_test
	li	$v0 10
	syscall
