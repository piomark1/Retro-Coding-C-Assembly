RetNothing:
    movl    $40, %edi
    addl    $10, %edi
    movl    %edi, x(%rip)

    lea     OutStr(%rip), %rdi
    movl    x(%rip), %esi
    xorq    %rax, %rax
    call    ProgramOutput

    ret

.section const, "a"
    OutStr:    .ascii    "The sum of literal constants 10 and 40\n"
               .asciz    "is %d\n"             
