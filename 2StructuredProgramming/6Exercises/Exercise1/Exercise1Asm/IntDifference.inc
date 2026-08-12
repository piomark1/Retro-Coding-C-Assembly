IntDifference:
    movl    first(%rip), %esi
    subl    second(%rip), %esi

    ret
