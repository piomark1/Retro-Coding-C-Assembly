#include <stdlib.h>
#include <stdio.h>

unsigned int number;
unsigned long sum;

int main(void)
{
    for( ; ; )
    {
        printf("Enter positive number from the range "
                "2 - 65535, enter 1 for finish\n");
        scanf("%u", &number);
        if (number == 1)
        {
            break;
        }
        else
        {
            sum+=number;
        }
    }
    printf("The sum of all entered nubers ");
    printf("is: %lu\n", sum);

    return 0;
}
