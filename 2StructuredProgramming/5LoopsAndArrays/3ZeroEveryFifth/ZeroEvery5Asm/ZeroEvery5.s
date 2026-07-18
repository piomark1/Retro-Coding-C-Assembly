#Compilation:
#       gcc -fno-pie -no-pie c.cpp ZeroEvery5.s -lstdc++ -z noexecstack

    .include    "InputOutput.inc"

.section .text
    .global asmMain, 
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    xorq    %rcx, %rcx
Array_loop:
    
    movl    $0, Array(, %rcx, 4)
    addl    $5, %ecx
    cmpq    $100, %rcx
    jb      Array_loop
        
    lea     OutStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    xorq    %rax, %rax
    xorq    %rbx, %rbx
    movq    $10, %rbx

Print_Array_loop:
    lea     ArrOut(%rip), %rdi
    movl    Array(, %rax, 4), %esi
    pushq   %rax
    pushq   %rbx
    xorq    %rax, %rax
    call    ProgramOutput
    popq    %rbx
    popq    %rax
    incq    %rax
    pushq   %rax
    incq    %rax
    divq    %rbx
    popq    %rax
    cmpq    $0, %rdx
    jne     Print_Array_loop
    lea     NewLine(%rip), %rdi
    movl    Array(, %rax, 4), %esi
    pushq   %rax
    xorq    %rax, %rax
    call    ProgramOutput
    popq    %rax
    incq    %rax
    cmpq    $100, %rax
    jb      Print_Array_loop

ProgramExit:
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    ArrOut:     .asciz  "%d"
    NewLine:    .asciz "%d\n"
    OutStr:     .asciz "Array was set to zero every 5th step.\n"

.section .data
    Array:  .fill   100, 4, 1

.section .bss

