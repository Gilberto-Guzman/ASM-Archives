;---ETIQUETAS PRINCIPALES---
.model small 
.stack 64
.data    

;---MENSAJES---
    Mensaje_1 db 10,13,"Ingresa un numero: $"
    Mensaje_Numero_Par db 10,13,"Es Par...$"
    Mensaje_Numero_Impar db 10,13,"Es Impar...$"

.code  

main proc

    mov ax,@data
    mov ds,ax

    lea dx,Mensaje_1
    mov ah,9
    int 21h

       

    mov ah,1
    int 21h

    mov bl,2
    div bl      

    cmp ah,0  

    je Numero_Par  

    lea dx,Mensaje_Numero_Impar
    mov ah,9
    int 21h

    mov ah,4ch

    int 21h    

    Numero_Par:   

    lea dx,Mensaje_Numero_Par
    mov ah,9
    int 21h 


    mov ax , 04c00h
    int 21h
main endp
end main