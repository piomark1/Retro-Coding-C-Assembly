#include<stdio.h>
#include<stdlib.h>

int x, y, z;

int main(void)
{
    printf("Enter first number: \n");
    scanf("%d", &x);
    printf("Enter sectond number: \n");
    scanf("%d", &y);

    if (x != y)
    {
        z = x + y;
        printf("\nJust calculated the sum: %d\n", z);
    }
    else
    {
        z = x/y;
        printf("\aJust calculated the quotient: %d\n", z);
    }
    return 0;
}   
