#include <stdio.h>
#define INPUT_LENGTH 9000

typedef struct {
	int x;
	int y;
	int visits;
} house;

static house houses[INPUT_LENGTH] = {0};

int find(int x, int y){
	for (int i = 0; i < INPUT_LENGTH; i++){
		if (houses[i].x == x && houses[i].y == y){
			return i;
		}
	}
	return -1;
}

int count(){
	int duplicates = 0;
	for (int i = 0; houses[i].visits > 0; i++){
		if (houses[i].visits >= 1){
			duplicates++;
		}
	}
	return duplicates;
}

int main(){
	FILE* input = fopen("03input.txt", "r");
	int empty_house = 0;
	int x = 0;
	int y = 0;
	char c;
	houses[empty_house].x = x;
	houses[empty_house].y = y;
	houses[empty_house].visits++;
	empty_house++;
	while ((c = getc(input)) != EOF){
		int found_house;
		if (c == '\n'){
			break;
		}
		switch (c){
			case 'v':
				y++;
				break;
			case '^':
				y--;
				break;
			case '<':
				x--;
				break;
			case '>':
				x++;
				break;
			default:
				printf("off by one: %d\n", c);
				break;
		}
		found_house = find(x, y);
		if (found_house < 0){
			houses[empty_house].x = x;
			houses[empty_house].y = y;
			houses[empty_house].visits = 1;
			empty_house++;
		} else {
			houses[found_house].visits++;
		}
	}
	printf("%d\n", count());
	fclose(input);
	return 0;
}
