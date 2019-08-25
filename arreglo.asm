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
msg1 db "ingrese cinco numero de uno en uno y precione enter: "
len1 equ $-msg1

espacio db " ", 0xA
len_e equ $-espacio

msg3 db "el numero mayor es:"
len3 equ $-msg3

arre db 0,0,0,0,0 
la equ $-arre

segment .bss
num resb 2
segment .text
    
    global _start

_start:

    presentar msg1, len1
    presentar espacio, len_e

    mov esi, arre ;nos permite almacenar informacion 
    mov edi, 0    ;valor de control de nuestro arreglo

lee:
    ing_teclado num, 2
    
    mov al, [num]
    sub al, '0'

    mov [esi], al ;coloca el valor q yo igreso como contenido de arre
    
    add esi, 1
    add edi, 1

    cmp edi, la
    jb lee

    mov ecx, 0
    mov bl, 0

comparador:
    mov al, [arre + ecx]
    cmp al, bl
    jb contador
    mov bl, al

contador:    
    inc ecx
    cmp ecx, la
    jb comparador

resultado:
    add bl, '0'
    mov [num], bl

    presentar msg3, len3
    presentar espacio, len_e
    presentar num, 2



salir:
    mov eax, 1
    int 80h
