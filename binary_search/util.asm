	.data
msg_not_found:
	.asciiz "not found"
msg_found:
	.asciiz "found at index "

	.text
	.globl print_result
print_result:
	beq	$a1 $0 res_not_found
	subu	$t0 $a1 $a0
	srl	$t0 $t0 2
	la	$a0 msg_found
	li	$v0 4
	syscall
	move	$a0 $t0
	li	$v0 1
	syscall
	jr	$ra
res_not_found:
	la	$a0 msg_not_found
	li	$v0 4
	syscall
	jr	$ra
