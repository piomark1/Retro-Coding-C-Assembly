#Compilation:
#           gcc -fno-pie -no-pie c.cpp horrorsound.s -lstdc++ -z noexecstack

        Str:    .ascii  "What a horrible sound!!!\7\7\7\7\n"

.section .data
.section .bss
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
    pushq   %rax
    pushq   %rbx

    lea     Str(%rip), %rdi
    call    ProgramOutput

    popq    %rbx
    popq    %rax

    xorq    %rdi, %rdi
    xorq    %rax, %rax
    movq    $60, %rax

    syscall
