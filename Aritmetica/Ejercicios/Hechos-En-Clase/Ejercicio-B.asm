;Resolución del ejercicio B
.model small 
.stack 64
.data

msg db "(5 + 5 * 2 - 1) + 5 = $"
num db 5

.code   
    inicio proc
        mov ax , @data  
        mov ds , ax

            mov dx, offset msg
            mov ah , 09h
            int 21h

            ;---VARIABLES---
            mov al, 5
            mov bl, 2
            mov cl, 5
            mov dl, 1
			mov dl, num

            ;---PROCESO---

            ;Multiplicamos (5 * 2) <-->  TODO SE ALAMACENA EN AL
            mul bl
			mov bx,ax 
			
			
  
            ;Sumamos (10 + 5) <-->  TODO SE ALMACENA EN CL
            add cl,bl
			mov bx,cx
			
			
			
			;restamos (15 - 1) <-->  TODO SE ALMACENA EN 
			sub bl,dl
			
			
			
            

            ;Sumamos (14) + 5 = 19  <-->  TODO SE ALAMACENA EN AL
            add bl, num
			mov ax,bx


            ;---RESULTADOS---

            mov dl, ah 
            ;Agregamos el valor de 31h para poder mostrar nuestro numero decimal
            add dl, 31h
            mov ah , 02h
            int 21h
			
			mov dl, al  
            add dl, 8h
            mov ah , 02h
            int 21h
    
    ;Finalizamos el programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio