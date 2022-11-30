.model small
.stack 64
.data
    numero1 db 2
    numero2 db 5
.code
    .startup
        mov ax,@data
        mov ds, ax

        mov al,numero1
        mov bl,numero2

        call elMayor

        mov dl, al
        add dl, 30h
        mov ah, 02h
        int 21h
        
        mov ax, 04c00h
        int 21h
    .exit

    elMayor proc near
        cmp al,bl
        ;if (al > bl) 
        ja seguir

        mov al, bl ; al <- 5

        seguir:
            ret
    elMayor endp
end