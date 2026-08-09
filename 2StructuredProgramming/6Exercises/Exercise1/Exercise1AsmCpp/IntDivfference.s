.section .text
    .global IntDifference
IntDifference:
    subl    %esi, %edi
    movl    %edi, %eax

    ret
