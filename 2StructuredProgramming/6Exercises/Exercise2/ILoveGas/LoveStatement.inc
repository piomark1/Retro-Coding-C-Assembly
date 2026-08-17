LoveStatement:
    lea     OutStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    ret
