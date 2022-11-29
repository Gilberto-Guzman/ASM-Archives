;Operaciones aritmeticas DIVISION
.model small 
.stack 64
.data

msg db "La division es: $"


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
            mov al, 4
            mov bl, 2
            mov dl, 0
            ;Dividimos
            div bl
            mov dl, al

            add dl, 30h
            mov ah , 02h
            int 21h
    
    ;Finalizar programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio