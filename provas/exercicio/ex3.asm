.data
f:   .asciiz "if(i<4.0) f= g+(i+j)\nelse f=(h+g)*(i+j)\n\n"
P3:  .asciiz "Digite o valor de i: "
P4:  .asciiz "Digite o valor de j: "
R:   .asciiz "Resultado da função f: "
g:   .float 2.0
h:   .float 8.0
quatro: .float 4.0

.text
    # Mostrar expressão
    li $v0, 4
    la $a0, f
    syscall

    # ------------------- Input i ------------------------
    li $v0, 4
    la $a0, P3
    syscall

    li $v0, 6       # Ler float
    syscall
    mov.s $f4, $f0  # f4 = i

    # ------------------- Input j ------------------------
    li $v0, 4
    la $a0, P4
    syscall

    li $v0, 6       # Ler float
    syscall
    mov.s $f6, $f0  # f6 = j

    # ------------------- Carregar constantes g, h, 4.0 ------------------------
    l.s $f8, g        # g = 2.0
    l.s $f10, h       # h = 8.0
    l.s $f12, quatro  # 4.0

    # ------------------- Verificar condição: if(i < 4.0) ----------------------
    c.lt.s $f4, $f12     # if i < 4.0
    bc1t IF_TRUE         # branch se condição verdadeira

# ELSE:
    add.s $f14, $f10, $f8     # h + g
    add.s $f16, $f4, $f6      # i + j
    mul.s $f2, $f14, $f16     # f = (h+g)*(i+j)
    j IMPRIMIR

IF_TRUE:
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
