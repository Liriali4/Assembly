.data
vector: .space 30
n: .asciiz "\n"

#o .space é tamannho em bytes

.text

#----------------------------Escrita------------------------------------------
li $s0, 10
li $s1, 12
li $s2, 14
addi $t0, $zero, 0 
#O registrador $t0 está a auxiliar nos índices

sw $s0, vector($t0)
#guardar o valor do $s0 na primeira posição

addi $t0, $t0, 4
#Saltou para a segunda posição
sw $s1, vector($t0)
#guardou o valor de $s1 na sagunda posição

addi $t0, $t0, 4
#Saltou para a segunda posição
sw $s2, vector($t0)
#guardou o valor de $s2 na terceira posição

#----------------------------Leitura------------------------------------------
#Voltar a primeira posiçao
#addi $t0, $zero, 0 
#ou
#subi $t0, $t0, 8
lw $t5, vector($zero)
lw $t6, vector($t0)

li $v0,1
move $a0, $t5
syscall

li $v0,4
la $a0, n
syscall

li $v0,1
move $a0, $t6
syscall

