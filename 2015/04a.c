#include <stdio.h>
#include <string.h>
#include <openssl/md5.h>

int leadingzeros(unsigned char digest[16]){
	int count = 0;
	for (int i = 0; i < 16; i++){
		if ((digest[i] & 0xf0) == 0){
			count++;
		} else {
			return count;
		}
		if ((digest[i] & 0x0f) == 0){
			count++;
		} else {
			return count;
		}
	}
	return count;
}

char input[] = "bgvyzdsv";

void calculate_hash(char* string, unsigned char digest[16]){
	MD5_CTX ctx;
	MD5_Init(&ctx);
	MD5_Update(&ctx, string, strlen(string));
	MD5_Final(digest, &ctx);
}

int main(){
	char totest[1024];
	unsigned char digest[16];
	int toappend = 0;
	while (1){
		sprintf(totest, "%s%d", input, toappend);
		// printf("%s\n", totest);
		calculate_hash(totest, digest);
		// printf("    %d\n", leadingzeros(digest));
		if (leadingzeros(digest) == 5){
			printf("%d\n", toappend);
			break;
		}
		toappend++;
	}
		
	
	for (int i = 0; i < 16; i++){
		printf("%02x", digest[i]);
	}
	printf("    %d\n", leadingzeros(digest));
	return 0;
}
