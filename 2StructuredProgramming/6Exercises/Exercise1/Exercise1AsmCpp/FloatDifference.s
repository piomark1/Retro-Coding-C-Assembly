.section .text
    .global FloatDifference
FloatDifference:
    subss   %xmm1, %xmm0
    ret
