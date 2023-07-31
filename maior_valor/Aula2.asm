%include 'commands.asm' ;Incluir o arquivo commands

section .data:
    x db 0xFF   ;1 byte ou 8 bits
    y dw 0xFA    ;2 byte ou 16 bits

    msgX db "X e maior que Y", LF, NULL
    msgY db "Y e maior que X", LF, NULL
    tMsg equ $- msgY

    msgEqua db "X e Y são iguais!!", LF, NULL
    tMSGEqua equ $- msgEqua



section .text:
    global _start

_start:

   ; Compara os valores de x e y
    mov bx, word[y]
    movzx ax, byte[x] ;Colocar variavel x de 1 byte em registrado ax de 2 byte
    cmp ax,bx
    jg maior
    jl menor

    mov ecx, msgEqua
    mov edx, tMSGEqua
    jmp fim

maior:
    mov ecx, msgX
    mov edx, tMsg
    jmp fim
menor:
    mov ecx, msgY
    mov edx, tMsg

fim:
    ; Escreve a mensagem final na saída padrão
    mov ebx, STD_OUT
    mov eax, SYS_WRITE
    int CALL_SYSTEM

    ; Encerra o programa
    mov eax, SYS_EXIT
    xor ebx,ebx         ;Comparar os binários e retornar 0
    int CALL_SYSTEM