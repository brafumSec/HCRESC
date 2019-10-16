/*
 ============================================================================
 Name        : CodeSemantics.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


int main() {

	int temp1 = 1;
	int temp2 = 1;
	int temp3 = 1;

	if(temp1 || temp2 || temp3){
		int x = temp2;
		x++;
		if(x>=2)
			return 2;
		else
			return 1;
	}
	else 
		return 0 ;
}
