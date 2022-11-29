.model small 
.stack 64
.data

msg db " = $"


.code   
    inicio proc
        mov ax , @data  
        mov ds , ax

        mov dx, offset msg
        mov ah , 09h
        int 21h

        mov al, 2
        mov bl,  3
        mul bl ;al = 3
        mov bl, 3 

        add al, bl ; al = 9

        ;---RESULTADOS---

        mov dl, al    
        ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
        add dl, 30h
        mov ah , 02h
        int 21h
    
    ;Finalizamos el programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio