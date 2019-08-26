%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro abrir 2
	mov eax,5
	mov ebx,%1
	mov ecx,%2
	mov edx,0
	int 80h
%endmacro

%macro lee 2
	mov eax,3
	mov ebx,%1
	mov ecx,%2
	mov edx,25
	int 80h
%endmacro


section .data
    mensajes db "la resta es ="
    len equ $- mensajes
	mensaje db "Leer un archivo en el disco duro",10
	len_mensaje equ $-mensaje
	archivo db "/home/alejandro/Escritorio/Pract_Ensam/archivo.txt", 0
	archivo2 db "/home/alejandro/Escritorio/Pract_Ensam/archivo2.txt", 0
 	espacio db "",10
    resta db '  '
	len_espacio equ $-espacio
section .bss
	texto resb 25 ;Almacenara el contenido del archivo
   	texto2 resb 25 ;Almacenara el contenido del archivo

	idarchivo resb 1 ;El identificador que se obtiene del archivo, es el archivo fisico
    idarchivo2 resb 1 ;El identificador que se obtiene del archivo, es el archivo fisico

section .text
	global _start
	
_start:

archivo_1:
    abrir archivo, 0
		
	test eax,eax  ; se testeta por q tiene el identificador

	jz salir	
		
	
	mov dword[idarchivo], eax
	escribir mensaje, len_mensaje
	
	lee [idarchivo], texto
	
	
	escribir texto, 25
	
	mov eax, 6
	mov ebx, [idarchivo]
	mov ecx, 0
	mov edx, 0 
	int 80h

	escribir espacio, len_espacio

archivo_2:
    
    abrir archivo2, 0
		
	test eax,eax  ; se testeta por q tiene el identificador

	jz salir	
		
	
	mov dword[idarchivo2], eax
	

    lee [idarchivo2], texto2

	
	escribir texto2, 25
	
	mov eax, 6
	mov ebx, [idarchivo2]
	mov ecx, 0
	mov edx, 0 
	int 80h

    mov ecx, 2  ; numero de digitos de cada operando
    mov esi, 1  ; index source
    clc         ; permite poner la bandera del carry en 0

ciclo_resta: 
    mov al, [texto + esi] ; al ser cadena se empieza con 0
    sub al, [texto2 + esi] ; 
    aaa                ; 
    pushf              ; guarda estado de todas las banderas

    or al, 30h         ; es similar a sub al,'0'

    popf               ; restaura el estado de las banderas

    mov [resta + esi], al 
    dec esi
    loop ciclo_resta 
    escribir mensajes, len
    escribir resta, 2

	
salir: 
	mov eax,1
	mov ebx,0
	int 80h
