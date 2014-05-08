	.text
	.globl binary_search
	
binary_search:
	addiu $sp $sp -4				# Stack speichern
	sw $ra 0($sp)
	
	move $v0 $a0					# Adresse des ersten Wortes = Ergebnis
	move $t0 $a0					# t0 = Adresse des ersten Wortes
	move $t1 $a1		
	addiu $t1 $t1 4					# t1 = Adresse des letzten Wortes
	move $t2 $a2					# t2 = gesuchtes Wort
	
	
calcmiddle:
	beq $t0 $t1 PointerEven1			# Wenn Zeiger gleich, letzte Überprüfung
	beq $t0 $t3 PointerEven1
	beq $t1 $t3 PointerEven2
	
	addu $t3 $t0 $t1				
	li $t5 2
	div $t3 $t5						# Mitte berechnen
	mflo $t3						# t3 = Mitte
	
	#sll $t3 $t3 3
	#srl $t3 $t3 1					# Teilbarkeit durch 4 mit Bitshifts sicherstellen
	
	
	#Neu
	li $t5 4
	div $t3 $t5
	mflo $t3
	mul $t3 $t3 4
	#Ende
	
	
	move $v0 $t3					# Mittelzeiger auf Gleichheit überprüfen
	lw $t4 0($t3)
	beq $t4 $t2 finish
	
	blt $t4 $t2 watchleft
	bgt $t4 $t2 watchright
	
	
watchleft:
	move $t1 $t3
	b calcmiddle
	
watchright:
	move $t0 $t3
	b calcmiddle
	
PointerEven1: 
	move $v0 $t0	
	lw $t4 0($t0)						# t4 = Wort auf das beide Zeiger zeigen
	beq $t4 $t2 finish				# bei Gleichheit mit gesuchtem Wort finish
	li $v0 0						# Da keine Gleichheit Ergebnis = 0
	b finish
	
PointerEven2: 
	move $v0 $t1	
	lw $t4 0($t1)						# t4 = Wort auf das beide Zeiger zeigen
	beq $t4 $t2 finish				# bei Gleichheit mit gesuchtem Wort finish
	li $v0 0						# Da keine Gleichheit Ergebnis = 0
	b finish
	
finish:
	lw $ra 0($sp)
	addiu $sp $sp 4
	jr $ra