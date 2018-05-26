//#include <klee/klee.h>
#include <stdio.h>
#include <stdlib.h>

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
      //printf("If1 ");
      triOut = 4;
      return (triOut);
   }

   triOut = 0;
   if (Side1 == Side2) {
      //printf("If2 ");
      triOut = triOut + 1;
   }
   if (Side1 == Side3) {
      //printf("If3 ");
      triOut = triOut + 2;
   }
   if (Side2 == Side3) {
      //printf("If4 ");
      triOut = triOut + 3;
   }
   if (triOut == 0)
   {  // Confirm it's a valid triangle before declaring
      // it to be scalene
     //printf("If5 ");
     if (Side1+Side2 <= Side3 || Side2+Side3 <= Side1 ||
        Side1+Side3 <= Side2) {
        //printf("If6 ");
        triOut = 4;
     }
     else {
        //printf("Else1 ");
        triOut = 1;
     }
     return (triOut);
   }

   // Confirm it's a valid triangle before declaring
   // it to be isosceles or equilateral

   if (triOut > 3) {
      //printf("If7 ");
      triOut = 3;
   }
   else if (triOut == 1 && Side1+Side2 > Side3) {
      //printf("ElIf1 ");
      triOut = 2;
   }
   else if (triOut == 2 && Side1+Side3 > Side2) {
      //printf("ElIf2 ");
      triOut = 2;
   }
   else if (triOut == 3 && Side2+Side3 > Side1) {
      //printf("ElIf3 ");
      triOut = 2;
   }
   else {
      //printf("Else2 ");
      triOut = 4;
   }
   return (triOut);
} // end Triang

int main(int argc, char *argv[]) {
  int res = triang(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]));
  printf("Output: %d \n", res);
}
