.data
base:	.asciiz "Digite a base: "
expoente:	.asciiz "Digite o expoente: "
R:	.asciiz "Resultado: "

.text
# Ler base
li $v0, 4
la $a0, base
syscall

li $v0, 5
syscall
move $t0, $v0 

#Ler expoente
li $v0, 4
la $a0, expoente
syscall

li $v0, 5
syscall
move $t1, $v0

# Cálculo 
li $t2, 1 #resultado inicializado com 1
li $t3, 0 #contador

Calcular:
beq $t3, $t1, Fim_do_calculo   # se contador = expoente, sair do cálculo
mul $t2, $t2, $t0 
addi $t3, $t3, 1
j Calcular

Fim_do_calculo:
#Imprimir
li $v0, 4
la $a0, R
syscall

li $v0, 1
move $a0, $t2
syscall
«
li $v0, 10
syscall
