.data
vetor:	.space 30
r:	.asciiz "Resultado: "
n:	.asciiz "\n"
digit:	.asciiz "Dgite o valor: "

.text
li $s0, 10
li $s1, 8

#Pedir o valor de Num1
li $v0, 4
la $a0, digit
syscall
#Ler valor
li $v0, 5
syscall
move $t0, $v0

#Pedir o valor de Num2
li $v0, 4
la $a0, digit
syscall
#Ler valor
li $v0, 5
syscall
move $t1, $v0

bne $t0, $t1, Else
add $s2,$s0,$s1
j Fim

Else: 
sub $s2,$s0,$s1

Fim:
li $v0,4
la $a0, n
syscall

li $v0,4
la $a0,r
syscall

li $v0,1
move $a0, $s2
syscall
