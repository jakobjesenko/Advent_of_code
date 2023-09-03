#include <stdio.h>
#include <string.h>


int is_vowel(char c){
	return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
}

int pair_is_bad(char* pair){
	if (!strcmp(pair, "ab"))
		return 1;
	if (!strcmp(pair, "cd"))
		return 1;
	if (!strcmp(pair, "pq"))
		return 1;
	if (!strcmp(pair, "xy"))
		return 1;
	return 0;
}

int pair_is_same(char* pair){
	if (pair[0] == pair[1]){
		return 1;
	} else {
		return 0;
	}
}

void update_pair(char* pair, char c){
	pair[0] = pair[1];
	pair[1] = c;
}

int string_is_nice(char* string){
	char pair[3] = {0};
	int has_double = 0;
	int vowelcount = 0;
	for (int i = 0; i < strlen(string); i++){
		char c = string[i];
		update_pair(pair, c);
		if (pair_is_bad(pair))
			return 0;
		if (pair_is_same(pair))
			has_double = 1;
		if (is_vowel(c))
			vowelcount++;
	}
	// printf("%d %d\n", has_double, vowelcount);
	if (has_double && vowelcount >= 3){
		return 1;
	} else {
		return 0;
	}
}


int main(){
	int nicecount = 0;
	char string[17];
	FILE* input = fopen("05input.txt", "r");
	while (fscanf(input, "%s", string) != EOF){
		nicecount += string_is_nice(string);
	}
	fclose(input);
	printf("%d\n", nicecount);
	return 0;
}
