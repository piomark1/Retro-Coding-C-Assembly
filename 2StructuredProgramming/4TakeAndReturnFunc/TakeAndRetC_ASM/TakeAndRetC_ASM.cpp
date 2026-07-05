/*  Compilation:
 *          gcc -fno-pie -no-pie TakeAndRet.s TakeAndRetC_ASM.cpp -lstdc++ -z noexecstack
 */
#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    int TakeAndRet(int x, int y, int z);
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

    printf("The score is %d\n", score);

    return 0;

}
