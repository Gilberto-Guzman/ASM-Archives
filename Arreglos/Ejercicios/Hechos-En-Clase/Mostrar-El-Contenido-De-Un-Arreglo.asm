.model small
.stack 64
.data
    numero db 0,1,2,3,4,5,6,7,8,9,10
    espacio db " $"
.code

inicio proc
    mov ax,@data
    mov ds,ax

        mov cl, 0
        mov di, 0

        ciclo:
            mov dl, numero[di]
            add dl, 30h
            mov ah, 02h
            int 21h

            mov dx, offset espacio
            mov ah, 09h
            int 21h
            ;di, si, bx, bl recorre el arreglo
            inc di
            ;i++
            inc cl

        cmp cl, 10
        
        ;if ; ja = mayor que jb = menor que
        je fin
        ;else
        jne ciclo

        fin:
            mov ax,04c00h
            int 21h

    inicio endp
end inicio