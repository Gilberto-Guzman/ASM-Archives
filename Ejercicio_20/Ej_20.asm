;ETIQUETAS PRINCIPALES
.model small
.stack 64

.data
    ;MENSAJES
    Mensaje_1 db "Numero ingresado: $"
    Mensaje_Simbolo_Asterisco db " * $"
    Mensaje_Simbolo_Igual db " = $"
    Salto_De_Linea db 10,13, "$"

    ;VARIABLES
    Contador db ?
    Numero_A_Multiplicar db ?
    Numero_Multiplicado db ?

;APERTURA DEL PROGRAMA
    .code
        inicio proc
            mov ax, @data
            mov ds,ax

;OBTENEMOS LOS DATOS DEL USUARIO
        mov dx, offset Mensaje_1
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h
        sub al, 30h
        mov Numero_A_Multiplicar, al

    mov Contador, 0

Ciclo_Principal:
    inc Contador
    mov al, Contador
    mul Numero_A_Multiplicar
    mov Numero_Multiplicado, al

    mov dx,offset Salto_De_Linea
    mov ah, 09h
    int 21h

    mov dl, Numero_A_Multiplicar
    add dl, 30h
    mov ah, 02h
    int 21h 

    mov dx, offset Mensaje_Simbolo_Asterisco
    mov ah, 09h
    int 21h

;CONVERSION DE VALORES A 2 DIGITOS => 00
    xor ax,ax
    mov al,Contador
    aam
    mov bx, ax
    mov cl, bl
    mov al, bh
    aam
    mov bx, ax

    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

mov dx, offset Mensaje_Simbolo_Igual
mov ah, 09h
int 21h

;CONVERSION DE VALORES A 3 DIGITOS => 000
    xor ax,ax
    mov al,Numero_Multiplicado
    aam
    mov bx, ax
    mov cl,bl
    mov al, bh
    aam
    mov bx, ax

    mov dl, bh
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, cl  
    add dl,30h
    mov ah, 02h
    int 21h

;CONDICIONALES
    ;if (Contador != 10) {Return Ciclo_Principal}
    cmp Contador, 10
    jb Ciclo_Principal
    ;else {Return Finalizar_El_Programa}
    jnb Finalizar_El_Programa

;CIERRE DEL PROGRAMA
    Finalizar_El_Programa:
            mov ax, 04c00h
            int 21h
        inicio endp
    end inicio