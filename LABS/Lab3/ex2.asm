.data
vector: .space 16       # 4 posições de 4 bytes cada = 16 bytes
newline: .asciiz "\n"

.text

# Inicializar registradores com os valores
li $s0, 5
li $s1, 10
li $s2, 15
li $s3, 20

# Guardar os valores no vetor
la $t1, vector       # $t1 aponta para o início do vetor
sw $s0, 0($t1)       # vetor[0] = 5
sw $s1, 4($t1)       # vetor[1] = 10
sw $s2, 8($t1)       # vetor[2] = 15
sw $s3, 12($t1)      # vetor[3] = 20

# Inicializar índice para o loop
li $t0, 0            # $t0 = índice (0, 1, 2)

Loop:
# Condição do while: enquanto $t0 < 3
li $t2, 3
bge $t0, $t2, Fim     # se índice >= 3, sai do loop

# Calcular o endereço do elemento vetor[$t0]
la $t1, vector
mul $t3, $t0, 4       # offset = índice * 4
add $t4, $t1, $t3     # endereço completo

# Carregar e imprimir o valor
lw $a0, 0($t4)
li $v0, 1
syscall

# Nova linha
li $v0, 4
la $a0, newline
syscall

# Incrementar o índice
addi $t0, $t0, 1
j Loop

Fim:
li $v0, 10       # Encerrar programa
syscall
