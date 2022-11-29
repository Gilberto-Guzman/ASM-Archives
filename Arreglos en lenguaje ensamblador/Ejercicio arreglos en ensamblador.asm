; Jose Gilberto Guzman Gutierrez 
; Fernando de Jesús Sánchez Arias
.model small
.stack 64
.data
    Arreglo_Numeros db 2,2,4,5,7,8,9,5,9,2
    msg_IngresarNumeros db 'Ingresa un numero: $'
    msg_Arreglo db 10,13,'Arreglo Original: $'
    msg_NumerosRepetidos db 10,13,'El numero que digito el usuario se repite : $'
    msg_Espacio db " $"
.code

inicio proc
    mov ax,@data
    mov ds,ax
        
        lea dx, msg_IngresarNumeros 
        mov ah,9
        int 21h

        mov ah,1
        int 21h
        mov bl,al

        mov cl, 0
        mov di, 0

        lea dx, msg_Arreglo
        mov ah,9
        int 21h

        ciclo:
            mov dl, Arreglo_Numeros[di]
            add dl, 30h
            mov ah, 02h
            int 21h


            mov dx, offset msg_Espacio
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