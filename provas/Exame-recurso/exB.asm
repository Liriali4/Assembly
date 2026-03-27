# Dobro dos ímpares de 1 a 150
.data
n:      .asciiz "\n"
info:   .asciiz "Dobro dos ímpares de um a 150"
vector: .space 600      # 150 valores * 4 bytes

.text
.globl main
main:
# --------------------- Carregar o vetor -------------
li $t0, 1       # valores
li $t1, 0       # índice

Carregar_vector:
    sw $t0, vector($t1)
    addi $t0, $t0, 1
    addi $t1, $t1, 4
    slti $t2, $t1, 600
    bne $t2, $zero, Carregar_vector

# -------------------- Dobro dos ímpares -------------
li $v0, 4

la $a0, info
syscall

li $t1, 596       # começa no último índice (149 * 4)

Encontrar_Impar:
    lw $t0, vector($t1)
    li $t3, 2
    div $t0, $t3
    mfhi $s0

    beq $s0, $zero, Else     # se par, pula
    mul $s1, $t0, 2
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, n
    syscall

Else:
    addi $t1, $t1, -4
    slti $t2, $t1, 0
    bne $t2, $zero, Fim    # se $t1 < 0, termina
    j Encontrar_Impar

Fim:
    li $v0, 10
    syscall
