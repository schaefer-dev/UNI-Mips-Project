	.include "apply.asm"
	.include "tests/print_string_list.asm"
	.include "util.asm"

	.text
	.globl main
main:
	jal	do_test
	li	$v0 10
	syscall
