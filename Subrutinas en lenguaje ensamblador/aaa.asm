;AGREGAR ARREGLO O PEDIR 10 NUMEROS
;CONTADOR NUMERO PAR E IMPAR

;ETIQUETAS PRINCIPALES
    .model small 
    .stack 64
    .data    
;MENSAJES
    Mensaje_1 db 10,13,"Ingresa un numero: $"
    Mensaje_Numero_Par db 10,13,"El numero ingresado es --> PAR! $"
    Mensaje_Numero_Impar db 10,13,"El numero ingresado es --> IMPAR! $"

;APERTURA DEL PROGRAMA
    .code  

        .startup
            ;IMPORTAMOS LOS MENSAJES
                mov ax,@data
                mov ds,ax
               
                mov cl, 0
                mov di, 0

            ;LLAMAMOS A NUESTRAS SUBRUTINAS
              
            ciclo:
                call Cachar_Numero            

                call Evaluar_Numero
        .exit
        
        ;SUBRUTINA 1
            Cachar_Numero proc near
                lea dx,Mensaje_1
                mov ah,9
                int 21h
            Cachar_Numero endp
        
        ;SUBRUTINA 2
            Evaluar_Numero proc 
                
                ;METODO QUE DETERMINA SI UN UMERO ES PAR O IMPAR
                    mov ah,1
                    int 21h

                    mov bl,2
                    div bl      

                    cmp ah,0

                ;Switch Numeros pares e impares
                    ;case
                    je Numero_Par  
                    ;default
                    jmp Numero_Impar

                ;OPCION 1
                    Numero_Impar:
                        lea dx,Mensaje_Numero_Impar
                        mov ah,9
                        int 21h

                        mov ah,4ch
                        int 21h 

                        inc di
                        cmp di, 10
                        je fin
                        jne ciclo
                
                ;OPCION POR DEFECTO
                    Numero_Par:   
                        lea dx,Mensaje_Numero_Par
                        mov ah,9
                        int 21h 

                        inc di
                        cmp di, 10
                        je fin
                        jne ciclo

                ret
            Evaluar_Numero endp

            fin:
            mov ax,04c00h
            int 21h
    end