#include <stdlib.h>
#include <stdio.h>

int n, array[100];

int main(void)
{
    for(n=0; n<100; n+=5)
    {
        array[n] = 0;
    }
    printf("The array was set to 0.\n");
    
    for(n=0; n<100; n++)
    {
        if((n+1)%10 != 0)
        {
            printf("%d", array[n]);
        }
        else
        {
            printf("%d\n", array[n]);
        }
    }
    return 0;
}
