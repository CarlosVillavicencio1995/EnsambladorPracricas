section  .data 
	Msg db 'ingrese un numero: ' 
	lenMsg equ $-Msg  ;longitud de userMsg
	Msg1 db 'el numero ingresado es: '
	lenMsg1 equ $-Msg1 

section .bss  ;dato en dondee almacenara los numero a ingresar
	num resb 5

section .text  ;Code Segment
	global _start
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, Msg   
	mov edx, lenMsg 
	int 80h    

	mov eax, 3
	mov ebx, 2
	mov ecx, num 
	mov edx, 5   
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, Msg1
	mov edx, lenMsg1
	int 80h 

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h 

	mov eax, 1
	mov ebx, 0
	int 80h