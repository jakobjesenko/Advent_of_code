#include <stdio.h>

int main(){
	FILE* input = fopen("01input.txt", "r");
	char c;
	int floor = 0;
	int index = 1;
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
		if (floor <= -1){
			break;
		}
		index++;
	}
	printf("%d\n", index);
	fclose(input);
	return 0;
}
