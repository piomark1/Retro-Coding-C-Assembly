RetNothing:
    movl    $40, %edi
    addl    $10, %edi
    movl    %edi, x(%rip)

    lea     OutStr(%rip), %rdi
    movl    x(%rip), %esi
    xorq    %rax, %rax
    call    ProgramOutput

    ret
