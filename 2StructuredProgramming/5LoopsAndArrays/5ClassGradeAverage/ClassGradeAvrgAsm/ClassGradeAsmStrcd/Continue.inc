Continue:
    
    movss   sum_avrg(%rip), %xmm0
    movss   students(, %rcx, 4), %xmm1
    addss   %xmm1, %xmm0
    movss   %xmm0, sum_avrg(%rip)
    
    incq    %rcx
    cmpq    $21, %rcx
    je      PropRangeLoop
    jne     AvrgCountLoop
    

    

