	.text
	.globl filter_list
filter_list:
	addiu	$sp $sp -28
	sw	$s0 0($sp) 
	sw	$s1 4($sp)
	sw	$s2 8($sp)
	sw	$s3 12($sp)
	sw	$s4 16($sp)
	sw	$s5 20($sp)
	sw	$ra 24($sp)

move $s4 $a0	# s4 = Adresse des Listenbeginns
move $s5 $a1	# s5 = Adresse des Unterprogramms
	
	
	
start:
	beq $s4 $zero finish
	move $v0 $s4
	move $s0 $s4		# s0 = Adresse des ersten Elements
	addiu $s1 $s0 4		# s1 = Adresse des ersten Inhalts
	
	lw $s2 0($s0)		# s2 = Adresse des zweiten Elements
	beq $s2 $zero onlyOne										# To Implement: nur ein Element
	addiu $s3 $s2 4		# s3 = Adresse des zweiten Inhalts
	
	move $a0 $s1
	jalr $s5
	beq $v0 $zero deletefirst
	
	move $a0 $s3
	jalr $s5
	beq $v0 $zero deleteElement
	
	b next
	
	
	
deletefirst:
	move $s4 $s2			# s4 ein Element weitersetzen und wieder erstes gültiges Element suchen
	b start
	
	
onlyOne:
	move $a0 $s1
	jalr $s5
	beq $v0 $zero nothing
	move $v0 $s0
	b finish
	
	
nothing:
	move $v0 $zero
	b finish
	
	
next:	
	
	# zuerst Alle Zeiger eins Erhöhen mit Abfangen für letztes
	# immer zweites!!! Element überprüfen ob enthalten
	
	move $t0 $s0
	move $t1 $s1
	move $s0 $s2
	move $s1 $s3
	lw $s2 0($s0)
	beq $s2 $zero finish	# Abbruch wenn 2. Element leer
	lw $s3 0($s0)
	addiu $s3 $s3 4		# Adressen alle angepasst -> eins weiter
	
	move $a0 $s3
	jalr $s5
	beq $v0 $zero deleteElement
	
	b next
	
	

deleteElement: #delete Element in s2
	lw $t0 0($s2)
	sw $t0 0($s0)

		# s0 = Adresse des ersten Elements
		# s1 = Adresse des ersten Inhalts
	
	lw $s2 0($s0)		# s2 = Adresse des zweiten Elements
	beq $s2 $zero finish						
	addiu $s3 $s2 4		# s3 = Adresse des zweiten Inhalts
	
	move $a0 $s3
	jalr $s5
	beq $v0 $zero deleteElement
	
	b next	
	
	


finish:
	lw	$s0 0($sp) 
	lw	$s1 4($sp)
	lw	$s2 8($sp)
	lw	$s3 12($sp)
	lw	$s4 16($sp)
	lw	$s5 20($sp)
	lw	$ra 24($sp)
	addiu	$sp $sp 28
	jr $ra