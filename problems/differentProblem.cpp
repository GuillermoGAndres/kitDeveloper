#include <bits/stdc++.h>
using namespace std;
/*You can simulate EOF with CTRL+D (for *nix) or CTRL+Z (for Windows) from command line.
  c-x-y and M-y para list king killers
*/
//Input: number [0, 10^15 ]
int main(){
  ifstream file;
  file.open("input.txt");
  string line;
  long long  a, b; //10^18
  while( getline(file,line) ){
    istringstream iss(line);
    iss >> a >> b;
    cout <<abs( a - b) << '\n';
  }
  return 0;
}
