#Formulário
.data
P1:	.asciiz "Digite seu nome:"
P2:	.asciiz "Digite seu nº de estudante:"
P3:	.asciiz "Digite seu curso:"
P4:	.asciiz "Digite o nome da instituição:"
R1:	.asciiz "Nome:"
R2:	.asciiz "Número de estudante:"
R3:	.asciiz "Curso:"
R4:	.asciiz "IES:"
enfeite: .asciiz "============================================================\n"
nome:	.space	30
numero:	.space	30
curso:	.space	30
instituicao: .space 60
final:	.asciiz "\n\n Fim do programa\n\n"
N:	.asciiz "\n"
.text
#--------------------------- Armazenar Valores ----------------------------
#Solicitar nome
li $v0, 4
la $a0, P1
syscall
#Ler nome
li $v0, 8
la $a0, nome
la $a1, 30
syscall

#Solicitar número de estudante
li $v0, 4
la $a0, P2
syscall
#Ler número de estudante
li $v0, 8
la $a0, numero
la $a1, 30
syscall

#Solicitar o curso
li $v0, 4
la $a0, P3
syscall
#Ler curso
li $v0, 8
la $a0, curso
la $a1, 30
syscall

#Solicitar nome
li $v0, 4
la $a0, P4
syscall
#Ler instituição
li $v0, 8
la $a0, instituicao
la $a1, 30
syscall

#--------------------------- Exibir Valores ----------------------------
li $v0, 4
la $a0, N
syscall
li $v0, 4
la $a0, enfeite
syscall

li $v0, 4
la $a0, R1
syscall
li $v0, 4
la $a0, nome
syscall

li $v0, 4
la $a0, R2
syscall
li $v0, 4
la $a0, numero
syscall

li $v0, 4
la $a0, R3
syscall
li $v0, 4
la $a0, curso
syscall

li $v0, 4
la $a0, R4
syscall
li $v0, 4
la $a0, instituicao
syscall

li $v0, 4
la $a0, enfeite
syscall

#Encerrando o programa
li $v0,4
la $a0, final
syscall

li $v0, 10
syscall
