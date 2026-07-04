#include <stdlib.h>
#include <stdio.h>

int TakeAndRet(int x, int y, int z);

int a, b, c, score;

int main(void)
{
    printf("First number:\n");
    scanf("%d", &a);
    printf("Second number:\n");
    scanf("%d", &b);
    printf("Third number:\n");
    scanf("%d", &c);

    score = TakeAndRet(a, b, c);

    printf("Score: %d\n", score);

    return 0;

}
int TakeAndRet(int x, int y, int z)
{
    if ((x*=y) > (z*=100))
    {
        __asm__(
                "movl   %edi, %eax\n"
                "leave\n"
                "ret"
                );
        //return 1;
    }
    else
    {
        __asm__(
                "movl   %esi, %eax\n"
                "leave\n"
                "ret"
                );
        //return 1;

    }
}
