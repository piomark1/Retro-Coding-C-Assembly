#Compilation:
#           gcc -fno-pie -no-pie firstarithmetic.s c.cpp -lstdc++ -z noexecstack

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
    movq    %rsp, %rbx
    pushq   %rbx
    pushq   %rcx

#Floating poitn registers prep.
    pxor    %xmm0, %xmm0
    pxor    %xmm1, %xmm1
    pxor    %xmm2, %xmm2

#Conversion from integer to floating point numbers.
    xorq        %rax, %rax
    movl        R(%rip), %eax
    cvtsi2ss    %rax, %xmm2
    cvtsi2ss    %rax, %xmm1

#SpherArea = 4*PI*R*R;
    mulss       %xmm2, %xmm1
    pxor        %xmm2, %xmm2
    movss       PI(%rip), %xmm2
    mulss       %xmm2, %xmm1
    xorq        %rax, %rax
    movq        $4, %rax
    cvtsi2ss    %rax, %xmm2
    mulss       %xmm2, %xmm1
    movss       %xmm1, SphereArea(%rip)

#Result output
    lea         fmtStr(%rip), %rdi
    cvtss2sd    SphereArea(%rip), %xmm0
    call        floatProgramOutput

    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
    

.section const, "a"
    
    fmtStr:     .asciz  "Area of a sphere is %f\n"
    
    PI:         .single 3.14
    R:          .int    5

.section .data
    
    SphereArea:  .single 0.0

.section .bss
