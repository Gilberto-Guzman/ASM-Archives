.model small
.stack 64
.data
    msg db 10,13,13,"El numero mayor es: $", 10, 13
    num1 dw 6
    num2 dw 8
    mayor db 0
.code
    inicio proc
        
        mov ax, @data
        mov ds, ax

            push num1
            push num2 

            call mayorNumero
            mov mayor, al
            call mensaje


        mov ax, 04c00h
        int 21h

    inicio endp

    mayorNumero proc

        push bp
        mov bp, sp

        mov al, ss:[bp + 4]
        mov bl, ss:[bp + 6]

        cmp al, bl
        ja salir

        mov al, bl
        
        salir:
            pop bp
            ret 4
    mayorNumero endp

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