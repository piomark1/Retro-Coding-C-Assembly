        .include "ProgramInput.inc"
        .include "ProgramOutput.inc"
        .include "MulTwoInts.inc"
.section .text
    
        .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    
    lea     FirstNumIn(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     InputFmt(%rip), %rdi
    lea     FirstNum(%rip), %rsi
    call    ProgramInput

    lea     SecondNumIn(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     InputFmt(%rip), %rdi
    lea     SecondNum(%rip), %rsi
    call    ProgramInput
    
    movl    FirstNum(%rip), %edi
    movl    SecondNum(%rip), %esi
    call    MulTwoInts

    movl    %eax, %esi
    lea     OutputStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    addq    $16, %rsp
    popq    %rbp
    
    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
    
.section const, "a"
    InputFmt:       .asciz  "%d"  
    FirstNumIn:     .asciz  "Enter first number: \n"
    SecondNumIn:    .asciz  "Enter second number: \n"
    
    OutputStr:      .asciz  "%ld\n"
.section .data
    FirstNum:   .int    0
    SecondNum:  .int    0
.section .bss
