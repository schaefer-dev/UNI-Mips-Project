	.text
	.globl print_list_int
print_list_int:
	move	$t0 $a0
	b	print_list_int_start
print_list_int_loop:
	lw	$a0 4($t0)
	li	$v0 1
	syscall
	li	$a0 '\n'
	li	$v0 11
	syscall
	lw	$t0 0($t0)
print_list_int_start:
	bne	$t0 $0 print_list_int_loop
	jr	$ra
