#Teste do procedimento
.data
R: .asciiz "A soma de 8 + 2 = "
n: .asciiz "\n\n"
 
.text
li $t0, 8
li $t1, 2

jal Procedimento

li $v0, 4
la $a0, n
syscall

li $v0, 4
la $a0, R
syscall

li $v0, 1
move $a0, $v1
syscall

li $v0, 4
la $a0, n
syscall

li $v0, 10
syscall

Procedimento:
add $v1, $t0,$t1
jr $ra


