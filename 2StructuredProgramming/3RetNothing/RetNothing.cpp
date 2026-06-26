#include <stdio.h>
#include <stdlib.h>

void RetNothing(int x);
int number;

int main(void)
{
    printf("Enter number: \n");
    scanf("%d", &number);
    RetNothing(number);
    return 0;
}
void RetNothing(int x)
{
    if (x < 20)
    {
        printf("Number is less than 20.\n");
    }
    else
    {
        if (x == 20)
        {
            printf("Number is equal to 20.\n");
        }
        else
        {
            printf("Number is greater than 20.\n");
        }
    }
}    
