#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    ifstream fin("efgh_hyperthyriod_data_1.txt");
    ofstream fout("efgh_hyperthyriod_data_2.txt");
    string strin,strout;
    while(!fin.eof())
    {
     getline(fin,strin);
     int i = 0;
     strout = "";
     while(strin[i])
     {
      if(strin[i] == 'E') {strout += 'E';break;}
      else if((strin[i] == 'F') && (strin[i+1] != ',')) {strout += 'F';break;}
      else if(strin[i] == 'G') {strout += 'G';break;}
      else if(strin[i] == 'H') {strout += 'H';break;}
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
