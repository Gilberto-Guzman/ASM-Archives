.model small
.stack 100h
.386
.data
;---MENSAJES---
    msg_Menu db 10, 13,'Menu', 10, 13, '$'
    msg_Suma db '   1. Suma $'
    msg_Resta db 10,13,'   2. Resta $'
    msg_Op_Multiplicacion db 10,13,'   3. Multiplicacion $'
    msg_Op_Division db 10,13,'   4. Division $'
    msg_Solicitar db 10,13,'   5. Solicitar nuevo numero $'
    msg_Salir db 10,13,'   6. Salir $'
    msg_Opcion db 10,13,'   Escoge una opcion: $'
    msg_PrimerNumero db 10,13,10,13,'Ingresa el primer numero: $'
    msg_SegundoNumero db 10,13,'Ingresa el segundo numero: $'
    msg_Resultado db 10,13,10,13,'El resultado es: $'
    msg_CerrarPrograma db 10,13,10,13,'Cerrando el programa $'


;VARIABLES
    num1 db ?
    num2 db ?
    resultado db ?

.code
mov ax,@data
mov ds,ax



;---MOSTRAR MENU---
menu:

lea dx, msg_PrimerNumero 
mov ah,9
int 21h

    mov ah,1
    int 21h
    mov bl,al

lea dx,msg_SegundoNumero 
mov ah,9
int 21h

    mov ah,1
    int 21h
    mov cl,al

    
    lea dx,msg_Menu
    mov ah,9
    int 21h

    lea dx,msg_Suma
    mov ah,9
    int 21h

    lea dx,msg_Resta 
    mov ah,9
    int 21h

    lea dx,msg_Op_Multiplicacion
    mov ah,9
    int 21h

    lea dx,msg_Op_Division 
    mov ah,9
    int 21h

    lea dx,msg_Salir 
    mov ah,9
    int 21h

    lea dx,msg_Opcion 
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    sub bh,48


;---SWITCH OPCIONES---
    cmp bh,1
    je Op_Suma

    cmp bh,2
    je Op_Resta

    cmp bh,3
    je Op_Multiplicacion

    cmp bh,4
    je Op_Division

    cmp bh,6
    je exit_p


;SUMA
    Op_Suma:

    add al,bl
    mov ah,0
    aaa

    mov bx,ax
    add bh,48
    add bl,48

    lea dx,msg_Resultado 
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bh
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu


;RESTA
    Op_Resta:

    mov ah,1
    int 21h
    mov bl,al

    mov ah,1
    int 21h
    mov cl,al

    sub bl,cl
    add bl,48

    lea dx,msg_Resultado
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu

;Op_Multiplicacion
    Op_Multiplicacion:

    mov ah,1
    int 21h
    sub al,48
    mov num1,al

    mov ah,1
    int 21h
    sub al,48
    mov num2,al

    mul num1
    mov resultado,al
    aam

    add ah,48
    add al,48

    mov bx,ax

    lea dx,msg_Resultado 
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bh
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu


;Op_Division
Op_Division:

    mov ah,1
    int 21h
    sub al,48
    mov num1,al

    mov ah,1
    int 21h
    sub al,48
    mov num2,al

    mov cl,num1
    mov ax,cx

    div num2
    mov resultado,al
    mov ah,00
    aad

    add ah,48
    add al,48

    mov bx,ax

    lea dx,msg_Resultado 
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bh
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu
exit_p:
lea dx,msg_CerrarPrograma
mov ah,9
int 21h

exit:
mov ah, 4ch
int 21h

end
