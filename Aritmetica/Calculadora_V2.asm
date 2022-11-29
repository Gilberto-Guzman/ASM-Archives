enterline macro        ;Definir la macroinstrucción para el retorno de carro y el avance de línea
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
endm

DATAS SEGMENT
    menus db'                         MENU$'
    input db'            Please select a function!$'
    number db'         1-add, 2-sub, 3-mult, 4-div, 5-exit$'
    a db'You are adding. Please enter two numbers separated by a space$'
    s db'You are subtracting. Please enter two numbers separated by a space$'
    m db'You are in the process of multiplication. Please enter two numbers separated by a space$'
    d db'You are in the process of division.Please enter two numbers separated by a space$'
    e db'Exiting program$'
    
    err db 'Illegal input! Please Try Again$'
    again db'Invalid input, try again.$'
    overout db'The number overflowed, try again$'
    err1 db'The result is overflowed, try again$'
    command db ?
    flag db ?
    temp dw 0
    buf db 20,?,20 dup(0)    ;Defina el búfer de caracteres de recepción del teclado, hasta19Caracteres
    ff db ?        ;Preámbulo de juicio de salida0símbolos de
    
    op1 dw ?    ;Definir dos operandos(16Poco)
    op2 dw ?
    
    hex_buf db 4 dup(30h),'H'
    crlf db '$'            ;Este es el símbolo final de una cadena.,Se puede formar una cadena inmediatamente después del búfer,Producirá después de la pérdida
DATAS ENDS

STACKS SEGMENT
    ;Ingrese el código del segmento de la pila aquí
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;Ingrese el código del fragmento de código aquí
    
;Tenga en cuenta que debe volver al menú principal cada vez que termine el cálculo.
menu:        ;Sección de menú
    lea dx,menus
    mov ah,9
    int 21h
    enterline
    
    lea dx,input
    mov ah,9
    int 21h
    enterline
    
    lea dx,number
    mov ah,9
    int 21h
    enterline
    
    mov ah,1            ;Los caracteres se almacenan en AL
    int 21h
    
judge:                    ;Determinar que función realizar
    cmp al,'1'
    je a1
    
    cmp al,'2'
    je a2
    
    cmp al,'3'
    je a3
    
    cmp al,'4'
    je a4
    
    cmp al,'5'
    je stop
    
    ;Si las coincidencias anteriores no tienen éxito, la entrada se considera una entrada no válida y se requiere volver a ingresar
    enterline
    lea dx,again
    mov ah,9
    int 21h
    enterline
    jmp menu
    
a1:                    ;Módulo de adición        ;Después de diseñar la subrutina de adición, también se encapsula la siguiente parte
    enterline        ;Esta parte es la salida sugerente de la oración.
    lea dx,a
    mov ah,9
    int 21h
    enterline
    
    call inputi        ;Subrutina de entrada de llamada
    cmp flag,1
    je a1            ;Vuelva a a1 debido a una entrada incorrecta y reinicie la operación de adición
    cmp flag,2
    je a1            ;Vuelva a a1 debido al desbordamiento y vuelva a ingresar
    
    call addi        ;Agregar subrutina
    cmp flag,2
    je over
    call outi
    jmp menu        ;Volver al menú principal después de la ejecución
    
over:
    mov ax,op1
    call to16str;Convertir decimal a hexadecimal
    mov dx,offset hex_buf
    mov ah,9
    int 21h
    
    mov ax,op2
    call to16str;Convertir decimal a hexadecimal
    mov dx,offset hex_buf
    mov ah,9
    int 21h
    enterline
    jmp menu        ;Volver al menú principal después de la ejecución
a2:                    ;Módulo de resta
    enterline
    lea dx,s
    mov ah,9
    int 21h
    enterline
    
    call inputi        ;Subrutina de entrada de llamada
    cmp flag,1
    je a2            ;Vuelva a a1 debido a una entrada incorrecta y reinicie la operación de adición
    cmp flag,2
    je a2            ;Vuelva a a1 debido al desbordamiento y vuelva a ingresar
    
    call subi
    call outi
    jmp menu        ;Volver al menú principal después de la ejecución

a3:                    ;Módulo de multiplicación
    enterline
    lea dx,m
    mov ah,9
    int 21h
    enterline
    
    call inputi        ;Subrutina de entrada de llamada
    cmp flag,1
    je a3            ;Vuelva a a1 debido a una entrada incorrecta y reinicie la operación de adición
    cmp flag,2
    je a3            ;Vuelva a a1 debido al desbordamiento y vuelva a ingresar
    
    call multi
    
    mov ax,op1
    call to16str;Convertir decimal a hexadecimal
    mov dx,offset hex_buf
    mov ah,9
    int 21h
    
    mov ax,op2
    call to16str;Convertir decimal a hexadecimal
    mov dx,offset hex_buf
    mov ah,9
    int 21h
    enterline
    
    jmp menu        ;Volver al menú principal después de la ejecución

a4:                    ;Módulo de división
    enterline
    lea dx,d
    mov ah,9
    int 21h
    enterline
    
    call inputi        ;Subrutina de entrada de llamada
    cmp flag,1
    je a4            ;Vuelva a a1 debido a una entrada incorrecta y reinicie la operación de adición
    cmp flag,2
    je a4            ;Vuelva a a1 debido al desbordamiento y vuelva a ingresar
    
    call divi
    cmp flag,1
    je a4            ;Porque el divisor puede perder0Porque vuelve a entrar
    call outi
    jmp menu        ;Volver al menú principal después de la ejecución

stop:        ;Fin del programa
    enterline
    lea dx,e
    mov ah,9
    int 21h
    
    MOV AH,4CH
    INT 21H
 

inputi proc            ;La subrutina de entrada es la siguiente
    mov flag,0        ;Bandera de inicialización
    
    lea dx,buf        ;Reciba el valor de entrada del teclado y póngalo en el búfer buf(Operación de entrada)
    mov ah,10
    int 21h
    enterline        ;Retorno de carro
    
    
    mov cl,buf+1    ;Obtenga el número real de caracteres escritos y colóquelo en el registro CX
    xor ch,ch        ;ch claro0
    
    xor di,di        ;Acumulador claro0
    xor dx,dx        ;dX registro claro0
    mov bx,1        ;Dado que comienza con un solo dígito, el valor ponderado se establece en1
    
    lea si,buf+2    ;Apunta si al recibido1Posiciones de personajes
    add si,cx        ;Contando desde el lugar de las unidades, así que apunta si hasta el final1Recibido un solo dígito
    dec si            ;Disminuir espalda1Haz que apunte al último elemento de la cadena

;cov es el paso de detectar y generar el primer número
cov:mov al,[si]        ;Lleva el dígito a al
    cmp al,' '        
    jz next1        ;Salta cuando veas un espacio
    
    cmp al,'0'        ;Verificación de límites: si la entrada no es0-9El número, solo informa un error
    jb wrong
    cmp al,'9'
    ja wrong
    
    sub al,30h        ;Convierta el código ascii en al en un número
    xor ah,ah
    mul bx            ;Multiplicado por el peso del dígito
    cmp dx,0        ;Determine si el resultado supera16El rango de dígitos, si supera, se informará un error
    jne yichu
    
    add di,ax        ;Superponer el valor formado en el acumulador di
    jc yichu        ;CF es la bandera de acarreo
 
    mov ax,bx        ;Expande el peso digital en BX10Veces,Aquí es necesario usar el hacha para lograr
    mov bx,10
    mul bx
    mov bx,ax
    
    dec si            ;puntero si menos1, Apunta al dígito anterior
    loop cov        ;Cuente bucles por el número de caracteres en CX
       
;Salte al siguiente lugar para indicar que se ha generado el primer número, luego vaya a verificar el segundo número    
next1:
    mov op1,di        ;Almacene el resultado en op14
    xor ax,ax
    xor di,di        ;Acumulador claro0
    xor bx,bx
    mov bx,1        ;Dado que comienza con un solo dígito, el valor ponderado se establece en1
    dec si        ;Avanzar un bloque
    dec cx        ;Reducción correspondiente al encontrar espacios cx1


;cov2 es detectar y generar el primer2Números
cov2:
    mov al,[si]        ;Lleva el dígito a al

    cmp al,'0'        ;Verificación de límites: si la entrada no es0-9El número, solo informa un error
    jb wrong
    cmp al,'9'
    ja wrong
    
    sub al,30h        ;Convierta el código ascii en al en un número
    xor ah,ah
    mul bx            ;Multiplicado por el peso del dígito
    cmp dx,0        ;Determine si el resultado supera16El rango de dígitos, si supera, se informará un error
    jne yichu
    
    add di,ax        ;Ponga el valor formado en el acumulador di
    jc yichu        ;CF es la bandera de acarreo
        
    mov ax,bx        ;Expande el peso digital en BX10Veces,Aquí es necesario usar el hacha para lograr
    mov bx,10
    mul bx
    mov bx,ax
    
    dec si            ;puntero si menos1, Apunta al dígito anterior
    loop cov2        ;Cuente bucles por el número de caracteres en CX
    
next2:
    mov op2,di        ;Almacene el resultado en op2
    jmp return        ;Pasemos areturnsección 
    
wrong:
    lea dx,err
    mov ah,9
    int 21h
    mov flag,1
    jmp return
    
yichu:
    mov flag,2
    lea dx,overout
    mov ah,9
    int 21h
    
return:
    ret
inputi endp

addi proc    ;Subrutina de adición (16Dígitos añadidos)
    xor bx,bx
    xor cx,cx
    mov bx,op2
    mov cx,op1
    add bx,cx
    cmp bx,op1
    jb ex
    cmp bx,op2
    jb ex
    jmp addret
ex:                    ;Indica que el resultado es superior a16Adición de bits
    mov flag,2
    mov op2,bx
    mov op1,1        ;Significa llevar
    
addret:
    ret
addi endp 

subi proc    ;Subrutina de resta (16Sustracción)
    xor bx,bx
    xor cx,cx
    mov bx,op2
    mov cx,op1
    cmp bx,cx        ;Comparación de tamaño
    jb fuhao
    sub bx,cx        ;El resultado se almacena en bx        
    jmp subret
fuhao:    
    mov dx,'-'
    mov ah,2
    int 21h
    sub cx,bx
    mov bx,cx
subret:
    ret
subi endp

multi proc    ;Subrutina de multiplicación (16Multiplica el número de dígitos)
    xor ax,ax
    xor cx,cx
    mov ax,op2
    mov cx,op1
    mul cx            ;El resultado es dx:hacha interior
    mov op1,dx
    mov op2,ax        ;Existe temporalmente op1 y op2
    ret
multi endp 

divi proc    ;Subrutina de división (16Dividido por8Dígitos)
    xor bx,bx            ;Tenga en cuenta que el divisor del programa no puede exceder255  Y el cociente no puede exceder255  Su capacidad de carga es solo8Poco
    xor cx,cx
    xor ax,ax
    mov cx,op1            ;Realmente existe en cl
    cmp cx,255            ;Sea el valor de cx0~255Entre (porque el registro es8Poco)
    ja divwrong
    cmp cl,0
    je divwrong
    mov al,255            ;Dejar255Multiplica con op1 y compara con op2. Si es menor que op2, se producirá un error de división, por lo que el juicio es ilegal.
    mul cl
    cmp ax,op2
    jb overflow
    
    mov ax,op2
    div cl                ;Palabra dividida por1División de bytes,Existe cociente en al
    mov ah,0            ;Borrar el contenido en ah
    mov bx,ax
    jmp divret
divwrong:
    lea dx,err
    mov ah,9
    int 21h
    mov flag,1
overflow:
    lea dx,err1
    mov ah,9
    int 21h
    mov flag,1
divret:
    ret
divi endp 

outi proc
    mov ax,bx            ;El número que se va a generar se almacena primero en bx y se le da a ax
    mov bx,10000        ;El peso digital inicial es10000
    mov ff,0            ;Valor inicial cada vez0
    
cov1:xor dx,dx            ;Dx:Dividir el valor en ax por el peso
    div bx
    mov cx,dx            ;El resto está respaldado en el registro CX
    
    cmp ff,0            ;Compruebe si ha encontrado0Cociente
    jne nor1            ;Si se encuentra, independientemente de si el cociente es0Ambos pantalla de salida
    cmp ax,0            ;Si no lo ha encontrado antes, si el probador es0
    je cont                ;para0Sin pantalla de salida    
nor1:
    mov dl,al            ;Convertir cociente en pantalla de salida de código ascii
    add dl,30h
    mov ah,2
    int 21h
    
    mov ff,1            ;No he encontrado0Cociente, establecer el signo1
cont:
    cmp bx,10            ;Compruebe si el peso se ha modificado al décimo lugar
    je outer            ;Si son iguales, complete la pantalla de salida final de un solo dígito
    
    xor dx,dx            ;Divida el peso digital por10
    mov ax,bx
    mov bx,10
    div bx
    mov bx,ax
 
    mov ax,cx            ;Envíe el resto de la copia de seguridad a AX
    jmp cov1                ;Sigue dando vueltas 
outer:
    mov dl,cl            ;El último dígito se convierte en la pantalla de salida del código ascii
    add dl,30h
    mov ah,2
    int 21h   
    enterline
ret
outi endp

to16str proc;Función: Convertir decimal a hexadecimal
    mov bx,ax;Asignar el número decimal convertido a bx
    mov si,offset hex_buf    ;Asignar la primera dirección de la cadena a si

    mov ch,4 ;será10Convertir a4Poco16Número base, cada operación1Poco,ch es el número de bits que se van a convertir actualmente
    loop_trans:
    mov cl,4
    rol bx,cl;Donde el valor de cl es4, Lo que significa rotar el valor en BX hacia la izquierda4Bit, haz eso en bx4Poco movido a lo mas bajo4Poco
    
    mov al,bl;Extraiga cuatro números binarios de mayor a menor y envíelos a todos.,con0fhy la operación es bl media y baja4Poco
    and al,0fh
    
    add al,30h;al=0~9,más30h se convierte a código ascii
    cmp al,3ah
    jl next_trans
    add al,7  ;al>9,más37h se convierte a código ascii, convertido a la letra A~F
    
    next_trans:
    mov [si],al    ;Asignar el código ascii convertido a la posición si de la cadena
    inc si    ;si se mueve hacia atrás un lugar
    dec ch    ;Representa el número de bits que se convertirán menos1
    jnz loop_trans;Tenga en cuenta que aquí solo puede usar la operación dec para establecer el bit de bandera para juzgar si el bucle o no
    ;Porque cl se usa para almacenar el número de desplazamiento
ret
to16str endp
CODES ENDS
    END START