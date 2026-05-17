#Compilation:
#             gcc -fno-pie -no-pie c.cpp ilove.s -lstd++ -z noexecstack
    Str: .asciz "I love \t\tprogramming\n"

.section .data
.section .bss

.section .text

ProgramOutput:
    pushq %rbx
    xorq  %rax, %rax
    call  printf
    xorq  %rax, %rax
    popq  %rbx
    ret

    .global asmMain
asmMain:
    pushq %rbp
    movq  %rsp, %rbp
    pushq %rax
    pushq %rbx

    lea   Str(%rip),  %rdi
    call  ProgramOutput

    popq  %rax
    popq  %rbx
    popq  %rbp
    
    xorq  %rdi, %rdi
    syscall
