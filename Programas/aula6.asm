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

sw $s0, vector(0)       # vetor[0] = 5
sw $s1, vector(4)       # vetor[1] = 10
sw $s2, vector(8)     # vetor[2] = 15
sw $s3, vector(12)      # vetor[3] = 20

