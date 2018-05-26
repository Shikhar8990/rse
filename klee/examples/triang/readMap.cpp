#include <iostream>
#include <fstream>
using namespace std;
int main() {
	string line;
  ifstream myfile ("map1");
  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {
      cout << line << '\n';
    }
    myfile.close();
  }
  return 0;
}
