;Operaciones aritmeticas SUMA
.model small 
.stack 64
.data

msg db "La suma es: $"


.code   
    ;Inicializar variables
    inicio proc
        mov ax , @data  
        mov ds , ax

            mov dx, offset msg
            mov ah , 09h
            int 21h

            ;N1 y N2
            mov al, 4
            mov bl, 3

            ;Sumamos
            add al, bl 
            mov dl, al    

            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 30h
            mov ah , 02h
            int 21h
    
    ;Finalizar programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio