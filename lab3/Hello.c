#include <stdio.h>

#define RESET   "\x1b[0m"


int main (int argc, char const *argv[]) {


	for (int i=0;i<256;i=i+16)
		for (int j=0;j<256;j=j+16)
			for (int k=0;k<256;k=k+16)
				printf("\x1b[38;2;%d;%d;%dmHello, World!" RESET "\n",i,j,k);
  
  return 0;
}