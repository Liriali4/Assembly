.data
vector:	.space	12
info1:	.asciiz "Digite o valor de i: "
info2:	.asciiz "Digite o valor de j: "
n:      .asciiz "\n"


.text
#--------------------------- Soliciar valores -------------------------
li $v0,4
la $a0, info1
syscall
li $v0, 5
syscall
move $s0, $v0	#i

li $v0,4
la $a0, info2
syscall
li $v0, 5
syscall
move $s1, $v0	#j

li $t0, 0	#contador do índice do vector
li $t1, 4	#h

slt $t2, $s0, $s1
bne $t2, $zero, Else
addi $t0,$t0,8
add $t3, $t1, vector($t0)
j F
Else:
addi $t0, $t0, 12
add $t3, $t1, vector($t0)
sw $t3, vector($t0)

F:


li $v0, 10