.data
vector: .space 30
n: .asciiz "\n"
msg: .asciiz "\nDados gaurdados na 1ª e 4ª posição\n"
q1: .asciiz "Digite o 1º número:"
q2: .asciiz "Digite o 2º número:"
q3: .asciiz "Digite o 3º número:"
q4: .asciiz "Digite o 4º número:"

#o .space é tamannho em bytes

.text

#----------------------------Escrita------------------------------------------
li $v0,4
la $a0, q1
syscall
li $v0, 5
syscall
#move $s0, $v0

addi $t0, $zero, 0 
#O registrador $t0 está a auxiliar nos índices

#Testando gaurdar directamente com o $v0
sw $v0, vector($t0)
#guardar o valor do $s0 na primeira posição

li $v0,4
la $a0, q2
syscall
li $v0, 5
syscall
move $s0, $v0

addi $t0, $t0, 4
#Saltou para a segunda posição
sw $s0, vector($t0)
#guardou o valor de $s0 na sagunda posição

li $v0,4
la $a0, q3
syscall
li $v0, 5
syscall
move $s0, $v0

addi $t0, $t0, 4 
#O registrador $t0 está a auxiliar nos índices

sw $s0, vector($t0)
#guardar o valor do $s0 na terceira posição

li $v0,4
la $a0, q4
syscall
li $v0, 5
syscall
move $s0, $v0

addi $t0, $t0, 4 
#O registrador $t0 está a auxiliar nos índices

sw $s0, vector($t0)
#guardar o valor do $s0 na quarta posição

#----------------------------Leitura------------------------------------------

lw $t5, vector($zero)
lw $t6, vector($t0)

li $v0,4
la $a0, msg
syscall


li $v0,1
move $a0, $t5
syscall

li $v0,4
la $a0, n
syscall

li $v0,1
move $a0, $t6
syscall

