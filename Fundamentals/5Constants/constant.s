#Compilation:
#           gcc -fno-pie -no-pie constant.s c.cpp -lstdc++ -z noexecstack

.section .text
          .global asmMain
asmMain:
          pushq   %rbp
          movq    %rsp, %rbp
          pushq   %rbx
          pushq   %rcx

          lea       floatStr(%rip), %rdi
          cvtss2sd  Pi(%rip), %xmm0
          xorq      %rax, %rax
          incq      %rax
          call      printf
          xorq      %rax, %rax

          popq      %rcx
          popq      %rbx
          popq      %rbp

          xorq      %rdi, %rdi
          movq      $60, %rax

          syscall

.section const, "a"
         Pi:    .single 3.14
         floatStr:  .asciz  "The value of Pi number is: %.2f\n"

.section .data
.section .bss
