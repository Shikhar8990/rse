#include <stdio.h>
#include "bb_rec.h"
#include <iostream>
#include <fstream>

using namespace std;

void rec_path(int bbid) {
  printf("BB_Id %i\n", bbid);
  ofstream myfile;
  myfile.open("pathFile", std::ios_base::app); 
  myfile<<"BB_Id "<<bbid<<"\n";
  myfile.close();
}
