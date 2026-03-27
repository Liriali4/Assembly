.data
nome:	.asciiz "Líria Djecnaba Vilança Bá"
matricula: .asciiz "20230237"
n:	.asciiz "\n"

.text
# Exibir nome
li $v0, 4
la $a0, nome
syscall

# Nova linha
li $v0, 4
la $a0, n
syscall

# Exibir número de matrícula
li $v0, 4
la $a0, matricula  # carregar endereço da string da matrícula
syscall

# Encerrar o programa
li $v0, 10
syscall
