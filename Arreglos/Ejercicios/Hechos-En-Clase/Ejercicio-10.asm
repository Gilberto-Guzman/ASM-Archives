;Ejercicio 10 
    ;Elaborar un programa que contenga un arreglo de 10 números, imprimir
    ;en pantalla cuántos números 2 hay y realizar la multiplicación de esos
    ;números 2

    ;Ejemplo:
        ;numero[1,2,3,4,2,5,3,1,5,2].
    ;Salida:
        ;Mensaje1: hay 3 números 2 en el arreglo.
        ;Mensaje2: el resultado es de la multiplicación de los números 2 es: 8

;---ETIQUETAS PRINCIPALES---
	.model small
	.stack 64
	.data
;---MENSAJES---
	Mensaje_1 db "Mensaje1: hay $"
	Mensaje_2 db " numeros 2 en el arreglo. $"
	Mensaje_3 db "Mensaje2: El resultado de la multiplicacion de los numeros 2 es: $"
	Salto_De_Linea db 10, 13, "$"
;---VARIABLES---
	Numero_1 db ?
    Numero_2 db ?
	Contador_Numeros_Repetidos db 0
;---ARREGLO PRINCIPAL---
Arreglo_Numeros db 2,2,2,3,4,4,2,2,4,5

;---APERTURA DEL PROGRAMA---
.code
	inicio proc
		mov ax, @data
		mov ds,ax

			;Asignamos el valor 2 a numero_1
				mov Numero_1, 2
			
			;Inicializamos en 0 la posicion y el indice del arreglo
				mov cl, 0
				mov di, 0
			
			Primer_Ciclo:
				mov bl, Arreglo_Numeros[di] 
				
				;if (Numero_1 == bl) { Return Suma_Los_Numeros_Repetidos }
				cmp bl, Numero_1
				je Suma_Los_Numeros_Repetidos
				;else { Return Incrementa_La_Posicion_E_Indice_Del_Arreglo }
				jne Incrementa_La_Posicion_E_Indice_Del_Arreglo
				
				Suma_Los_Numeros_Repetidos:
					inc Contador_Numeros_Repetidos
				
				Incrementa_La_Posicion_E_Indice_Del_Arreglo:
					inc cl
					inc di
				
            	;if (cl != 10) { Return Primer_Ciclo }
				cmp cl, 10
				jb Primer_Ciclo
            	;else { Return Multiplicar }
				jnb Multiplicar
			

            Multiplicar:    
				mov al, 1
				mov cl, 0
				jb Segundo_Ciclo

            Segundo_Ciclo:
                mul Numero_1

                mov Numero_2,al
                inc cl

				;if (Contador_Numeros_Repetidos != cl) { Return Segundo_Ciclo }
                cmp cl, Contador_Numeros_Repetidos
                jb Segundo_Ciclo
                ;else { Return Mostrar_Los_Valores_En_Pantalla }
				jnb Mostrar_Los_Valores_En_Pantalla


			Mostrar_Los_Valores_En_Pantalla:	
				mov dx,offset Mensaje_1
				mov ah, 09h
				int 21h

				mov dl, Contador_Numeros_Repetidos
				add dl, 30h
				mov ah, 02h
				int 21h

				mov dx,offset Mensaje_2
				mov ah, 09h
				int 21h

				mov dx,offset Salto_De_Linea
				mov ah, 09h
				int 21h

                mov dx,offset Mensaje_3
				mov ah, 09h
				int 21h

				;---CONVERSION DE VALORES A 3 DIGITOS => 000 ---
				xor ax, ax
				mov al,Numero_2
				mov bl,Numero_1
				aam
				mov bx, ax
				mov cl, bl
				mov al, bh
				aam
				mov bx, ax

				mov dl, bh
				add dl, 30h
				mov ah , 02h
				int 21h

				mov dl, bl
				add dl, 30h
				mov ah , 02h
				int 21h

				mov dl, cl
				add dl, 30h
				mov ah , 02h
				int 21h

;---CIERRE DEL PROGRAMA---			
		mov ax, 04c00h
		int 21h
	inicio endp
end inicio