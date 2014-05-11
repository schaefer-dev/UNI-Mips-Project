	.text
	.globl apply
apply:
	addiu	$sp $sp -20
	sw	$s0 0($sp) 
	sw	$s1 4($sp)
	sw	$s2 8($sp)
	sw	$s3 12($sp)
	sw	$ra 16($sp)
	
	move $s0 $a0 
	move $s1 $a1
	beq $a0 $zero finish	# wenn erstes element nicht vorhanden, fertig?

	
loop:	
	
	lw $s2 0($s0)		# s2 = Adresse aufs Nachfolgeelement
	lw $a0 4($s0)		# a0 = Inahlt des ersten Elements
	
	##
	#sw	$s0 0($sp) 
	#sw	$s1 4($sp)
	#sw	$s2 8($sp)
	#sw	$s3 12($sp)
	#sw	$ra 16($sp)
	##
	
	jalr $s1	
	
	##
	#lw	$s0 0($sp)
	#lw	$s1 4($sp)
	#lw	$s2 8($sp)
	#lw	$s3 12($sp)
	#lw	$ra 16($sp)
	##
	
	beq $s2 $zero finish	#Leere erste Adresse abfangen
	move $s0 $s2	

	b loop	



finish:
	lw	$s0 0($sp)
	lw	$s1 4($sp)
	lw	$s2 8($sp)
	lw	$s3 12($sp)
	lw	$ra 16($sp)
	addiu	$sp $sp 20
	jr $ra