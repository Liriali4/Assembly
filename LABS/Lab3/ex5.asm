.data
vetor: .space 30
n: .asciiz "\n"
digit: .asciiz "Dgite o valor: "
ehmenor: .asciiz "O primeiro valor é menor"
naoehmenor: .asciiz "O primeiro não é menor"


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

slt $s2,$t0,$t1

beq $s2, 1, Else
add $s2,$s0,$s1
j Fim

Else: 
sub $s2,$s0,$s1
li $v0,4
la $a0, ehmenor
syscall
j saida

Fim:
li $v0,4
la $a0, naoehmenor
syscall

saida:
li $v0,4
la $a0, n
syscall

li $v0,1
move $a0, $s2
syscall
