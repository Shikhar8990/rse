/*
 * First KLEE tutorial: testing a small function
 */

#include <klee/klee.h>

int find_middle(int x, int y, int z) {
  if (x<y) {
      if (y<z) return y;
      else if (x<z) return z;
      else return x;
  } else if (x<z) return x;
  else if (y<z) return z;
  else return y; 
} 

int main() {
  int a;
  klee_make_symbolic(&a, sizeof(a), "a");
  int b;
  klee_make_symbolic(&b, sizeof(b), "b");
  int c;
  klee_make_symbolic(&c, sizeof(c), "c");
  return find_middle(a,b,c);
} 
