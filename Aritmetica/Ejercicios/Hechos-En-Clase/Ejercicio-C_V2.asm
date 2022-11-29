;Resolución del ejercicio C
.model small 
.stack 64
.data

msg db "((30 + 10) (3 * 2))/ 2 = $"
num db 2

.code
    inicio proc
        mov ax , @data
        mov ds , ax

            mov dx, offset msg
            mov ah , 09h
            int 21h

            ;---VARIABLES---
            mov al, 3
            mov bl, 2
            mov cl, 30
            mov dl, 10
			mov dl, num

            ;---PROCESO---

            ;Multiplicamos TODO SE ALAMACENA EN AL
            mul bl
            mov bx, ax 
   
			;SUMA
			add cl,dl
			
			
			;multiplicar
			mul cl
			mov bx,cx
			
			add cl,num
			mov bx,cx
			
			;division
			div bl
			mov ax,bx
			
			
		
			
            ;---RESULTADOS---

            mov dl, bh
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 31h
            mov ah , 02h
            int 21h



            mov dl, bl
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 10h
            mov ah , 02h
            int 21h

             mov dl, num
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 46
            mov ah , 02h
            int 21h

    ;Finalizamos el programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio