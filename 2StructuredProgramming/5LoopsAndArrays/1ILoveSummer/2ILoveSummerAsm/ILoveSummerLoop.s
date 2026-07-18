#Compilation:
#       gcc -fno-pie -no-pie ILoveSummerLoop.s c.cpp -lstdc++ -z nexecstack
.include    "InputOutput.inc"
.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    xorq    %rax, %rax
Loop:
    cmpq    $10, %rax
    je      ProgramExit

    pushq   %rax
    lea     OutStr(%rip), %rdi
    incl    %eax
    movl    %eax, n(%rip)
    movl    n(%rip), %esi
    xorq    %rax, %rax
    call    ProgramOutput
    popq    %rax
    incq    %rax
    jmp     Loop

ProgramExit:

    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section .rodata
    OutStr: .asciz  "%d: I love Summer!\n"
.section .data
    n:  .int    0
.section .bss
