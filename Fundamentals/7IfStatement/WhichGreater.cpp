#include<stdio.h>
#include<stdlib.h>

int x, y;

int main(void)
{
    printf("Enter first number: \n");
    scanf("%d", &x);
    printf("Enter second number: \n");
    scanf("%d", &y);

    if(x>y)
    {
        printf("Number %d is greater\n", x);
    }
    else
    {
        printf("Number %d is greater than or equal "
                "to the number %d\n", y, x);
    }
    return 0;
}

