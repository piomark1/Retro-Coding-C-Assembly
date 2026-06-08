#Compiltation:
#           gcc -fno-pie -no-pie exercise1.s c.cpp -lstdc++ -z noexecstack

.section .text
ProgramOutput:
    pushq   %rbx
    xorq    %rax, %rax
    call    printf
    xorq    %rax, %rax
    popq    %rbx

    ret

    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx
    pushq   %rcx

    lea OutputStr(%rip), %rdi
    call    ProgramOutput

    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    OutputStr:  .asciz  "/Some text/\n"
.section .data
.section .bss
