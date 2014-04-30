	.include "binary_search.asm"
	.include "tests/arr4found.asm"
	.include "util.asm"

	.text
	.globl main
main:
	jal	do_test
	li	$v0 10
	syscall
