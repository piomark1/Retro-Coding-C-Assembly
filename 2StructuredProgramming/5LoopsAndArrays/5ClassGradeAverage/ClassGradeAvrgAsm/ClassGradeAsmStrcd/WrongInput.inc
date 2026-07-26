WrongInput:
    pushq   %rcx
    lea     ErrStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    popq    %rcx
    lea     FmtIn(%rip), %rdi
    lea     students(, %rcx, 4), %rsi
    pushq   %rcx
    call    ProgramInput
    popq    %rcx
    jmp     PropRangeLoop

