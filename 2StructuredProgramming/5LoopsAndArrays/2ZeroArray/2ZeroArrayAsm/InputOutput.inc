ProgramInput:
    pushq   %rbx
    xorq    %rax, %rax
    call    scanf
    xorq    %rax, %rax
    popq    %rbx

    ret

ProgramOutput:
    pushq   %rbx
    call    printf
    xorq    %rax, %rax
    popq    %rbx

    ret
