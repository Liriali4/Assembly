.data
input1:	.asciiz "Digite o seu nome: "
input2:	.asciiz "Digite o seu número de matrícula: "
nome:	.space 30
numero_de_matricula:	.space 10

.text
#Solicitar o nome
li $v0, 4
la $a0, input1
syscall

# Ler o nome digitado
li $v0, 8
la $a0, nome     
li $a1, 30   
syscall

#Solicitar o numero de matricula
li $v0, 4
la $a0, input2
syscall

# Ler o numero de matricula digitado
li $v0, 8
la $a0, numero_de_matricula    
li $a1, 10  
syscall
    
# Exibir os dados
li $v0, 4
la $a0, nome
syscall

li $v0, 4
la $a0, numero_de_matricula
syscall

li $v0, 10
syscall
