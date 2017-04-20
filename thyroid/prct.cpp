#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    ifstream in;
    ofstream out;
    in.open("final.txt");
    out.open("out.txt",ios::app);
    out<<"write";
    out.close();
    int c=0;
    string strin , strout;
    getline(in,strin);
    cout<<strin;
    while(in){
        getline(in,strin);
        int i=0;
        while(strin[i]){
        out<<strin[i];
        cout<<strin[i];
        
        i++;
                //cout<<c;
                //fout<<strout<<"\n";
                //cout<<" "<< ;
                //c++;
                //cout<<getline(in,10000);
                }
                }
                //cout<<c;
                
    
    system("pause");
    return 0;
}
