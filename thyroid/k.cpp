#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    ifstream fin("k_no_illness_data_1.txt");
    ofstream fout("k_no_illness_data_2.txt");
    string strin,strout;
    while(!fin.eof())
    {
     getline(fin,strin);
     int i = 0;
     strout = "";
     while(strin[i])
     {
      if(strin[i] == 'K') {strout += 'K';break;}
      else if(strin[i] == ',') strout += ' ';
      if(strin[i] >= 48 && strin[i] <= 57) strout += strin[i];
      else if(strin[i] == '.') strout += '.';
      else if(strin[i] == 'f') strout += '0';
      else if((strin[i] == 't') && (strin[i+1] != 'h')) strout += '1';
      else if((strin[i] == 'M') && (strin[i+1] == ',')) strout += '0';
      else if(strin[i] == 'F') strout += '1';
      else if(strin[i] == '?') strout += '0.00';
      i++;
     }
     fout<<strout<<"\n";
     
    }
    cout<<"hi";
    cin.get();
    return 0;
}
