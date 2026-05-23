#Compilation:
#             gcc -fno-pie -no-pie weightrange.s c.cpp -lstdc++ -z noexecstack
        intStr:   .asciz "My weight is %d kg and all people"
        
        floatStr: .ascii " in range %.1f meters can't stop"
                  .asciz " looking at me.\n"

.section .text

intProgramOutput:
        pushq     %rbx
        xorq      %rax, %rax
        call      printf
        xorq      %rax, %rax
        popq      %rbx

        ret

floatProgramOutput:
        
        pushq     %rbx
        xorq      %rax, %rax
        incq      %rax
        call      printf
        xorq      %rax, %rax
        popq      %rbx

        ret
      
        .global asmMain
asmMain:
        pushq     %rbp
        movq      %rsp, %rbp
        pushq     %rbx
        pushq     %rcx

        lea       intStr(%rip), %rdi
        xorq      %rsi, %rsi
        movl      weight(%rip), %esi
        call      intProgramOutput

        lea       floatStr(%rip), %rdi
        cvtss2sd  range(%rip), %xmm0
        call      floatProgramOutput

        popq      %rcx
        popq      %rbx
        popq      %rbp

        xorq      %rdi, %rdi
        movq      $60, %rax

        syscall


.section .data
        
        weight:   .int      100
        range:    .single   10.3

.section .bss
