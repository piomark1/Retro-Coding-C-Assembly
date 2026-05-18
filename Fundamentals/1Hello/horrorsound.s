#Compilation:
#           gcc -fno-pie -no-pie c.cpp horrorsound.s -lstdc++ -z noexecstack

        Str:    .asciz  "What a horrible sound!!!\7\7\7\7\n" #Try replace '\7' with '\a'

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
    popq    %rbp
        
    xorq    %rdi, %rdi
    xorq    %rax, %rax
    movq    $60, %rax

    syscall
