segment .data ;Segment é uma parte da section
    ;Variaveis
    LF          equ 0xA ;Line Feed
    NULL        equ 0xD ;Caracter nulo
    
    ;EAX
    SYS_EXIT    equ 0x1 ;Comando para saida do programa
    SYS_WRITE   equ 0x4 ;Comando para saida de dados
    SYS_READ    equ 0x3 ;Comando para entrada de dados
    
    ;EBX
    STD_IN      equ 0x0 ;Comando para entrada de dados
    STD_OUT     equ 0x1 ;Comando para saida de dados
    RET_VAL     equ 0x0 ;Valor do retorno(saida do programa)

    ;Sistema Operacional
    CALL_SYSTEM equ 0x80 ;Chamado para o sistema operacional
    
    msgHW db "hello world!", LF,NULL
    HWLen equ $- msgHW

printHW:

    mov ecx, msgHW          ;Apontar endereço da variavel
    mov edx, HWLen          ;Quantos caracteres vão ser printados
    mov eax, SYS_WRITE      ;Fazer chamada do sistema para escrever
    mov ebx, STD_OUT        ;Fazer chamada do sistema para saida
    int CALL_SYSTEM         ;Chamar o sistema
    ret                     ;Retorna ao código principal