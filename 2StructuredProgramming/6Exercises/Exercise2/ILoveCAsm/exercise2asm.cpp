#include <stdlib.h>  
#include <stdio.h>

void ILoveC(void);

char LoveString[] = "I love C!!!\n\000";
char *LSptr = LoveString;

int main(void)
{
  ILoveC();

  return 0;
}
void ILoveC(void)
{
     __asm__("pushq  %rbx\n"
            "xorq   %rax, %rax\n"
            "movq   LSptr(%rip), %rdi\n"  //"lea    LoveString(%rip), %rdi\n"
            "call   printf\n"
            "xorq   %rax, %rax\n"
            "popq   %rbx\n"); 
}
