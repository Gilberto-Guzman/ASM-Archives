;Operaciones aritmeticas MULTIPLICACION

.model small 
.stack 64
.data

msg db "La multiplicacion es: $"


.code   
    ;Inicializar variables
    inicio proc
        mov ax , @data  
        mov ds , ax

            mov dx, offset msg
            mov ah , 09h
            int 21h

            ;Limpiamos el registro acumulador
            xor ax, ax
            ;N1 y N2
            mov al, 10
            mov bl, 10
            mov dl, 0
            ;Multiplicamos
            mul bl

                ;al = 18 -> amm => ah <- 10, al <- 0
            aam ;al = 18 -> amm => ah <- 1, al <- 8
            
            mov bx, ax ; bh = 10 , bl = 0
            mov cl, bl
            mov al, bh
            aam
            mov bx, ax
            ;mov bh, ah
            ;mov bl, al

            mov dl, bh
            add dl, 30h
            mov ah , 02h
            int 21h

            mov dl, bl
            add dl, 30h
            mov ah , 02h
            int 21h

            mov dl, cl
            add dl, 30h
            mov ah , 02h
            int 21h

    ;Finalizar programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio