#include<iostream>
#include<fstream>
using namespace std;
int main()
{
    FILE *in=NULL;
    FILE *out=NULL;
    FILE *outt=NULL;
    in=fopen("final.txt","r");
    out=fopen("out.txt","w");
    outt=fopen("outt.txt","w");
    int c;
    c = getc(in) ;
    char content[1000];
    int co=1,clas=1;
    fputc(co,out);
   while (c!= EOF)
   {
   		putchar(c);
   		//fprintf(out,"\n");
   		
		c = getc(in);
		if(c=='\n') { 
                    
                    if(co<=182)
                    fprintf(out,"1");
                    if(co>182&&co<=775)
                    fprintf(out,"2");
                    if(co>775)
                    fprintf(out,"3");
                    fputc(c,out);
                    co++;
                    }
		fputc(c,out);
		//fprintf(out,"%d",c);
		
   }
   cout<<"co"<<co;
   
  /* while(fgets(content, strlen(content), in) !=NULL)
        {
            fprintf(outt, content);
        }*/
        
   fclose(in);
    
    
    system("pause");
    return 0;
}
