.model small 
.stack 64
.data

msg db "Hola mundo, Mi nombre es Gilberto", 10, 13, "$"


.code   
    ;Inicializar variables
    inicio proc
        mov ax , @data  
        mov ds , ax     

            mov dx, offset msg
            mov ah , 09h
            int 21h
    
    ;Finalizar programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio