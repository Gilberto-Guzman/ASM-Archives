

	;  programa que solicita 10 números, y devuelva cuántos pares y cuántos números impares hay


.model small
.stack 64
.data
	numero db 0,0,0,0,0,0,0,0,0,0 ;Arreglo (8 bits)
	msg db 10,13, "Ingrese el numero $"
	msg2 db ": $"
	espacio db " $"
	; varpar db 0
	; varimpar db 0
	;variables de par e impar
	division db ?
	multiplicacion db ?
	residuo db ?
	cantidad_pares db 0
	cantidad_impares db 0 
	
	msgpar db 10,13, "El total de numeros pares es: $"
	msgimpar db 10,13, "El total de numeros impares es: $"
.code
	.startup
        mov ah, 0fh							;Limpiar pantalla
        int 10h
        mov ah, 0h
        int 10h

        call capturar
        mov ah, 07h
        int 21h

        mov ax, 04c00h
        int 21h

    .exit
	;primer subrutina
	;imprime mensaje
    capturar proc near
		mov ax, @data	
		mov ds, ax

			mov cl, 0 							; registro contador
			mov di, 0							; 
			
			arreglo:
				lea dx, msg
				mov ah, 09h						; 
				int 21h							; 
				
				mov dl, cl 						; imprime el numero
				add dl, 30h						;
				mov ah, 02h						;
				int 21h							;
	
				mov dx,offset msg2				; Imprimir mensaje
				mov ah, 09h						; 
				int 21h							;
				
				mov ah, 01h						; Capturar Valor
				int 21h							;
				sub al, 30h						;
				mov numero[di], al				;
				
				inc cl							; incrementar el contador
				inc di							; 

				mov bl, numero[di]				; c	
				cmp cl, 10						; compara
			jb arreglo
			call metodo
        ret
    capturar endp

metodo proc near
		mov cl, 0
		mov di, 0
	
	pares:
		mov al, numero[di]
		mov bl, 2
		div bl
		mov division, al
		
		xor ah, ah
		mov al, division
		mov bl, 2
		mul bl
		mov multiplicacion, al
        
				
		xor ah, ah
		mov al, multiplicacion
		mov bl, numero[di]
		sub bl, al
		mov residuo, bl
		
		cmp residuo, 0
		je par
		jne continuar
		par:
			inc cantidad_pares
		continuar:
			inc di
			inc cl
		cmp cl, 10
	jb pares

		mov cl, 0
		mov di, 0
		impares:
			mov al, numero[di]
			mov bl, 2
			div bl
			mov division, al
			
			xor ah, ah
			mov al, division
			mov bl, 2
			mul bl
			mov multiplicacion, al
					
			xor ah, ah
			mov al, multiplicacion
			mov bl, numero[di]
			sub bl, al
			mov residuo, bl
			
			cmp residuo, 0
			je seguir
			jne impar
			impar:
				inc cantidad_impares
			seguir:
				inc di
				inc cl
		cmp cl, 10
		jb impares
		jnb final

		final:
		mov dx, offset msgpar
		mov ah, 09h
		int 21h

		mov dl, cantidad_pares
		add dl, 30h
		mov ah, 02h
		int 21h

		mov dx, offset msgimpar
		mov ah, 09h
		int 21h

		mov dl, cantidad_impares
		add dl, 30h
		mov ah, 02h
		int 21h
		ret
	metodo endp
end