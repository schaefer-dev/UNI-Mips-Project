	.data
msg_sorted:
	.asciiz "sorted"
msg_not_sorted:
	.asciiz "not sorted at index "

	.text
	.globl print_result
print_result:
	beq	$a1 $0 res_sorted
	subu	$t0 $a1 $a0
	srl	$t0 $t0 2
	la	$a0 msg_not_sorted
	li	$v0 4
	syscall
	move	$a0 $t0
	li	$v0 1
	syscall
	jr	$ra
res_sorted:
	la	$a0 msg_sorted
	li	$v0 4
	syscall
	jr	$ra
