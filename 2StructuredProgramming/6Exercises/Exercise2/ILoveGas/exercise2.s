# Compilation:
#   gcc -fno-pie -no-pie exercise2.s c.cpp -lstdc++ -z noexecstack   
    .include "InputOutput.inc"
    .include "LoveStatement.inc"
.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    call    LoveStatement

ProgramExit:
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
.section .rodata
.section .data
    OutStr: .asciz  "I love Gas!!!\n"
.section .bss
