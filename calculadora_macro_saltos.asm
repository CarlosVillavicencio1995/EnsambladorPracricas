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

section .data

mensaje1 db "Ingrese Numero1", 0xA, 0xD
len1 equ $ - mensaje1

mensaje2 db  "Ingrese Numero2", 0xA, 0xD
len2 equ $ - mensaje2

resultado db "El resultado de la operacion = ", 0xA, 0xD
len_r equ $ - resultado 

cocien db "y el Cociente = ", 0xA, 0xD
len_c equ $ - cocien

espacio db "", 0xA, 0xD
len_es equ $ - espacio 

section .bss
numero1 resb 2
numero2 resb 2
resul resb 2
residuo resb 2
cociente resb 2

section .text

    global _start

_start:

    ;<-------------------ingreso numero 1 -------------->
    presentar mensaje1, len1

    ing_teclado numero1, 2
    
    ;<-------------------ingreso numero 2 -------------->

    presentar mensaje2, len2

    ing_teclado numero2, 2

    jmp multiplicacion

;<------------------- suma -------------->
suma:
    mov al, [numero1]
    mov bl, [numero2]

    sub al, '0'
    sub bl, '0'
    add al, bl
    add al, '0'
    mov [resul], al
   
    presentar resultado, len_r

    presentar resul, 2
    
    presentar espacio, len_es

    
    jmp salir

;<------------------------ resta --------------------------------->    
restar:
    mov al, [numero1]
    mov bl, [numero2]

    sub al, '0'
    sub bl, '0'
    sub al, bl
    add al, '0'
    mov [resul], al
   
    presentar resultado, len_r

    presentar resul, 2
    
    presentar espacio, len_es

    jmp division



;<------------------- Multiplicacion -------------->
multiplicacion:

    mov al, [numero1]
    mov bl, [numero2]

    sub al, '0'
    sub bl, '0'
    mul bl
    add al, '0'
    mov [resul], al
   
    presentar resultado, len_r

    presentar resul, 2
    
    presentar espacio, len_es

    jmp restar

;<------------------- Division -------------->
division:

    mov al, [numero1]
    mov bl, [numero2]

    sub al, '0'
    sub bl, '0'

    div bl
    
    add al, '0'
    add ah, '0'
    
    mov [cociente], al  
    mov [residuo], ah

    presentar resultado, len_r
 
    presentar residuo, 1

    presentar espacio, len_es

    presentar cocien, len_c

    presentar cociente, 1
   
    presentar espacio, len_es

    jmp suma

;<------------------------ salir --------------------------------->    
salir:
    mov eax, 1
    mov ebx, 0
    int 80H
