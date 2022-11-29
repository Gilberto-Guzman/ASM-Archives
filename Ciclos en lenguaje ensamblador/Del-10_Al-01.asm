.model small
.stack 64

.data
	espacio db " $"
.code
	mov ax,@data
	mov ds,ax
	
	;cx, ch y cl
	mov cl, 10
	ciclo:
		mov al, cl
		aam; ah, al
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
	loop ciclo

mov ah,4ch
int 21h
end