#Compilation:
#           gcc -fno-pie -no-pie cyliderarea.s c.cpp -lstdc++ -z noexecstack
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
    
#(2*PI*R*R)
    xorq        %rax, %rax
    movl        R(%rip), %eax
    cvtsi2ss    %rax, %xmm2
    cvtsi2ss    %rax, %xmm1

    mulss   %xmm2, %xmm1
    movss   PI(%rip), %xmm2
    mulss   %xmm2, %xmm1

    movq        $2, %rax
    cvtsi2ss    %rax, %xmm2
    mulss       %xmm2, %xmm1
    movss       %xmm1, %xmm0

#(2*PI*R*H)
    movl        H(%rip), %eax
    cvtsi2ss    %rax, %xmm2
    movl        R(%rip), %eax
    cvtsi2ss    %rax, %xmm1
    mulss       %xmm2, %xmm1

    movss       PI(%rip), %xmm2
    mulss       %xmm2, %xmm1
    movq        $2, %rax
    cvtsi2ss    %rax, %xmm2
    mulss       %xmm2, %xmm1

#(2*PI*R*H) + (2*PI*R*R)
    
    addss   %xmm1, %xmm0
    movss   %xmm0, CylinderArea(%rip)

    lea         fmtStr(%rip), %rdi
    cvtss2sd    CylinderArea(%rip), %xmm0
    call        floatProgramOutput

    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    fmtStr: .asciz  "The area of a cylinder is %.2f\n"
    PI:     .single 3.14
    R:      .int    10
    H:      .int    20
.section .data
    CylinderArea:   .single 0.0
.section .bss
