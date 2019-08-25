%macro presentar 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h
%endmacro

%macro ing_teclado 2
mov eax, 3
mov ebx, 2
mov ecx, %1
mov edx, %2
int 80h
%endmacro
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
	presentar Msg, lenMsg 
	
	ing_teclado num, 5
		
	presentar Msg1, lenMsg1

	presentar num, 5
	
	mov eax, 1
	mov ebx, 0
	int 80h
