#include <stdio.h>

int main(){
	FILE* input = fopen("02input.txt", "r");
	char c;
	int l, w, h, length;
	int total = 0;
	while (fscanf(input, "%dx%dx%d", &l, &w, &h) != EOF){
		length = l * w * h;
		if (l >= w && l >= h){
			length += 2*w + 2*h;
		} else if (w >= l && w >= h){
			length += 2*l + 2*h;
		} else if (h >= l && h >= w){
			length += 2*l + 2*w;
		}
		total += length;
	}
	printf("%d\n", total);
	fclose(input);
	return 0;
}
