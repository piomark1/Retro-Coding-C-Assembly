AvrgCountLoop:
    pushq   %rcx

    lea     InStr(%rip), %rdi
    incq    %rcx
    movq    %rcx, %rsi
    xorq    %rax, %rax
    call    ProgramOutput

    popq    %rcx

    lea     FmtIn(%rip), %rdi
    lea     students(, %rcx, 4), %rsi
    pushq   %rcx
    call    ProgramInput
    popq    %rcx

    call    PropRangeLoop

