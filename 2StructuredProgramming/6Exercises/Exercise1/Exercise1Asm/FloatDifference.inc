FloatDifference:
    cvtss2sd   first_float(%rip), %xmm0
    cvtss2sd   second_float(%rip), %xmm1
    subsd   %xmm1, %xmm0
    
    ret
