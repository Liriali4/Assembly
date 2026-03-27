# Dobro d    os pares de 1 á 100
.data
vector: .space 400
n:      .asciiz "\n"
info:   .asciiz "\nDobro dos pares de 1 á 100\n"
final:  .asciiz "\n\n Fim do programa!!!\n\n"

.text
# -------------------------- Carregar o vector --------------------------------
li $t0, 1         # valor
li $t1, 0         # índice (offset)
Carregar_vector:
    sw $t0, vector($t1)
    addi $t0, $t0, 1
    addi $t1, $t1, 4
    slti $t2, $t1, 400
    bne $t2, $zero, Carregar_vector

# -------------------------- Exibir --------------------------------
li $v0, 4
la $a0, info
syscall

li $t1, 0
Encontrar_pares:
    lw $t0, vector($t1)
    li $t3, 2
    div $t0, $t3
    mfhi $s0             # <-- pega o resto

    bne $s0, $zero, Else # se resto != 0, vai para Else

    mul $s1, $t0, 2
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, n
    syscall

Else:
    addi $t1, $t1, 4
    slti $t2, $t1, 400
    bne $t2, $zero, Encontrar_pares

# -------------------------- Encerrando o programa --------------------------
li $v0, 4
la $a0, final
syscall

li $v0, 10
syscall
