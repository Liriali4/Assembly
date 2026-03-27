#leitura de Strings
.data
texto_result: .asciiz "\n\n"
input:	.asciiz "Degite o seu nome: "
msg:	.asciiz ", é um prazer conhecer você!!!"
nome:	.space 30 #30 bytes reservados para a memória

.text
#Solicitar o nome
li $v0, 4
la $a0, input
syscall

# Ler o nome digitado
li $v0, 8
la $a0, nome     # local onde será armazenada a string
li $a1, 30       # tamanho máximo
syscall

# Quebra de linhaa
    li $v0, 4
    la $a0, texto_result
    syscall
    
# Exibir o nome
li $v0, 4
la $a0, nome
syscall

li $v0, 4
la $a0, msg
syscall