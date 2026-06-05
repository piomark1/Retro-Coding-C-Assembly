#include<stdio.h>
#include<stdlib.h>

int x, y, z;

int main(void)
{
    printf("Enter first number: \n");
    scanf("%d", &x);
    printf("Enter second number: \n");
    scanf("%d", &y);

    z = x*y;

    if (z==100)
    {
        printf("Value of variable z is equal to number 100. \n");
    }
    else
    {
        if (z>100)
        {
            printf("Value of variable z is greater than number 100. \n");
        }
        else
        {
            printf("Valeu of variable z is less than number 100. \n");
        }
    }
    return 0;
}

