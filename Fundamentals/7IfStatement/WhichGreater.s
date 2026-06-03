#Compile:
#       gcc -fno-pie -no-pie WchichGreater.s c.cpp -lstdc++ -z noexecstack
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

    lea     xInputStr(%rip), %rdi
    call    ProgramOutput

    lea     InputFmt(%rip), %rdi
    lea     x(%rip), %rsi
    call    ProgramInput

    lea     yInputStr(%rip), %rdi
    call    ProgramOutput

    lea     InputFmt(%rip), %rdi
    lea     y(%rip), %rsi
    call    ProgramInput

    xGreater:
        movl    y(%rip), %eax
        cmpl    %eax, x(%rip)
        jbe     yGreaterEqual

        lea     xStr(%rip), %rdi
        movl    x(%rip), %esi
        call    ProgramOutput
        jmp     ProgramExit

    yGreaterEqual:
        lea     yStr(%rip), %rdi
        movl    y(%rip), %esi
        movl    x(%rip), %edx
        call    ProgramOutput

ProgramExit:
    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    InputFmt:   .asciz  "%d"

    xInputStr:  .asciz  "Enter first number: \n"
    yInputStr:  .asciz  "Enter second nuber: \n"
    
    xStr:   .asciz  "Number %d is greater\n"
    yStr:   .ascii  "Number %d is greater than "
                .asciz  "or equal to the number %d\n"

.section .data
    x:  .int    0
    y:  .int    0
.section .bss
