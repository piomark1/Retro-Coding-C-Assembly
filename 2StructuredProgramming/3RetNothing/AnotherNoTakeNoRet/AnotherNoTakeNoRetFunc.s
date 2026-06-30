.section .text
    
    .global NoTakeNoRet
NoTakeNoRet:
    
    movl    $40, %eax
    addl    $10, %eax

    movl    %eax, x(%rip)

    lea      OutStr(%rip), %rdi
    movl     x(%rip), %esi
    pushq    %rbx
    xorq     %rax, %rax
    call     printf
    xorq     %rax, %rax
    popq     %rbx
    
    ret

.section const, "a"
    OutStr: .ascii  "The sum of literal constants 10 and 40 "
            .asciz  "is %d\n"
