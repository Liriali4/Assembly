#Teste do procedimento com parâmetro 
.data
printf: .asciiz "Digite o número: "
R: .asciiz "Resultado da soma = "
n: .asciiz "\n"
 
.text
#solicitar o 1º valor
li $v0, 4
la $a0, printf
syscall
li $v0,5
syscall
move $a1, $v0
#solicitar o 2º valor
li $v0, 4
la $a0, printf
syscall
li $v0,5
syscall
move $a2, $v0

jal Procedimento

#Exibir o resultado
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

#Encerrar o programa
li $v0, 10
syscall

#função que vai realizar a soma
Procedimento:
addi $sp,$sp, -4 #declara a pilha para 1 elementos
sw $s0, 0($sp)

add $s0, $a1, $a2
add $v1, $zero, $s0

lw $s0, 0($sp)
addi $sp, $sp, 4

jr $ra

