ProgramOutput:
    pushq   %rbx
    call    printf
    xorq    %rax, %rax
    popq    %rbx

    ret
