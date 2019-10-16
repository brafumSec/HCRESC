/*
 ============================================================================
 Name        : test_1.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int func(int state){
	int x = state;
	if(x==1)
		return x;
	else
		return -1;
}

int main() {

	int temp1 = 1;
	int temp2 = 1;
	int temp3 = 1;

	if(temp1 || temp2 || temp3){
		return func(1);
	}
	else return func(0);
}
