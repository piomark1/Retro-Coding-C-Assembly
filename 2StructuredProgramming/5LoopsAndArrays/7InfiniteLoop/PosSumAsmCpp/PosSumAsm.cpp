#include <stdlib.h>
#include <stdio.h>

unsigned int number;
unsigned long sum;

int main(void)
{
    __asm__("InfLoop:\n");
    
    printf("Enter positive number from the range "
            "2 - 65535, enter 1 for finish\n");
    
    scanf("%u", &number);
    
    __asm__("xorq   %rax, %rax\n"
            "movl number(%rip), %eax\n "
            "cmpl   $1, %eax\n"
            "je     Exit\n"
            "xorq   %rbx, %rbx\n"
            "movl   sum(%rip), %ebx\n"
            "addl   %eax, %ebx\n"
            "movl   %ebx, sum(%rip)\n"
            "jmp    InfLoop\n"
            "Exit:\n"
            "   nop\n");
    
    printf("The sum of all entered numbers "
            "is: %lu\n", sum);

    return 0;
}
