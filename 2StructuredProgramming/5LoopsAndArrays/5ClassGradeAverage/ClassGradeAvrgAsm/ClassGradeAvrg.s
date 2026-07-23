#Compilation:
#       gcc -fno-pie -no-pie ClassGradeAvrg.s c.cpp -lstdc++ -z noexecstack
    
    .include    "InputOutput.inc"

.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    xorq    %rcx, %rcx
AvrgCountLoop:
    pushq   %rcx

    lea     InStr(%rip), %rdi
    incq    %rcx
    movq    %rcx, %rsi
    xorq    %rax, %rax
    call    ProgramOutput

    popq    %rcx
    
    lea     FmtIn(%rip), %rdi
    lea     students(, %rcx, 4), %rsi
    pushq   %rcx
    call    ProgramInput
    popq    %rcx
    
    PropRangeLoop:
        pushq   %rcx
        movss   students(, %rcx, 4), %xmm0
        ucomiss LowestGrd(%rip), %xmm0
        jc      WrongInput

        ucomiss HighstGrd(%rip), %xmm0
        jc      Continue
        jz      Continue

        WrongInput:
            pushq   %rcx
            lea     ErrStr(%rip), %rdi
            xorq    %rax, %rax
            call    ProgramOutput

            popq    %rcx
            lea     FmtIn(%rip), %rdi
            lea     students(, %rcx, 4), %rsi
            call    ProgramInput
            popq    %rcx
            jmp     PropRangeLoop
            

Continue:
    popq    %rcx
    movss   sum_avrg(%rip), %xmm0
    movss   students(, %rcx, 4), %xmm1
    addss   %xmm1, %xmm0
    movss   %xmm0, sum_avrg(%rip)

    incq    %rcx
    cmpq    $21, %rcx
    jne     AvrgCountLoop

    cvtsi2ss    %rcx, %xmm0
    movss       sum_avrg(%rip), %xmm1
    divss       %xmm0, %xmm1
    movss       %xmm1, sum_avrg(%rip)

    lea         AvrStr(%rip), %rdi
    cvtss2sd    sum_avrg(%rip), %xmm0
    xorq        %rax, %rax
    incq        %rax
    call        ProgramOutput
    
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section .rodata
    FmtIn:  .asciz  "%f"

    InStr:  .asciz  "Enter the average grades of student No %d: "
    ErrStr: .asciz  "Enter proper average grade value: "
    AvrStr: .asciz  "The class grades average is %.1f\n"

    LowestGrd:  .single 1.0
    HighstGrd:  .single 6.0

.section .data
    sum_avrg:    .single  0.0
    students:   .fill 21, 4, 0

.section .bss
