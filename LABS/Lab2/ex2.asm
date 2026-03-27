.data
vector: .space 30
n: .asciiz "\n"
msg: .asciiz "\nDados gaurdados\n"

#o .space é tamannho em bytes

.text

#----------------------------Escrita------------------------------------------
#Ler o 1º número
li $v0, 5
syscall
move $s0, $v0
#inicializar $t0 para controlo dos índices
addi $t0, $zero, 0 

sw $s0, vector($t0) #guardar o valor do $s0 na primeira posição

#Ler o 2º número
li $v0, 5
syscall
move $s0, $v0

addi $t0, $t0, 4 #Saltou para a segunda posição
sw $s0, vector($t0) #guardou o valor de $s0 na sagunda posição

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

