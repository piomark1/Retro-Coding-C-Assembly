/*
Compilation:
        gcc -fno-pie -no-pie AnotherNoTakeNoRetFunc.s AnotherNoTakeNoRet.cpp -lstdc++ -z nexecstack
*/
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
