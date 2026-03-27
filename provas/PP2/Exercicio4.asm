#Operações com inteiro
.data
f:	.asciiz "if(i<j) f= g+(i*j)\n else f=(h/g)*(i+j)\n\n"
P3: .asciiz "Digite o valor de i:"
P4: .asciiz "Digite o valor de j:"
R: .asciiz "Resultado da função f: "

.text
li $v0,4
la $a0,f
syscall

li $t1, 2 #g
li $t2, 8 #h

#-------------------Receber Valores-------------------------

#Solicitar i
li $v0, 4
la $a0, P3
syscall
#Ler valor de i
li $v0,5
syscall
move $t3, $v0

#Solicitar j
li $v0, 4
la $a0, P4
syscall
#Ler valor de j
li $v0,5
syscall
move $t4, $v0

slt $t0, $t3, $t4

bne $t0, 1, Else

mul $t5, $t3, $t4
add $s0, $t1, $t5

j Final

Else:
div $t5, $t2, $t1
add $t6, $t3, $t4
mul $s0, $t5, $t6

Final:
li $v0, 4
la $a0, R
syscall

li $v0, 1
move $a0, $s0
syscall

li $v0, 10
syscall
