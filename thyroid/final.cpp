#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    ifstream fin("abcd_hypothyriod_data_2.txt");
    ofstream fout("abcd_hypothyriod_data_3.txt");
    double arr[182][28];
    char ch;
    for(int i=0;i<182;i++)
    {
    for(int j=0;j<28;j++)
    {
     fin>>arr[i][j];
    }
    fin>>ch;
    }
    
    for(int i=17;i<28;i+=2)
    {
     int count = 0;
     double sum = 0;
     for(int j=0;j<182;j++)
     {
      if(arr[j][i] != 0)
      {
       count++;
       sum += arr[j][i];
      // cout<<arr[j][i]<<" \n";
      // system("pause");
      }
     }
     double val = (sum*1.0)/(count*1.0);
     for(int j=0;j<182;j++)
     {
      if(arr[j][i] == 0)
      {
       arr[j][i] = val;
      }
     }
    }
    
    for(int i=0;i<182;i++)
    {
    for(int j=0;j<28;j++)
    {
     fout<<arr[i][j]<<" ";
    }
    fout<<"\n";
    }
    
    cout<<"hi";
    cin.get();
    return 0;
}
