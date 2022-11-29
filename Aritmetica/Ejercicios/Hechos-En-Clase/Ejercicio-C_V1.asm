;Resolución del ejercicio C
.model small 
.stack 64
.data

msg db "((30 + 10) (3 * 2))/ 2 = $"


;---VARIABLES GLOBALES---
N1 db 30
N2 db 10
N3 db 3
N4 db 2
N5 db 2
AUX db 0

.code   
    inicio proc
        mov ax , @data  
        mov ds , ax

            mov dx, offset msg
            mov ah , 09h
            int 21h
            
            
            ;---PROCESO---


            ;Asignamos el valor de N1 a BL   bl <-- 30
            mov bl, N1
            ;Sumamos (30 + 10) <--> (bl + N2) TODO SE ALMACENA EN BL
            add bl, N2



            ;Asignamos el valor de N3 a AL   al <-- 3
            mov al, N3
            ;Asignamos el valor de N4 a CL   cl <-- 2
            mov cl, N4          
            ;Multiplicamos (3 * 2) <--> ( al * cl ) TODO SE ALMACENA EN AL
            mul cl


            ;Multiplicamos (30 + 10) (3 * 2) <--> ( al * bl ) TODO SE ALMACENA EN AL
            mul bl

            ;Asignamos el valor de N5 a DL   dl <-- 2
            mov dl, N5
            ;dividimos (30 + 10) (3 * 2) / 2 <--> ()
            div dl


            ;---RESULTADOS---
            aam  ;ah = 12  al = 0
            mov bx, ax
            

            

            mov dl, al    
            ;Agregamos el valor de 30h para poder mostrar nuestro numero decimal
            add dl, 30h
            mov ah , 02h
            int 21h


    ;Finalizamos el programa
        mov ax , 04c00h
        int 21h
    inicio endp

end inicio