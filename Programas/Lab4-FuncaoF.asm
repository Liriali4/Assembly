.data
printf: .asciiz "CÁLCULO DA FUNÇÃO F\n"
printf2: .asciiz "\nDigite os 4 números: "
printf3: .asciiz "\nValor de f: "
.text

# Solicitação dos valores de g, h, i, j
li $v0, 4
la $a0, printf
syscall

li $v0, 4
la $a0, printf2
syscall

li $v0, 5
syscall
move $a0, $v0


li $v0, 5
syscall
move $a1, $v0


li $v0, 5
syscall
move $a2, $v0


li $v0, 5
syscall
move $a3, $v0

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
addi $sp, $sp, -12
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $s0, 0($sp)


#Fazer Operações
add $t0, $a0, $a1
add $t1, $a2, $a3
sub $s0, $t0, $t1

# Retornar o valor de f em $v1
add $v1, $s0, $zero

#Liberação da memória
lw $s0, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
addi $sp, $sp, 12



jr $ra
