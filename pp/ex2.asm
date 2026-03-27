.data
vector: .space 600	# 4*150=600
n:      .asciiz "\n"
info:   .asciiz "\nDecrescentes dos dobros dos impares de 120 á 1\n"
final:  .asciiz "\n\n Fim do programa!!!\n\n"

.text
# -------------------------- Carregar o vector --------------------------------
li $t0, 1         # valor
li $t1, 0         # índice
Carregar_vector:
sw $t0, vector($t1)
addi $t0, $t0, 1
addi $t1, $t1, 4
slti $t2, $t1, 600
bne $t2, $zero, Carregar_vector

# -------------------------- Exibir os dobros dos ímpares--------------------------------
li $v0, 4
la $a0, info
syscall

li $t1, 476		# 120º elemento: (120 - 1) * 4 = 476
Encontrar_impares:
lw $t0, vector($t1)

li $t3, 2
div $t0, $t3
mfhi $s0             # pega o resto
bne $s0, $zero, Else # se resto != 0, vai para Else pois é impar
j Fim_if             # se for par, não imprime

Else:
mul $s1, $t0, 2
li $v0, 1
move $a0, $s1
syscall

li $v0, 4
la $a0, n
syscall

Fim_if:
addi $t1, $t1, -4
slti $t2, $t1, 0
beq $t2, $zero, Encontrar_impares  # se $t1 >= 0, continua a té o último valor

li $v0, 4
la $a0, final
syscall

li $v0, 10
syscall
