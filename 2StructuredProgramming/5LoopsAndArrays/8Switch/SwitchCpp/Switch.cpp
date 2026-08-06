#include <stdlib.h>
#include <stdio.h>

int value;

int main(void)
{   
    printf("Enter value from 1-3: ");
    scanf("%d", &value);
    
    switch(value)
    {
        case 1:
        {
            printf("You've entered 1\n");
            break;
        }
        case 2:
        {
            printf("You've entered 2\n");
            break;
        }
        case 3:
        {
            printf("You've entered 3\n");
            break;
        }
        default:
        {
            printf("?!...\n");
        }
    }
        
    return 0;
}
