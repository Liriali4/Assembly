.data
msg:	.asciiz "Resolve a seguinte expressão: f = (g + h) ? (i + j); \n\n"
infog: .asciiz "Digita o g:"
infoh: .asciiz "Digita o h:"
infoi: .asciiz "Digita o i:"
infoj: .asciiz "Digita o j:"
resultado:	.asciiz "\nO resultado é:"

.text

li $v0, 4
la $a0, msg
syscall

#Pedir o g
li $v0, 4
la $a0, infog
syscall

li $v0, 5
syscall
move $t0, $v0 #guardar o valor de g em $t0

#Pedir o h
li $v0, 4
la $a0, infoh
syscall

li $v0, 5
syscall
move $t1, $v0 #guardar o valor de h em $t1

#Pedir o i
li $v0, 4
la $a0, infoi
syscall

li $v0, 5
syscall
move $t2, $v0 #guardar o valor de i em $t2

#Pedir o j
li $v0, 4
la $a0, infoj
syscall

li $v0, 5
syscall
move $t3, $v0 #guardar o valor de j em $t3

#somar o g e h
add $t4, $t0, $t1
#somar o i e j
add $t5, $t2, $t3
#subtrair os valores
sub $t6, $t4, $t5

#Imprimir o valor
li $v0,4
la $a0, resultado
syscall

li $v0, 1
move $a0,$t6
syscall


