%include 'commands.asm'

section .data
	msg db "Digite: ", 0           ; Mensagem a ser impressa
	msgLen equ $ - msg             ; Comprimento da mensagem
	
	prazerMSG db "Prazer em conhecelo ",0
	msgLenPrazer equ $ - prazerMSG
section .bss
	input resb 51                 ; Buffer para armazenar o caractere lido e o caractere nulo

section .text
    global _start

_start:


	; Escrever a mensagem no STDOUT
	lea text,esi
	call printSimply


	; Ler um caractere do teclado
	mov edx, 50                    		; Número de bytes a serem lidos
	mov ecx, input                		; Endereço do buffer de entrada
	mov ebx, STD_IN                 	; File descriptor 0 (STDIN)
	mov eax, SYS_READ                   ; SYS_READ (chamada do sistema para ler)
	int CALL_SYSTEM                     ; Chamada do sistema para sys_read

	mov edx, msgLenPrazer
	mov ecx, prazerMSG 
	call printSimply

	mov edx, 50                   
	mov ecx, input                
	call printSimply

	; Encerrar o programa
	mov ebx, RET_VAL                     ; Código de saída 0
	mov eax, SYS_EXIT                    ; SYS_EXIT (chamada do sistema para sair)
	int CALL_SYSTEM
