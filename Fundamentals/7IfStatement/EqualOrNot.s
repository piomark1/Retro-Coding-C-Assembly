#Compilation:
#           gcc -fno-pie -no-pie EqualOrNot.s c.cpp -lstdc++ -z noexecstack

.section .text
ProgramInput:
    pushq   %rbx
    xorq    %rax, %rax
    call    scanf
    xorq    %rax, %rax
    popq    %rbx
    ret
    
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
    
    lea     xInStr(%rip), %rdi
    call    ProgramOutput

    lea     InFmtStr(%rip), %rdi
    lea     x(%rip), %rsi
    call    ProgramInput

    lea     yInStr(%rip), %rdi
    call    ProgramOutput

    lea     InFmtStr(%rip), %rdi
    lea     y(%rip), %rsi
    call    ProgramInput

    movl    x(%rip), %eax
    cmpl    %eax, y(%rip)
    je      IsEqual
NotEqual:    
    movl    x(%rip), %eax
    movl    y(%rip), %ebx
    addl    %ebx, %eax
    movl    %eax, z(%rip)
    
    lea     NotEquStr(%rip), %rdi
    movl    z(%rip), %esi
    call    ProgramOutput
    jmp     ProgramExit

IsEqual:
    movl    x(%rip), %eax
    movl    y(%rip), %ebx
    divl    %ebx
    movl    %eax, z(%rip)

    lea     IsEquStr(%rip), %rdi
    movl    z(%rip), %esi
    call    ProgramOutput

ProgramExit:
    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    xInStr:     .asciz  "Enter first number: \n"
    yInStr:     .asciz  "Enter sectond number: \n"
    
    InFmtStr:   .asciz  "%d"
    
    NotEquStr:  .asciz  "\nJust calculated the sum: %d\n"
    IsEquStr:   .asciz  "\nJust calculated the quotient: %d\n"
.section .data
    x:  .int    0
    y:  .int    0
    z:  .int    0
.section .bss
