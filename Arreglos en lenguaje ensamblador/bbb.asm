;Ejercicio 20 
    ;Elabora un programa que solicite un número y realice su tabla de multiplicar
    ;ej. Numero ingresado: 2
    ;2 * 1 = 2
    ;2 * 2 = 4
    ;2 * 3 = 6
    ;Nota:
    ;........
    ;2 * 10 = 20




.model small
.stack 64
.data
	msg1 db "Numero ingresado: $"
	msg2 db " $"
    msg3 db " * $"
    msg4 db " = $"
	salto db 10, 13, "$"
	contador db ?
    numero db ?
    numeroMul db ?

.code
	inicio proc
		mov ax, @data
		mov ds,ax
		
		mov dx,offset msg1
		mov ah, 09h
		int 21h
			
		mov ah, 01h
		int 21h
		sub al, 30h
		mov numero, al

        mov contador,0

            ciclo:
            inc contador
            mov al,contador
            mul numero
            mov numeroMul,al

                mov dx,offset salto
				mov ah, 09h
				int 21h

				mov dl, numero
				add dl, 30h
				mov ah, 02h
				int 21h




                mov dx,offset msg3
				mov ah, 09h
				int 21h

                ;mov dl, contador
				;add dl, 30h
				;mov ah, 02h
				;int 21h

            xor ax, ax
            mov al,contador
            mov bl,contador
            aam
            mov bx, ax
            mov cl, bl
            mov al, bh
            aam
            mov bx, ax

            ;mov dl, bh
            ;add dl, 30h
            ;mov ah , 02h
            ;int 21h

            mov dl, bl
            add dl, 30h
            mov ah , 02h
            int 21h

            mov dl, cl
            add dl, 30h
            mov ah , 02h
            int 21h





                mov dx,offset msg4
				mov ah, 09h
				int 21h
        
                ;mov dl, numeroMul
				;add dl, 30h
				;mov ah, 02h
				;int 21h

            xor ax, ax
            mov al,numeroMul
            mov bl,contador
            aam
            mov bx, ax
            mov cl, bl
            mov al, bh
            aam
            mov bx, ax

            mov dl, bh
            add dl, 30h
            mov ah , 02h
            int 21h

            mov dl, bl
            add dl, 30h
            mov ah , 02h
            int 21h

            mov dl, cl
            add dl, 30h
            mov ah , 02h
            int 21h

            cmp contador, 10
            jb ciclo
			jnb fin

            

		fin:	
            mov ax, 04c00h
            int 21h
	inicio endp
end inicio