PropRangeLoop:
    cmpq    $21, %rcx
    je      Exit
    
    #pushq   %rcx
    movss   students(, %rcx, 4), %xmm0
    ucomiss LowestGrd(%rip), %xmm0
    jc  WrongInput

    ucomiss HighstGrd(%rip), %xmm0
    jc      Continue
    jz      Continue

    jmp    WrongInput

    Exit:

        ret

