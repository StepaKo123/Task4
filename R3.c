Дан код программы на языке Ассемблера. Вам необходимо восстановить семантику данной программы и выразить её в виде программы на языке Си.


#include <stdio.h>

int M(int a, int b, int c){
    while (1){
        if (a >= b){
            goto L;
        }
        a = a ^ b;
        b = a ^ b;
        a = a ^ b;
        L:;
        if (a <= c){
            return a;
        }
        a = a ^ c;
        c = a ^ c;
        a = a ^ c;
    }
    
}

int main(void)
{
    int a, b, c;
    scanf("%d", &a);
    scanf("%d", &b);
    scanf("%d", &c);
    printf("%d", M(a, b, c));
    return 0;
}
