%macro escribe 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

segment .data

msg db "leyendo desde un archivo :",0xA
len equ $-msg
Msg1 db " ",0xA,0xD
lenMsg1 equ $ - Msg1
archivo db "/home/alejandro/Escritorio/Practica/archivo.txt",0

segment .bss

texto resb 40
idarchivo resd 1

segment .text

    global _start

_start:



mov eax, 5
mov ebx, archivo
mov ecx, 0
mov edx, 0
int 0x80

test eax, eax
jz salir
mov dword[idarchivo], eax

escribe msg, len


mov eax, 3
mov ebx, [idarchivo]
mov ecx, texto
mov edx, 40
int 0x80

escribe texto, 40

mov eax, 6
mov ebx, [idarchivo]
mov ecx, 0
mov edx, 0
int 0x80

escribe Msg1, lenMsg1


salir:
 mov eax, 1
 xor ebx, ebx
 int 0x80