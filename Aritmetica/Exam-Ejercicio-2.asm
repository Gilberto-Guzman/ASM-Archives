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

        mov al, 5
        mov bl, 2
        mul bl ; al = 10

        mov bh, al
        mov al, 10
        mov bl, 5
        sub al, bl ; al = 5

        mov bl, al ;bl = 5
        xor ax, ax
        mov al, bh ;al = 10
        mov dl, 0

        div bl ; al = 2

        mov bl, 6
        add al,bl; al = 8


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