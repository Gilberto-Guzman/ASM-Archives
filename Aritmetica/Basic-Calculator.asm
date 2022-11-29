.model small
.stack 100h
.386
.data
msg1 db 'Enter 1 for addition $'
msg2 db 10,13,'Enter 2 for Substraction $'
msg3 db 10,13,'Enter 3 for multiplicacion $'
msg4 db 10,13,'Enter 4 for Division $'
msg5 db 10,13,'Choose Any one : $'
msg6 db 10,13,10,13,'Enter 1st number : $'
msg7 db 10,13,'Enter 2nd number : $'
msg8 db 10,13,10,13,'The result is : $'
msg db 10,13,10,13,' THANKS YOU $'

num1 db ?
num2 db ?
result db ?

.code
mov ax,@data
mov ds,ax

lea dx,msg1 ;Enter for addition
mov ah,9
int 21h

lea dx,msg2 ;Enter for substraction
mov ah,9
int 21h

lea dx,msg3 ;Enter for multiplication
mov ah,9
int 21h

lea dx,msg4 ;Enter for division
mov ah,9
int 21h

lea dx,msg5 ;Choose any one
mov ah,9
int 21h

mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je addition

cmp bh,2
je substraction

cmp bh,3
je multiplicacion

cmp bh,4
je division

addition:
lea dx, msg6 ;Enter fist number
mov ah,9
int 21h

mov ah,1
int 21h
mov bl,al

lea dx,msg7 ;Enter second number
mov ah,9
int 21h

mov ah,1
int 21h
mov cl,al

add al,bl
mov ah,0
aaa

mov bx,ax
add bh,48
add bl,48

lea dx,msg8 ; RESULT
mov ah,9
int 21h

mov ah,2
mov dl,bh
int 21h

mov ah,2
mov dl,bl
int 21h

jmp exit_p

substraction:
lea dx,msg6 ;Enter 1st number
mov ah,9
int 21h

mov ah,1
int 21h
mov bl,al

lea dx,msg7 ;Enter 2st number
mov ah,9
int 21h

mov ah,1
int 21h
mov cl,al

sub bl,cl
add bl,48

lea dx,msg8 ;Result
mov ah,9
int 21h

mov ah,2
mov dl,bl
int 21h

jmp exit_p

multiplicacion:

lea dx,msg6 ;Enter 1st number
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num1,al

lea dx,msg7 ;Enter 2st number
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num2,al

mul num1
mov result,al
aam

add ah,48
add al,48

mov bx,ax

lea dx,msg8 ;Result
mov ah,9
int 21h

mov ah,2
mov dl,bh
int 21h

mov ah,2
mov dl,bl
int 21h

jmp exit_p

division:
lea dx,msg6 ;Enter 1st number
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num1,al

lea dx,msg7 ;Enter 2st number
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num2,al

mov cl,num1
mov ax,cx

div num2
mov result,al
mov ah,00
aad

add ah,48
add al,48

mov bx,ax

lea dx,msg8 ;Result
mov ah,9
int 21h

mov ah,2
mov dl,bh
int 21h

mov ah,2
mov dl,bl
int 21h

jmp exit_p

exit_p:
lea dx,msg ;Thank you
mov ah,9
int 21h

exit:
mov ah, 4ch
int 21h

end
