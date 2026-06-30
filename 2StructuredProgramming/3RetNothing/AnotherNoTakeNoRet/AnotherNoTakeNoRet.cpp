#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    void NoTakeNoRet(void);
}
int x;

int main(void)
{
    NoTakeNoRet();
}
