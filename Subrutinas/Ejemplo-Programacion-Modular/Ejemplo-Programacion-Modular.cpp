#include<conio.h>
#include<stdio.h>

int promedio(int a, int b){
	
	return (a+b)/2;
}

main (){
	int resultado = 0;
	
	resultado = promedio(10, 8);
	
	printf("El promedio del alumno es: %d", resultado);
}
