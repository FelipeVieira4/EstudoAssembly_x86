segment .data ;Segment é uma parte da section
    ;Variaveis
    LF          equ 0xA ;Line Feed
    NULL        equ 0xD
    
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