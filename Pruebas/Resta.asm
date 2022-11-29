;Operaciones aritmeticas RESTA
.model small 
.stack 64
.data

msg db "La resta es: $"


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

            ;Restamos
            sub al, bl 
            mov dl, al    

            add dl, 30h
            mov ah , 02h
            int 21h
    
    ;Finalizar programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio