#Compilation:
#       gcc -fno-pie -no-pie From25to200.s c.cpp -lstdc++ -z noexecstack
    .include "InputOutput.inc"

.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    movl    $25, counter(%rip);

    xorq    %rbx, %rbx
    movl    counter(%rip), %ebx
While_loop:
    cmpl    $200, %ebx
    ja      Exit
    
    lea     OutStr(%rip), %rdi
    movl    counter(%rip), %esi
    xorq    %rax, %rax
    pushq   %rbx
    call    ProgramOutput

    popq    %rbx
    incl    %ebx
    movl    %ebx, counter(%rip)
    jmp     While_loop
    
    Exit:
        nop


    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
.section .rodata
    OutStr: .asciz  "Counter: %d\n"
.section .data
    counter:    .int    0
.section .bss
