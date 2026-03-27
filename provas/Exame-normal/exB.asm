.data
info:	.asciiz "Digite o valor de K: "
R:	.asciiz "Resultado: "
.text
li $v0,4
la $a0, info
syscall
li $v0, 5
syscall
move $s0, $v0

li $s1, 5  #i
li $s2, 2  #j
li $s3, 4  #g
li $s4, 3  #h

bne $s0, $zero, UM
add $t1, $s1, $s2
j F

UM:
li $t0, 1
bne $s0, $t0, DOIS
mul $t1, $s3, $s4
j F

DOIS:
li $t0, 2
bne $s0, $t0, Tres
sub $t1, $s3, $s4
j F

Tres:
div $s1, $s2
mflo $t1

F:
li $v0,4
la $a0, R
syscall
li $v0, 1
move $a0, $t1
syscall


