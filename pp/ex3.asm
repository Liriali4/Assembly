.data
f:   .asciiz "if(a<3) f= g+(i+j)\nelse f=(h+g)*(i+j)\n"
P1:  .asciiz "Digite o valor de a: "
P2:  .asciiz "Digite o valor de i: "
P3:  .asciiz "Digite o valor de j: "
R:   .asciiz "Resultado da função f: "
g:   .float 2.0
h:   .float 8.0

.text
# Mostrar expressão
li $v0, 4
la $a0, f
syscall

#solicitar a
li $v0, 4
la $a0, P1
syscall

li $v0, 5
syscall
move $t1, $v0

#solicitar i    
li $v0, 4
la $a0, P2
syscall

li $v0, 6 
syscall
mov.s $f4, $f0

#solicitar j
li $v0, 4
la $a0, P3
syscall

li $v0, 6 
syscall
mov.s $f6, $f0

# Carregar constantes g, h
l.s $f8, g 
l.s $f10, h

slti $t0, $t1, 3 
bne $t0, $zero, IF

# ELSE:
add.s $f14, $f10, $f8     # h + g
add.s $f16, $f4, $f6      # i + j
mul.s $f2, $f14, $f16     # f = (h+g)*(i+j)
j IMPRIMIR

IF:
add.s $f14, $f4, $f6      # i + j
add.s $f2, $f8, $f14      # f = g + (i+j)

IMPRIMIR:
# Mostrar texto
li $v0, 4
la $a0, R
syscall

# Mostrar resultado f
li $v0, 2
mov.s $f12, $f2
syscall

# Encerrar
li $v0, 10
syscall
