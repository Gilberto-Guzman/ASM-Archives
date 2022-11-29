; https://stackoverflow.com/questions/1123396/assembly-to-compare-two-numbers

; cmp BL, BH
; je EQUAL       ; BL = BH
; jg GREATER     ; BL > BH
; jmp LESS       ; BL < BH
; in this case it compares two 8bit numbers that we temporarily store in the higher and the lower part of the register B. Alternatively you might also consider using jbe (if BL <= BH) or jge/jae (if BL >= BH).



;---ETIQUETAS PRINCIPALES---
.model small 
.stack 64
.data

;---MENSAJES---
Mensaje_1 db "Ingresa un numero: $"
Mensaje_2 db "Resultado = $"
Salto_De_Linea db 10, 13, "$"
;---VARIABLES---
Numero db ?

.code   
    ;Inicializar variables
    inicio proc
        mov ax , @data  
        mov ds , ax     

        mov dx, offset Mensaje_1
        mov ah , 09h
        int 21h
    
		mov ah, 01h
		int 21h
		sub al, 30h
        mov Numero, al

        mov dx, offset Salto_De_Linea
        mov ah , 09h
        int 21h

     TEST AL, 01H                 ; check the digit for even or odd
     JNE par

        par:
            mov dl, Numero
            add dl, 30h
            mov ah, 02h
            int 21h
    jmp exit


    exit: 
    ;Finalizar programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio