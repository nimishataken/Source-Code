#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    ifstream fin("thyroid.txt");
    ofstream fout("efgh_hyperthyriod_data_1.txt");
    string str;
    while(!fin.eof())
    {
     getline(fin,str);
     int i = 0,n = 0;
     while(n != 29 && str[i])
     {
      if(str[i] == ',') n++;
      i++;
     }
     //if( (str[i] == 'A' || str[i] == 'B' || str[i] == 'C' || str[i] == 'D') && str[i+1] == '[')
        // fout<<str<<"\n";
    if( (str[i] == 'E' || str[i] == 'F' || str[i] == 'G' || str[i] == 'H') && str[i+1] == '[')
        fout<<str<<"\n";
     //if( (str[i] == 'K') && str[i+1] == '[')
      // fout<<str<<"\n";
   // if(str[i] == '-') fout<<str<<"\n";
    }
    cout<<"hi";
    cin.get();
    return 0;
}
