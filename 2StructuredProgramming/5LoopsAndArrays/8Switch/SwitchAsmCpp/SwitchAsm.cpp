#include <stdlib.h>
#include <stdio.h>

int value;

int main(void)
{
    printf("Enter value from 1-3: ");
    scanf("%d", &value);

    __asm__("xorq   %rbx, %rbx\n"
            "movl   value(%rip), %ebx\n"
            "cmpl   $1, %ebx\n"
            "je     Case1\n"
            "cmpl   $2, %ebx\n"
            "je     Case2\n"
            "cmpl   $3, %ebx\n"
            "je     Case3\n"
            "jne    Default\n");
    
    __asm__("Case1:\n");
            
            printf("You've entered 1\n");
    
    __asm__("jmp Break\n"
            "Case2:\n");
            
            printf("You've entered 2\n");
    
    __asm__("jmp Break\n"
            "Case3:\n");
            
            printf("You've entered 3\n");
    
    __asm__("jmp Break\n"
            "Default:\n");
            
            printf("?!...\n");


    __asm__("Break:\n"
            "   nop\n");
    return 0;
}
