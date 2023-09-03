#include <stdio.h>
#include <string.h>

void update_pair(char* pair, char c){
	pair[0] = pair[1];
	pair[1] = c;
}

int has_repeating_pair(char* string){
	char pair[3] = {0};
	for (int i = 0; i < strlen(string); i++){
		char c = string[i];
		update_pair(pair, c);
		for (int j = i+2; j < strlen(string); j++){
			if (strncmp(pair, string + j, 2) == 0){
				return 1;
			}
		}
	}
	return 0;
}

int gap_rule(char* string){
	for (int i = 0; i < strlen(string) - 2; i++){
		// printf("%c\n", string[i]);
		if(string[i] == string[i + 2]){
			return 1;
		}
	}
	return 0;
}

int string_is_nice(char* string){
	if (gap_rule(string) && has_repeating_pair(string)){
		return 1;
	} else {
		return 0;
	}
}

int main(){
	int nicecount = 0;
	char string[17];
	printf("%d\n", string_is_nice("qjhvhtzxzqqjkmpb"));
	printf("%d\n", string_is_nice("uurcxstgmygtbstg"));
	printf("%d\n", string_is_nice("ieodomkazucvgmuy"));
	FILE* input = fopen("05input.txt", "r");
	while (fscanf(input, "%s", string) != EOF){
		int nice = string_is_nice(string);
		printf("%s %d\n", string, nice);
		nicecount += nice;
	}
	fclose(input);
	printf("%d\n", nicecount);
	return 0;
}
