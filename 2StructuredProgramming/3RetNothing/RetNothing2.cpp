#include <stdio.h>
#include <stdlib.h>

void RetNothing(int x);
int number;

int main(void)
{

    printf("Enter the number: \n");
    scanf("%d", &number);
    RetNothing(number);
    return 0;
}
void RetNothing(int x)
{
    __asm__(
            "cmpl   $20, %edi\n"
            "jae    AboveOrEqual\n");
            printf("The number is lower than 20.\n");
    __asm__("leave\n"
            "ret\n");        
    
    __asm__("AboveOrEqual:\n"
            "   cmpl   $20, %edi\n"
            "   ja     Above\n");
            printf("The number is equal to 20. \n");        
    __asm__("leave\n"
            "ret\n");
    
    __asm__("Above:\n");
            printf("The number is greater than 20.\n");
}
