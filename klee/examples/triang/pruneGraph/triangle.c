//#include <klee/klee.h>
#include <stdio.h>

int triang(int Side1, int Side2, int Side3)
{
   int triOut;

   // triOut is output from the routine:
   //    triang = 1 if triangle is scalene
   //    triang = 2 if triangle is isosceles
   //    triang = 3 if triangle is equilateral
   //    triang = 4 if not a triangle

   // After a quick confirmation that it's a valid
   // triangle, detect any sides of equal length
   if (Side1 <= 0 || Side2 <= 0 || Side3 <= 0)
   {
      printf("If1 \n");
      triOut = 4;
      return (triOut);
   }

   triOut = 0;
   if (Side1 == Side2)
      triOut = triOut + 1;
   if (Side1 == Side3)
      triOut = triOut + 2;
   if (Side2 == Side3)
      triOut = triOut + 3;
   if (triOut == 0)
   {  // Confirm it's a valid triangle before declaring
      // it to be scalene

     if (Side1+Side2 <= Side3 || Side2+Side3 <= Side1 ||
        Side1+Side3 <= Side2)
        printf("If2 \n");
        triOut = 4;
     else
        triOut = 1;
     return (triOut);
   }

   // Confirm it's a valid triangle before declaring
   // it to be isosceles or equilateral

   if (triOut > 3)
      triOut = 3;
   else if (triOut == 1 && Side1+Side2 > Side3)
      triOut = 2;
   else if (triOut == 2 && Side1+Side3 > Side2)
      triOut = 2;
   else if (triOut == 3 && Side2+Side3 > Side1)
      triOut = 2;
   else {
      printf("Else1 \n");
      triOut = 4;
   }
   return (triOut);
} // end Triang

int main() {
  int a;
  int b;
  int c;

  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(b), "b");
  klee_make_symbolic(&c, sizeof(c), "c");

  int res = triang(a, b, c);
  printf("Code: %d \n", res);
}
