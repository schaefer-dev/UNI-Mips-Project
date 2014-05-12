	.text
	.globl filter_list
filter_list:
	addiu	$sp $sp -32
	sw	$s0 0($sp) 
	sw	$s1 4($sp)
	sw	$s2 8($sp)
	sw	$s3 12($sp)
	sw	$s4 16($sp)
	sw	$s5 20($sp)
	sw 	$s6 24($sp)
	sw	$ra 28($sp)

move $s4 $a0	# s4 = Adresse des Listenbeginns
move $s5 $a1	# s5 = Adresse des Unterprogramms
	
	
	
start: 
	beq $s4 $zero finish #Jump finish
	move $s6 $s4
	move $s0 $s4		# s0 = Adresse des ersten Elements
	addiu $s1 $s0 4		# s1 = Adresse des ersten Inhalts
	
	lw $s2 0($s0)		# s2 = Adresse des zweiten Elements
	beq $s2 $zero onlyOne #Jump onlyOne
	addiu $s3 $s2 4		# s3 = Adresse des zweiten Inhalts
	
	move $a0 $s1
	jalr $s5
	beq $v0 $zero deletefirst #Jump deletefirst
	
	move $a0 $s3
	jalr $s5
	beq $v0 $zero deleteElement #Jump deleteElement
	
	b next #Jump next
	
	
	
deletefirst:
	move $s4 $s2			# s4 ein Element weitersetzen und wieder erstes gültiges Element suchen
	b start #Jump start
	
	
onlyOne:
	move $a0 $s1
	jalr $s5
	beq $v0 $zero nothing #Jump nothing
	move $s6 $s0
	b finish #Jump finish
	
	
nothing:
	li $s6 0
	b finish #Jump finish
	
	
next:	
	
	# immer zweites!!! Element überprüfen ob enthalten
	
	move $t0 $s0
	move $t1 $s1
	move $s0 $s2
	move $s1 $s3
	lw $s2 0($s0)
	beq $s2 $zero finish #Jump finish	# Abbruch wenn 2. Element leer
	lw $s3 0($s0)
	addiu $s3 $s3 4			# Adressen alle angepasst -> eins weiter
	
	move $a0 $s3			# Überprüfung 2. Element
	jalr $s5
	beq $v0 $zero deleteElement #Jump deleteElement
	
	b next #Jump next
	
	

deleteElement: #delete Element in s2
	lw $t0 0($s2)
	sw $t0 0($s0)

		# s0 = Adresse des ersten Elements
		# s1 = Adresse des ersten Inhalts
	
	lw $s2 0($s0)		# s2 = Adresse des zweiten Elements
	beq $s2 $zero finish #Jump finish						
	addiu $s3 $s2 4		# s3 = Adresse des zweiten Inhalts
	
	move $a0 $s3
	jalr $s5
	beq $v0 $zero deleteElement #Jump deleteElement
	
	b next	#Jump next
	
	


finish:
	move $v0 $s6
	lw	$s0 0($sp) 
	lw	$s1 4($sp)
	lw	$s2 8($sp)
	lw	$s3 12($sp)
	lw	$s4 16($sp)
	lw	$s5 20($sp)
	lw 	$s6 24($sp)
	lw	$ra 28($sp)
	addiu	$sp $sp 32
	jr $ra