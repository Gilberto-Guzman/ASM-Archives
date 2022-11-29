.model small
.stack 64
.data
    msg db "Hola Mundo $"
.code
    .startup

        ;Limpiar pantalla
        mov ah, 0fh
        int 10h
        mov ah, 0h
        int 10h

        call imprimir
        mov ah, 07h
        int 21h

        mov ax, 04c00h
        int 21h

    .exit

    ;El codigo esta en el mismo documento
    imprimir proc near
        
        lea dx, msg
        mov ah, 09h
        int 21h

        ret
    imprimir endp
end