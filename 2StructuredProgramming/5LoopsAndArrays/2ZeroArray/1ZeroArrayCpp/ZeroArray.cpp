#include <stdlib.h>
#include <stdio.h>

int array[40];
int counter;

int main(void)
{
    for(counter=0; counter<40; counter++)
    {
        array[counter] = 0;
        printf("The array was set to zero.\n");
        return 0;
    }
}
