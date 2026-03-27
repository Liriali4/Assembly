.data
printf: .asciiz "CÁLCULO DA FACTORIAL\n"
printf2: .asciiz "\nDigite o número: "
printf3: .asciiz "\nFactorial: "

.text
# Solicitação dos valores de N
li $v0, 4
la $a0, printf
syscall

li $v0, 4
la $a0, printf2
syscall

li $v0, 5
syscall
move $a0, $v0

#Pular para a função

jal FuncaoF

#Printar o resultado
li $v0, 4
la $a0, printf3
syscall
li $v0, 1
move $a0, $v1
syscall

li $v0, 10
syscall

#FuncaoF

FuncaoF:
#Alocação de memória
addi $sp, $sp, -8
sw $ra, 4($sp)
sw $a0, 0($sp)

slti $t0, $a0,1
beq $t0, $zero, L1

addi $v1, $zero, 1
addi $sp, $sp, 8
jr $ra

L1:
addi $a0, $a0, -1
jal FuncaoF

#Liberação da memória
lw $a0, 0($sp)
lw $ra, 4($sp)
addi $sp, $sp, 8

mul $v1,  $a0, $v1

jr $ra
