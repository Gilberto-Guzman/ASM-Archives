.model small
.stack 64

.data
	espacio db " $"
.code
	mov ax,@data
	mov ds,ax
	




mov ah,4ch
int 21h
end