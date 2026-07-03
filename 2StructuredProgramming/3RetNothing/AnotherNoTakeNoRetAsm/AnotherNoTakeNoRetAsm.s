#Compilation:
#       gcc -fno-pie -no-pie AnotherNoTakeNoRetAsm.s c.cpp -lstdc++ -z noexecstack
        .include "InputOutput.inc"
        .include "RetNothing.inc"
.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
        
    call    RetNothing
    
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    OutStr: .ascii  "The sum of literal constants 10 and 40\n"
            .asciz  "is %d, \n"

.section .data
    x:  .int    0
.section .bss
