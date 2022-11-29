.model small
.stack 64

.data
	espacio db " $"
	msjMayorAL db "El registro AL es mayor ", 10, 13, "$"
	msjMayorBL db "El registro BL es mayor ", 10, 13, "$"
	msjIgual db "Los registros AL y BL son iguales ", 10, 13, "$"
.code
	mov ax,@data
	mov ds,ax
	
	mov al, 0
	mov bl, 1
	cmp al, bl
	ja mayor1
	je igual
	jna mayor2
	
	mayor1:
		mov dx, offset msjMayorAL
		mov ah, 09h
		int 21h
		
		mov dl, al
		add dl, 30h
		mov ah, 02h
		int 21h
		jmp salir
		
	mayor2:
		mov dx, offset msjMayorBL
		mov ah, 09h
		int 21h
		
		mov dl, bl
		add dl, 30h
		mov ah, 02h
		int 21h
		jmp salir
	
	igual:
		mov dx, offset msjIgual
		mov ah, 09h
		int 21h
		
		mov dl, bl
		add dl, 30h
		mov ah, 02h
		int 21h
		
	salir:
		mov ah,4ch
		int 21h
end