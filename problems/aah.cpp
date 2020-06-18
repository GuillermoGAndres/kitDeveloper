#include<bits/stdc++.h>

using namespace std;
int main(){
  ifstream file; //Utilizamos para hacer un test con una archivo externo
  //file.open("input.txt");
  string line;
  //  getline(file, line);
  while( getline(cin, line)){
  int num_user=0;
  int num_doctor=0;
  //cout << line << endl;
  for(char s : line){
    if(s == 'h')
      break;
    num_user++;
  }
  // getline(file, line);
  getline(cin, line);
  //cout << line << endl;
  for(char s : line){
    if(s == 'h')
      break;
    num_doctor++;
  }
  if(num_user <= num_doctor)
    cout << "no\n";
  else
    cout << "go\n";
  //cout << num_user << endl;
  //cout << num_doctor << endl;
  }
  return 0;
}

