	.text
	.globl is_sorted
is_sorted:
	addiu $sp $sp -4	# Stack speichern
	sb $ra 0($sp)

	move $t5 $a0	# t5=a0
	move $t6 $a1	# t6=a1
	
	li $v0 0
	
	lw $t1 0($t5) 		#t1 = erstes Element
	lw $t2 4($t5)		#t2 = zweites Element
	
	lw $t3 0($t6) 
	addiu $t3 $t3 -4	#t3 = letztes Element Anfang
	
	
	ble $t3 $t5 emptyOrOne  #anfang letztes Element <= Anfang erstes Element (Kein Element oder ein Element)  (vergleicht die Adressen)
	b	loop
	
emptyOrOne:

	li $v0 0	
	b	finish

cancel: 
	addiu $t5 $t5 4 	#auf 2. Element der Vergleichsoperation springen
	move 	$v0 $t5 
	b 		finish


loop: 
	lw $t1 0($t5) 		#t1 = erstes Element
	lw $t2 4($t5)		#t2 = zweites Element
	
	
	blt $t2 $t1 cancel #zweites Element < erstes Element -> abbrechen
	
	addiu $t5 $t5 4 	#auf nächstes Element gucken
	
	bge $t5 $t3 finish	#wenn zweites Element >= Anfang letztes Element -> finish
	
	
	b	loop	#letztes Element wurde gerade ??berpr??ft, daher fertig

	
	
finish:	

lw $ra 0($sp)
addiu $sp $sp 4
jr $ra


# f??r Mengen nachher die Paare mit 1byte adresse des Nachfolgers + Wert
# bitshift vor und zur??ck zum "nullen" ?