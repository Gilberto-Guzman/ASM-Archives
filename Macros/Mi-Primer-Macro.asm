;===== MACRO DEFINICION

;NOMBREMACRO MACRO PARAMETRO1, PARAMETRO2, ... PARAMETRON
    ;INTRUCCIONES A REALIZAR
;ENDM

imprimir macro mensaje
    mov ah, 09h
    int 21h
endm

.model small
.stack 64
.data
    msg1 db "Hola mundo, Mi nombre es Gilberto", 10, 13, "$"
    msg2 db "Hola Gilberto $"
.code
    inicio proc

        mov ax, @data
        ;Vamos a mover lo que tenga el segmento de datos a ax
        mov ds, ax

        mov dx, offset msg1
        imprimir dx

        mov dx, offset msg2
        imprimir dx
        

        mov ax, 04c00h
        int 21h

    inicio endp
end inicio