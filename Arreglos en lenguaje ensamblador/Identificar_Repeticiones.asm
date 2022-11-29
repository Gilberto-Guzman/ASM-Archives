.model small
.stack 64
.data
	arreglo db 1,1,2,3,4,4,5,6,4,5
	msg1 db "Ingrese el numero a comprobar: $"
	msg2 db "El numero ingresado se repite en el arreglo: $"
	salto db 10, 13, "$"
	numero db ?
	repetidos db 0
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
			
			mov cl, 0
			mov di, 0
			
			ciclo:
				mov bl, arreglo[di] ;arreglo[1,1,2,3,4,4,5,6,9,5]
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
			jnb salir
			
			salir:
				mov dx,offset salto
				mov ah, 09h
				int 21h
				
				mov dx,offset msg2
				mov ah, 09h
				int 21h
				
				mov dl, repetidos
				add dl, 30h
				mov ah, 02h
				int 21h
			
		mov ax, 04c00h
		int 21h
	inicio endp
end inicio