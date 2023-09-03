#include <stdio.h>

int main(){
	FILE* input = fopen("01input.txt", "r");
	char c;
	int floor = 0;
	while ((c = getc(input)) != EOF){
		switch (c){
			case '(':
				floor++;
				break;
			case ')':
				floor--;
				break;
			default:
				break;
		}
	}
	printf("%d\n", floor);
	fclose(input);
	return 0;
}
