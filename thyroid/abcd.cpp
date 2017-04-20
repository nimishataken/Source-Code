#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    ifstream fin("abcd_hypothyriod_data_1.txt");
    ofstream fout("abcd_hypothyriod_data_2.txt");
    string strin,strout;
    while(!fin.eof())
    {
     getline(fin,strin);
     int i = 0;
     strout = "";
     while(strin[i])
     {
      if(strin[i] == 'A') {strout += 'A';break;}
      else if(strin[i] == 'B') {strout += 'B';break;}
      else if(strin[i] == 'C') {strout += 'C';break;}
      else if(strin[i] == 'D') {strout += 'D';break;}
      else if(strin[i] == ',') strout += ' ';
      else if(strin[i] >= 48 && strin[i] <= 57) strout += strin[i];
      else if(strin[i] == '.') strout += '.';
      else if(strin[i] == 'f') strout += '0';
      else if((strin[i] == 't') && (strin[i+1] != 'h')) strout += '1';
      else if((strin[i] == 'M') && (strin[i+1] == ',')) strout += '0';
      else if(strin[i] == 'F') strout += '1';
      else if(strin[i] == '?') strout += '0.000';
      
      i++;
     }
     fout<<strout<<"\n";
     
    }
    cout<<"hi";
    cin.get();
    return 0;
}
