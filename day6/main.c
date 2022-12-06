
#include <stdio.h>
#include <stdlib.h>
// gsvd ltnr pcfw q
int isunique(char* str, int start,int n ){
    //printf("\n");
    for(int i = start ; i < start+n; i++){
        for(int j = start; j < start+n; j++){
            if( (str[i] == str[j]) && i != j){
                return 0;
            }
        }
    }
    
   // for(int i = start; i < start+n;i++) printf("%c",str[i]);
    return 1;
}

int main(){
    FILE * fp = fopen("input.txt","r");
    fseek(fp,0,SEEK_END);
    int end = ftell(fp);
    fseek(fp,0,SEEK_SET);
    char * Line = (char*)malloc(end);
    
    fread(Line,1,end,fp);

    /* part1: look for the first three
    for(int i = 3; i < end ; i++)
    {
        if(isunique(Line,i-3) == 1){
            printf("%d",i+1); 
            break;
        }

    }*/
    /* part2 */
      for(int i = 13; i < end ; i++)
    {
        if(isunique(Line,i-13,14) == 1){
            printf("%d",i+1); 
            break;
        }

    }
    free(Line);
    //*/
}