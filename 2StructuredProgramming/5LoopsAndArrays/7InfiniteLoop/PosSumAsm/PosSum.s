#Compilation:
#       gcc -fno-pie -no-pie PosSum.s c.cpp -lstdc++ -z noexecstack

    .include    "InputOutput.inc"
.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

InfLoop:
    lea     InStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    
    lea     FmtStr(%rip), %rdi
    lea     number(%rip), %rsi
    call    ProgramInput
    
    xorq    %rax, %rax
    movl    number(%rip), %eax
    cmpl    $1, %eax
    je      ProgramExit

    xorq    %rax, %rax
    movl    sum(%rip), %eax
    addl    number(%rip), %eax
    movl    %eax, sum(%rip)
    jmp     InfLoop

ProgramExit:

    lea     OutStr(%rip), %rdi
    movl    sum(%rip), %esi
    xorq    %rax, %rax
    call    ProgramOutput
    
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section .rodata
    FmtStr: .asciz "%u"
    InStr:  .ascii  "Enter positive nuber from the range "
            .asciz  "2 - 65535, enter 1 for finis\n"
    
    OutStr: .ascii  "The sum of all entered numbers "
            .asciz  "is: %lu\n"

.section .data
    number: .int 0
    sum:    .int 0
.section .bss
