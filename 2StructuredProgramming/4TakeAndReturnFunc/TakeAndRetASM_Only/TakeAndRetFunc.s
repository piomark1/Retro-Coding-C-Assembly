#Compilation:
#       gcc -fno-pie -no-pie TakeAndRetFunc.s c.cpp -lstdc++ -z noexecstack
    .include "InputOutput.inc"
    .include "TakeAndRet.inc"

.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    lea     aInStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    
    lea     InStr(%rip), %rdi
    lea     a(%rip), %rsi
    pushq   %rdi
    call    ProgramInput

    lea     bInStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    popq    %rdi
    lea     b(%rip), %rsi
    pushq   %rdi
    call    ProgramInput

    lea     cInStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    popq    %rdi
    lea     c(%rip), %rsi
    call    ProgramInput
    
    movl    c(%rip), %edx
    movl    b(%rip), %esi
    movl    a(%rip), %edi
    call    TakeAndRet

    movl    %eax, score(%rip)

    lea     OutStr(%rip), %rdi
    movl    score(%rip), %esi
    xorq    %rax, %rax
    call    ProgramOutput

    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    
    InStr:  .asciz  "%d"

    aInStr: .asciz  "First number: \n"
    bInStr: .asciz  "Second number: \n"
    cInStr: .asciz  "Third number:  \n"

    OutStr: .asciz  "The score is %d\n"

.section .data
    a:      .int    0
    b:      .int    0
    c:      .int    0
    score:  .int    0
.section .bss
