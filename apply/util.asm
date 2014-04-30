	.globl print_string
print_string:
	li	$v0 4
	syscall
	li	$v0 11
	li	$a0 '\n'
	syscall
	jr	$ra
