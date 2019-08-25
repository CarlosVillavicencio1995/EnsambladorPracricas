%macro presentar 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h
%endmacro

%macro ing_teclado 2
mov eax, 3
mov ebx, 0
mov ecx, %1
mov edx, %2
int 80h
%endmacro

segment .data
msg1 db "presente la serie de los 5 primero fibonacci "
len1 equ $-msg1

espacio db " ", 0xA
len_e equ $-espacio

msg3 db "la serie es:"
len3 equ $-msg3

arre db 0,0,0,0,0,0,0,0,0
la equ $-arre

segment .bss
num resb 3
segment .text
    
    global _start

_start:
    presentar msg1, len1
    presentar espacio, len_e
    mov ecx, 9
    mov eax, 0
    mov ebx, 0
    mov edx, 1
    mov esi, arre ;nos permite almacenar informacion 
    mov edi, 0    ;valor de control de nuestro arreglo
fib:
    
    push ecx
    mov eax, ebx
    mov ebx, edx
    add edx, eax
    add eax, '0'
    mov [esi], eax ;coloca el valor q yo igreso como contenido de arre
    inc esi
    inc edi
    pop ecx
    loop fib
    jmp imprimir
    
imprimir:
    presentar msg3, len3
    presentar espacio, len_e
    presentar arre, la
salir:
    mov eax, 1
    int 80h