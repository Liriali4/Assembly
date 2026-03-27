#Valores do tipo real

# Float

#Atribuição
.data
n1:	.float 3.14
n2:	.double 3.14

.text
li $v0,2 #imprimir float
#mover o valor do n1 para $f12 para imprimir, leitura da palavra
lwc1 $f12, n1
syscall

#Leitura
li $v0, 6 #Ler um float
syscall

li $v0, 2
add.s $f12, $f0, $f3
syscall

li $v0,3 #imprimir double
#mover o valor do n1 para $f12 para imprimir, leitura da palavra
ldc1 $f12, n1
syscall

#Leitura
li $v0, 7 #Ler um double
syscall

li $v0, 3
add.d $f12, $f0, $f10
syscall

