#include <stdlib.h>
#include <stdio.h>

int array[40];
int counter;

int main(void)
{
    __asm__("xorq   %rbx, %rbx\n"
            "xorq   %rcx, %rcx\n"
            "movl   $40, %ebx\n"
            "Loop:\n"
            "   cmpl    %ebx, %ecx\n"
            "   je      End\n"
            "   movl    $0, array(, %ecx, 4)\n"
            "   incl    %ecx\n"
            "   jmp     Loop\n"
            "End:\n"
            "   nop\n"
            );
    
    printf("The array was set to 0.\n\n");
    
    for(counter=0; counter<40; counter++)
    {
        if ((counter+1)%10 == 0) 
        {
            printf("%d\n", array[counter]);
        }
        else
        {
            printf("%d", array[counter]);
        }
    }
    
    printf("\n");
    return 0;
}
