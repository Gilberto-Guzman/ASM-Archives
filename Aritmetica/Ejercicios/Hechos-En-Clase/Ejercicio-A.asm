;Resolución del ejercicio A
.model small 
.stack 64
.data

msg db "(4 * 2) / (2 + 2) = $"


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
            mov dl, 2

            ;---PROCESO---

            ;Multiplicamos (4 * 2) <--> ( al * bl ) TODO SE ALMACENA EN AL
            mul bl
  
            ;Sumamos (2 + 2) <--> (cl + dl) TODO SE ALMACENA EN CL
            add cl,dl

            ;Dividimos (4 * 2) / (2 + 2) <--> (8/4 => 2) TODO SE ALMACENA EN AL
            div cl  


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