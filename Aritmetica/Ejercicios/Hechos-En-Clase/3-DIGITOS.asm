;Resolución del ejercicio A
.model small 
.stack 64
.data

msg db "(4 * 2) / (2 + 2) = $"
num4 db 4

.code   
    inicio proc
        mov ax , @data  
        mov ds , ax

            mov dx, offset msg
            mov ah , 09h
            int 21h

            ;---VARIABLES---
            mov al, 4 
            mov bl, 2
            mov cl, 2
            mov dl, num4

            ;---PROCESO---

            ;Multiplicamos (4 * 2) <--> ( al * bl ) TODO SE ALAMACENA EN AL
            mul bl ;   ;al = 118
            aam  ;ah = 11  al = 8
            mov bx, ax
            mov num4, al
            mov al, bh
            aam ;ah = 1  al = 1
            mov bx, ax
            
            
            ;---RESULTADOS---

            mov dl, bh    
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 30h
            mov ah , 02h
            int 21h

        

            mov dl, bl  
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 30h
            mov ah , 02h
            int 21h

            mov dl, num4  
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 30h
            mov ah , 02h
            int 21h
    
    ;Finalizamos el programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio