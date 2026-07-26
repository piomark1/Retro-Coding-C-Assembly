WhatAverage:
    divss   %xmm0, %xmm1
    movss   %xmm1, class_avrg(%rip)

    ret
