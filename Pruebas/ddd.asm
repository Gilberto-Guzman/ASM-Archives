;---ETIQUETAS PRINCIPALES---
.model small 
.stack 64
.data    

;---MENSAJES---
    Mensaje_1 db 10,13,"Ingresa un numero: $"
    Mensaje_Numero_Par db 10,13,"Es Par...$"
    Mensaje_Numero_Impar db 10,13,"Es Impar...$"

.code  

    .startup

        mov ax,@data
        mov ds,ax

        lea dx,Mensaje_1
        mov ah,9
        int 21h

        call Evaluar_Numero

        
    .exit
    
    Evaluar_Numero proc near
        
        mov ah,1
        int 21h

        mov bl,2
        div bl      

        cmp ah,0


        jmp Numero_Impar
        je Numero_Par  

        Numero_Impar:

        lea dx,Mensaje_Numero_Impar
        mov ah,9
        int 21h

        mov ah,4ch
        int 21h 


        Numero_Par:   

        lea dx,Mensaje_Numero_Par
        mov ah,9
        int 21h 


        ret
    Evaluar_Numero endp

end