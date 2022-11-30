.model small
.stack 64
.data
    numero1 dw 2
    numero2 dw 5
.code
    .startup
        mov ax,@data
        mov ds, ax

        push numero1
        push numero2

        call elMayor

        mov dl, al
        add dl, 30h
        mov ah, 02h
        int 21h
        
        mov ax, 04c00h
        int 21h
    .exit

    elMayor proc near

        push bp
        mov bp, sp

        mov al, ss:[bp+4]
        mov bl, ss:[bp+6]

        cmp al,bl
        ;if (al > bl) 
        ja seguir

        mov al, bl ; al <- 5

        seguir:
            pop bp
                ret 4

    elMayor endp
end