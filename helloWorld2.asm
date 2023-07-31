section .data
	msg db "Digite: ", 0          ; Mensagem a ser impressa
	msgLen equ $ - msg             ; Comprimento da mensagem
	
	prazerMSG db "Prazer em conhecelo ",0
	msgLenPrazer equ $ - prazerMSG
section .bss
	input resb 51                 ; Buffer para armazenar o caractere lido e o caractere nulo

section .text
    global _start

extern printf

_start:
	; Escrever a mensagem no STDOUT
	mov edx, msgLen
	mov ecx, msg
	mov ebx, 1                    ; File descriptor 1 (STDOUT)
	mov eax, 4                    ; SYS_WRITE (chamada do sistema para escrever)
	int 0x80                      ; Chamada do sistema para sys_write

	; Ler um caractere do teclado
	mov edx, 50                    ; Número de bytes a serem lidos
	mov ecx, input                ; Endereço do buffer de entrada
	mov ebx, 0                    ; File descriptor 0 (STDIN)
	mov eax, 3                    ; SYS_READ (chamada do sistema para ler)
	int 0x80                      ; Chamada do sistema para sys_read

	mov edx, msgLenPrazer
	mov ecx, prazerMSG 
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov edx, 50                    ; Tamanho da string (1 caractere)
	mov ecx, input                ; Endereço do caractere lido
	mov ebx, 1                    ; File descriptor 1 (STDOUT)
	mov eax, 4                    ; SYS_WRITE (chamada do sistema para escrever)
	
	
print_loop:
	int 0x80                      ; Chamada do sistema para sys_write
	
	cmp byte[ecx], 10	; 10 caracter em asci para enter
	jz end_loop

	dec dword ecx                 ; Decrementar o contador de repetições
	jnz print_loop                ; Repetir o loop enquanto ecx não for zero

end_loop:
	; Encerrar o programa
	mov ebx, 0                    ; Código de saída 0
	mov eax, 1                    ; SYS_EXIT (chamada do sistema para sair)
	int 0x80                      ; Chamada do sistema para sys_exit
