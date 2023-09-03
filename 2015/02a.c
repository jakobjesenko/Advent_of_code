#include <stdio.h>

int main(){
	FILE* input = fopen("02input.txt", "r");
	char c;
	int l, w, h, area;
	int total = 0;
	while (fscanf(input, "%dx%dx%d", &l, &w, &h) != EOF){
		area = 2*l*w + 2*w*h + 2*h*l;
		if (l >= w && l >= h){
			area += w*h;
		} else if (w >= l && w >= h){
			area += l*h;
		} else if (h >= l && h >= w){
			area += l*w;
		}
		total += area;
	}
	printf("%d\n", total);
	fclose(input);
	return 0;
}

