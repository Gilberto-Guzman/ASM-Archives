;Ejercicio 10 
    ;Elaborar un programa que contenga un arreglo de 10 números, imprimir
    ;en pantalla cuántos números 2 hay y realizar la multiplicación de esos
    ;números 2

    ;Ejemplo:
        ;numero[1,2,3,4,2,5,3,1,5,2].
    ;Salida:
        ;Mensaje1: hay 3 números 2 en el arreglo.
        ;Mensaje2: el resultado es de la multiplicación de los números 2 es: 8



.model small
.stack 64
.data
	arreglo db 2,2,2,3,4,4,2,2,4,5
	msg1 db "Mensaje1: Numeros 2 en el arreglo: $"
	msg2 db "Mensaje2: El resultado de la multiplicacion de los numeros 2 es: $"
	salto db 10, 13, "$"
	numero db ?
    numero2 db ?
	repetidos db 0
.code
	inicio proc
		mov ax, @data
		mov ds,ax
		
			mov numero, 2
			
			mov cl, 0
			mov di, 0
			
			ciclo:
				mov bl, arreglo[di] ;arreglo[1,1,2,3,4,4,5,6,4,5]
				cmp bl, numero
				je suma
				jne continuar
				
				;if (bl == numero) {repetidos++}
				;i++|
				suma:
					inc repetidos
				
				continuar:
					inc cl
					inc di
			cmp cl, 10
			jb ciclo
			jnb multi
			

            multi:    
            mov al, 1
        	mov cl, 0
            cmp cl, 0
            jb ciclo2

            ciclo2:
                mul numero

                mov numero2,al
                inc cl

                cmp cl, repetidos
                jb ciclo2
                jnb salir


			salir:	
				mov dx,offset msg1
				mov ah, 09h
				int 21h

				mov dl, repetidos
				add dl, 30h
				mov ah, 02h
				int 21h

				mov dx,offset salto
				mov ah, 09h
				int 21h

                mov dx,offset msg2
				mov ah, 09h
				int 21h

            xor ax, ax
            mov al,numero2
            mov bl,numero
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

                ;mov dl, numero2
				;add dl, 30h
				;mov ah, 02h
				;int 21h
			
		mov ax, 04c00h
		int 21h
	inicio endp
end inicio