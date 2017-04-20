#include<iostream>
using namespace std;
int main()
{
    FILE *f=NULL;
    f=fopen("label_efgh.txt","w");
    int c=0;
    while(c!=589)
    {
                 fprintf(f,"2\n");
                 c++;
                 }
    return 0;
}
