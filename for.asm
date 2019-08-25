section .data
	Msg db "la suma del 3 al 0 es:",0xA,0xD
	lenMsg equ $ - Msg
    Msg1 db " ",0xA,0xD
	lenMsg1 equ $ - Msg1

section .bss
	num resb 2

section .text
	global _start
_start:
	mov eax, 4 
	mov ebx, 1	
	mov ecx, Msg 
	mov edx, lenMsg 
	int 0x80	
	
	mov eax, 0
	mov ecx, 3

loop_for:
	add eax, ecx
	loop loop_for

	add eax,'0'

	mov [num], eax

	mov eax, 4 
	mov ebx, 1	
	mov ecx, num 
	mov edx, 2 
	int 0x80

    mov eax, 4  
	mov ebx, 1	
	mov ecx, Msg1 
	mov edx, lenMsg1 
	int 0x80

	mov eax, 1 
	int 0x80