#Para double, apenas usamos os registradores de Coproc 1 pares (f0, f2, f4, ...)
#Move para double é mov.d; Move para float é mov.s
#Para float, todos os registradores de Coproc sao usados.
#Por omissao, o valores para float E double não caem em $v0, mas em f0.o 
#O f0 é o processador que recebe os dados os processador.
#Os coprocessadores não tem $zero. Podemos atribuir 0 a uma variavel e depois 
#fazer o que add.s $f12, $f0, variavel
.data
n1: .float 3.14
n2: .double 3.14

.text
li $v0, 2 #Imprimir um float ja existente
lwc1 $f12, n1 #f12 e f14 sao analogo ao a0, usado para passar argumentos. Coloca o valor de n1 em 12
syscall

#Pedir e imprimir um float pelo usuario
li $v0, 6 #Ler um float
syscall

li $v0, 2
#Uma alternativa ao codigo abaixo seria mov.s $f12, $f0 
add.s $f12, $f0, $f3 # Significa f12 = f0 + 0. Atribui o valor ao registador de serviço 
syscall

# DOUBLE -------------------------------------------------------
li $v0, 3 #Imprimir double
l.d $f12, n2 #Load double. 
syscall

#Pedir e imprimir um double pelo usuario
li $v0, 7 #Ler um double
syscall

li $v0, 3 
add.d $f12, $f0, $f10 
syscall

