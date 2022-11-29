;AGREGAR ARREGLO O PEDIR 10 NUMEROS
;CONTADOR NUMERO PAR E IMPAR

;ETIQUETAS PRINCIPALES
    .model small 
    .stack 64
    .data    
;MENSAJES
    Mensaje_1 db 10,13,"Ingresa un numero: $"
    Mensaje_Numero_Par db 10,13,"Numeros PARES --> $"
    Mensaje_Numero_Impar db 10,13,"Numeros IMPARES --> $"
    Contador_Pares db ?
    Contador_Impares db ?
;APERTURA DEL PROGRAMA
    .code  

        .startup
            ;IMPORTAMOS LOS MENSAJES
                mov ax,@data
                mov ds,ax

            ;LLAMAMOS A NUESTRAS SUBRUTINAS
                call Cachar_Numero
                ; call Imprimir_Resultados
        .exit
        
        ;SUBRUTINA 1
            Cachar_Numero proc near

            mov cl, 0
                ciclo:

                    lea dx,Mensaje_1
                    mov ah,9
                    int 21h

                    mov ah,1
                    int 21h

                    mov bl,2
                    div bl      

                    cmp ah,0

                    je Pares                   
                    Pares:   
                        inc Contador_Pares
                    
                    jmp Impares
                    Impares:
                        inc Contador_Impares


                    inc cl
                    cmp cl, 10
                    
                    ; jb ciclo
                    je fin
                    
                    
                    ;else
                    jne ciclo
                    

            Cachar_Numero endp
    
            Imprimir_Resultados proc
                ; lea dx,Mensaje_Numero_Par
                ; mov ah,9
                ; int 21h

                ; mov dl, Contador_Pares
				; add dl, 30h
				; mov ah, 02h
				; int 21h
            Imprimir_Resultados endp
            fin:
            mov ax,04c00h
            int 21h
    end