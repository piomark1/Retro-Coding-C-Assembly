.section .text
    .global TakeAndRet
TakeAndRet:
    pushq   %rdx
    pushq   %rsi
    pushq   %rdi

    imull   %esi, %edi
    imull   $100, %edx

    cmpl    %edx, %edi
    ja      Return_x

    popq    %rdi
    popq    %rsi
    popq    %rdx

    movl    %esi, %eax

    ret

Return_x:
    popq    %rdi
    popq    %rsi
    popq    %rdx

    movl    %edi, %eax

    ret
    
