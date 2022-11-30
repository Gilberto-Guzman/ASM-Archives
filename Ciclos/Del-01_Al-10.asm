.model small
.stack 64

.data
	espacio db " $"
.code
	mov ax,@data
	mov ds,ax
	
	;cx, ch y cl
	mov cl, 1
	ciclo:
		mov al, cl
		aam
		mov bx, ax
		
		mov dl, bh
		add dl, 30h
		mov ah, 02h
		int 21h
		
		mov dl, bl
		add dl, 30h
		mov ah, 02h
		int 21h
		
		mov dx, offset espacio
		mov ah, 09h
		int 21h
		
		inc cl
		cmp cl, 11
		je fin
		jne ciclo
	loop ciclo
	
	fin:
	mov ah,4ch
	int 21h
end