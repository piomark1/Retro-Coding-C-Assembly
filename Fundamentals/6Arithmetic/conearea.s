#Compilation:
#           gcc -fno-pie -no-pie conarea.s c.cpp -lstdc++ -z noexecstack
.section .text
floatProgramOutput:
    pushq   %rbx
    xorq    %rax, %rax
    incq    %rax
    call    printf
    xorq    %rax, %rax
    popq    %rbx
    ret

    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx
    pushq   %rcx

    pxor    %xmm0, %xmm0
    pxor    %xmm1, %xmm1
    pxor    %xmm2, %xmm2

    xorq    %rax, %rax
    xorq    %rbx, %rbx

    movl    H(%rip), %eax
    movl    R(%rip), %ebx
#sqrt(R*R + H*H)
    cvtsi2ss    %rax, %xmm2
    movss       %xmm2, %xmm1
    mulss       %xmm2, %xmm1
    movss       %xmm1, %xmm0

    cvtsi2ss    %rbx, %xmm2
    movss       %xmm2, %xmm1
    mulss       %xmm2, %xmm1
    addss       %xmm0, %xmm1
    sqrtss      %xmm1, %xmm0

#R + sqrt(R*R + H*H)
    cvtsi2ss    %rbx, %xmm2
    addss       %xmm2,%xmm0

#PI*R*(R+sqrt(H*H + R*R))
    cvtsi2ss    %rbx, %xmm2
    movss       PI(%rip), %xmm1
    mulss       %xmm2,  %xmm1
    mulss       %xmm1,  %xmm0

    movss       %xmm0, ConeArea(%rip)


    lea         fmtStr(%rip), %rdi
    cvtss2sd    ConeArea(%rip), %xmm0
    call        floatProgramOutput

    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    fmtStr: .asciz  "The area of the cone is %.2f\n"
    R:      .int    10
    H:      .int    10
    PI:     .single 3.14
.section .data
    ConeArea:   .single 0.0
.section .bss
