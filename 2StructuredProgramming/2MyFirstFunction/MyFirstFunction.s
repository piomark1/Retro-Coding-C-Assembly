#Compilation:
#       gcc -fno-pie -no-pie MyFirstFunction.s MyFirstFunction.cpp -lstdc++ -z noexecstak
.section .text

    .global MyFirstFunction
MyFirstFunction:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    lea     OutStr(%rip), %rdi
    xorq    %rax, %rax
    call    printf
    xorq    %rax, %rax

    addq    $16, %rsp
    popq    %rbp

    ret

.section const, "a"
    OutStr: .ascii  "I am Your first function\n"
            .ascii  "which doesn't take any arguments\n"
            .asciz  "and return any values\n"
.section .data
.section .bss
