section .data

mensaje1 db "Ingrese Numero1", 0xA, 0xD
len1 equ $ - mensaje1

mensaje2 db  "Ingrese Numero2", 0xA, 0xD
len2 equ $ - mensaje2

mensaje3 db  "Ingrese Numero3", 0xA, 0xD
len3 equ $ - mensaje3

resultado db "Son iguales  ", 0xA, 0xD
len_r equ $ - resultado 

resultado2 db "No son iguales ", 0xA, 0xD
len_r2 equ $ - resultado2

section .bss

numero1 resb 2
numero2 resb 2
numero3 resb 2
resul resb 2

section .text

    global _start

_start:

    ;<-------------------ingreso numero 1 -------------->
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje1
    mov edx, len1
    int 80H

    mov eax, 3
    mov ebx, 2
    mov ecx, numero1
    mov edx, 2
    int 80H 
    ;<-------------------ingreso numero 2 -------------->

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje2
    mov edx, len2
    int 80H

    mov eax, 3
    mov ebx, 2
    mov ecx, numero2
    mov edx, 2
    int 80H 

 ;<-------------------ingreso numero 3 -------------->

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje3
    mov edx, len3
    int 80H

    mov eax, 3
    mov ebx, 2
    mov ecx, numero3
    mov edx, 2
    int 80H 



    ;<------------------- Comparacion1 -------------->

    mov ax, [numero1]
    mov bx, [numero2]
    mov cx, [numero3]


    sub ax, '0'
    sub bx, '0'
    sub cx, '0'
    add ax, bx
    cmp al, cl
    jz igual
    jmp noiguales1
			

		

igual:
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, len_r
    int 80H 
    jmp salir


;<------------------- Comparacion2 -------------->
noiguales1:

    mov ax, [numero1]
    mov bx, [numero2]
    mov cx, [numero3]


    sub ax, '0'
    sub bx, '0'
    sub cx, '0'
    add ax, cx

    cmp al, bl

    jz  igual
    jmp noiguales2

;<------------------- Comparacion3 -------------->
noiguales2:

    mov ax, [numero1]
    mov bx, [numero2]
    mov cx, [numero3]


    sub ax, '0'
    sub bx, '0'
    sub cx, '0'
    add bx, cx
  
   
    cmp bl, cl
    jz igual
    
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado2
    mov edx, len_r2
    int 80H 
    jmp salir


salir: 
	mov eax, 1
	mov ebx, 0
	int 80h
