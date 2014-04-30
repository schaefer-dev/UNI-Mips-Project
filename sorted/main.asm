	.include "sorted.asm"
	.include "tests/arr4unsorted.asm"
	.include "util.asm"

	.text
	.globl main
main:
	jal	do_test
	li	$v0 10
	syscall
