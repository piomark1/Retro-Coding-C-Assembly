/*Compilation:
            gcc -fno-pie -no-pie RetNothing.s RetNothing1.cpp -lstdc++ -z noexecstack
*/
#include <stdio.h>
#include <stdlib.h>

extern "C"
{
    void RetNothing(int x);
}
int number;
int main(void)
{
    printf("Enter a number: \n");
    scanf("%d", &number);
    RetNothing(number);
    return 0;
}
