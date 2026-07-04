#include <stdlib.h>
#include <stdio.h>

int TakeAndRet(int x, int y, int z);

extern "C"
{
    int Return_X(void);
    int Return_Y(void);
}

int a, b, c, score;

int main(void)
{
    printf("First number: \n");
    scanf("%d", &a);
    
    printf("Second number: \n");
    scanf("%d", &b);
    
    printf("Third number: \n");
    scanf("%d", &c);

    
    score = TakeAndRet(a, b, c);
    printf("Score: %d\n", score);

    return 0;
}
int TakeAndRet(int x, int y, int z)
{
    if ((x*=y) > (z*=100))
    {
        //return x;
        __asm__(
                "Return_X:\n"
                "   movl   %edi, %eax\n"
                "   leave\n"
                "   ret\n"
                );
        return Return_X();
    }
    else
    {
        //return y;
        __asm__(
                "Return_Y:\n"
                "   movl   %esi, %eax\n"
                "   leave\n"
                "   ret\n"
                );
        return Return_Y();
    }
}
