/*
 * First KLEE tutorial: testing a small function
 */
#include <stdio.h>
int get_sign(int x) {
  if (x == 0) {
     printf("zero\n");
     return 0;
  }
  
  if (x < 0) {
     printf("negative\n");
     return -1;
  }
  else { 
     printf("positive\n");
     return 1;
  }
} 

int main() {
  int a;
  return get_sign(a);
} 
