#include <stdio.h>
#include <stdlib.h>

void NoTakeNoRet(void);
int x;

int main(void)
{
    NoTakeNoRet();
    return 0;
}
void NoTakeNoRet(void)
{
    x = 10 + 40;
    printf("The sum of literal constants 10 and 40 ");
    printf("is %d\n", x);

}
