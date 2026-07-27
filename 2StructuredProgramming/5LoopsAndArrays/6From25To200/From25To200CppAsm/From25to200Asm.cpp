#include <stdlib.h>
#include <stdio.h>

int counter;

int main(void)
{
  counter = 25;
  __asm__("  xorq  %rbx, %rbx\n"
          "  movl  counter(%rip), %ebx\n"
          "While_loop:\n"
          "  cmpl  $200, %ebx\n"
          "  ja  Exit\n"
          "  pushq  %rbx\n");
          printf("Counter: %d\n", counter);
  __asm__("  popq  %rbx\n"
          "  incl  %ebx\n"
          "  movl  %ebx, counter(%rip)\n"
          "  jmp  While_loop\n"
          "Exit:\n"
          "  nop\n");
  return 0;
}
