#include <stdlib.h>
#include <stdio.h>

int n;

int main(void)
{
    __asm__(
            "xorq   %rbx, %rbx\n"
            "xorq   %rcx, %rcx\n"
            "movq   $10, %rbx\n"
            "Loop:\n"
            "   cmpq    %rbx, %rcx\n"
            "   je  End\n"
            "pushq  %rbx\n"
            "pushq  %rcx\n"
            "movl   %ecx, n(%rip)\n"
            );
            
    printf("%d: I love Summer!\n", n+1);

    __asm__(
            "popq   %rcx\n"
            "popq   %rbx\n"
            "incq   %rcx\n"
            "jmp    Loop\n"
            "End:\n"
            "   nop\n"
            );

    return 0;
}
