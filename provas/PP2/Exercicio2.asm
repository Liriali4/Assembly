#Operações com float
.data
f:	.asciiz "f = [(g * h) - ((i * j) + (i * g))] / i;\n\n"
P1: .asciiz "Digite o valor de g:"
P2: .asciiz "Digite o valor de h:"
P3: .asciiz "Digite o valor de i:"
P4: .asciiz "Digite o valor de j:"
R: .asciiz "Resultado da função f: "

.text
li $v0,4
la $a0,f
syscall
#-------------------Receber Valores-------------------------
#Solicitar g
li $v0, 4
la $a0, P1
syscall
#Ler valor de g
li $v0,6
syscall
mov.s $f1, $f0

#Solicitar h
li $v0, 4
la $a0, P2
syscall
#Ler valor de h
li $v0,6
syscall
mov.s $f2, $f0

#Solicitar i
li $v0, 4
la $a0, P3
syscall
#Ler valor de i
li $v0,6
syscall
mov.s $f3, $f0

#Solicitar j
li $v0, 4
la $a0, P4
syscall
#Ler valor de j
li $v0,6
syscall
mov.s $f4, $f0

#----------------------- Cálculo da função f ----------------
mul.s $f5, $f1, $f2
mul.s $f6, $f3, $f4
mul.s $f7, $f3, $f1
add.s $f8, $f6, $f7
sub.s $f9, $f5, $f8
div.s $f10, $f9, $f3

#----------------------- Resultados ----------------
li $v0,4
la $a0,R
syscall

li $v0, 2
mov.s $f12, $f10
syscall

li $v0, 10
syscall