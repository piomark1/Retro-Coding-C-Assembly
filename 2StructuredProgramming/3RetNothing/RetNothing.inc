RetNothing:
    cmpl    $20, %edi
    jae     AboveOrEqual
    
    lea     Below20Str(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    ret

    AboveOrEqual:
        cmpl    $20, %edi
        jne     Above

        lea     Equal20Str(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        ret

    Above:
        lea     Great20Str(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        ret
