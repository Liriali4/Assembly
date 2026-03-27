.data 
texto_horas:    .asciiz "Digite o número de horas trabalhadas: "
texto_salario:  .asciiz "Digite o valor do salário mínimo: "
texto_extras:   .asciiz "Digite o número de horas extras trabalhadas: "
texto_result:   .asciiz "O seu salário é: "
newline:        .asciiz "\n"


.text

    # Exibir mensagem para inserir número de horas trabalhadas
    li $v0, 4
    la $a0, texto_horas
    syscall
    
    # Ler o número de horas trabalhadas
    li $v0, 5
    syscall
    move $t0, $v0   # Armazena o número de horas trabalhadas em $t0
    
    # Exibir mensagem para inserir o valor do salário mínimo
    li $v0, 4
    la $a0, texto_salario
    syscall
    
    # Ler o valor do salário mínimo
    li $v0, 5
    syscall
    move $t1, $v0   # Armazena o salário mínimo em $t1
    
    # Exibir mensagem para inserir o número de horas extras trabalhadas
    li $v0, 4
    la $a0, texto_extras
    syscall
    
    # Ler o número de horas extras trabalhadas
    li $v0, 5
    syscall
    move $t2, $v0   # Armazena o número de horas extras trabalhadas em $t2
    
    # Calcular valor da hora trabalhada (1/8 do salário mínimo)
    li $t3, 8
    div $t1, $t3
    mflo $t4        # $t4 contém o valor da hora trabalhada
    
    # Calcular valor da hora extra (1/4 do salário mínimo)
    li $t3, 4
    div $t1, $t3
    mflo $t5        # $t5 contém o valor da hora extra
    
    # Calcular salário bruto (horas trabalhadas * valor da hora trabalhada)
    mul $t6, $t0, $t4
    
    # Calcular valor recebido por horas extras (horas extras * valor da hora extra)
    mul $t7, $t2, $t5
    
    # Calcular salário total (salário bruto + valor das horas extras)
    add $t8, $t6, $t7
    
    # Exibir mensagem "O seu salário é: "
    li $v0, 4
    la $a0, texto_result
    syscall
    
    # Exibir o salário calculado
    li $v0, 1
    move $a0, $t8
    syscall
    
    # Pular uma linha
    li $v0, 4
    la $a0, newline
    syscall
    
    # Encerrar o programa
    li $v0, 10
    syscall

