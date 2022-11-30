;Elabora un programa en esamblador que contenga una arreglo de 10
;números, y verifica cuántos números 2 hay en el arreglo, realizar la suma e indicar si es mayor a 8
;EJEMPLO: numero [1,2,4,2,3,2,3,2,3,2];
;Mensaje1: total de números 2 son:5
;Mensaje2: la suma es:10 
;Mensaje: si es mayor a 8

.model small
.stack 64
.data


    arreglo db 1,2,4,2,3,2,3,2,3,2
    msg db 10, 10, 13,"Hay en el arreglo: $ " 
    msg1 db "total de numeros 2 son: $"
    msg2 db 10, 10, 13, "La suma es $"
    msg3 db 10,10,13, "si es mayor a 8 $"
    msg4 db 10,10,13,"No es mayor a 8 $"
    
    s db 0
    r db 0
    
    
 
.code
    comienzo proc
        mov ax,@data
        mov ds,ax
        mov dx,0

        mov cl,0
        mov di,0
        mov bl, 2

        ciclo: 
            mov al, arreglo[di]
            cmp al, bl 
            je suma
            jne return


                suma:
                    mov al, 1
                    add al,s
                    mov s, al
                    
                    mov al, arreglo[di]
                    add al,r
                    mov r, al
                    
                    inc di
                    inc cl

                    cmp cl, 10
                    je salir
                    jne ciclo
                return:
                    inc di
                    inc cl

                    cmp cl, 10
                    je salir
                    jne ciclo
                    
                
                    no: 
                        mov dx, offset msg3
                        mov ah, 09h
                        int 21h
                        call fin
                    sii:
                        mov dx, offset msg4
                        mov ah, 09h
                        int 21h
                        call fin


        salir:
                mov dx, offset msg
                mov ah, 09h
                int 21h

                mov dl, s
                add dl, 30h
                mov ah, 02h
                int 21h
                mov dx, offset msg1
                mov ah, 09h
                int 21h
                
                mov dl, bl
                add dl, 30h
                mov ah, 02h
                int 21h
                
                mov dx, offset msg2
                mov ah, 09h
                int 21h

                mov al, r
                aam
                mov bx, ax

                mov dl,bh
                add dl,30h
                mov ah,02h
                int 21h

                mov dl,bl
                add dl,30h
                mov ah,02h
                int 21h
                
                cmp r, 8
                jne n
                je y
                y:
                call sii
                n:
                call no
   
            fin:
            mov ax,04c00h
            int 21h
    comienzo endp
end comienzo