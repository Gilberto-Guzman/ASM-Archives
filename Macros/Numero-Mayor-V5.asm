verificarMayor macro numero1, numero2, resultadoMayor
    mov al, numero1
    mov bl, numero2

    cmp al, bl
    ja salir
    mov al, bl

    salir:
        mov resultadoMayor, al
endm

.model small
.stack 64
.data
    msg db 10,13,13,"El numero mayor es: $", 10, 13
    num1 db 6
    num2 db 8
    mayor db 0
.code
    inicio proc
        
        mov ax, @data
        mov ds, ax

        verificarMayor num1, num2, mayor

        call mensaje

        mov ax, 04c00h
        int 21h

    inicio endp


    mensaje proc

        ;Imprime el mayor de los numeros
        mov dx, offset msg
        mov ah, 09h
        int 21h

        ;Imprime el resultado
        mov al, mayor
        mov dl, al
        add dl, 30h
        mov ah, 02h
        int 21h

        ret
    mensaje endp
end inicio