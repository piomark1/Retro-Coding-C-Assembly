#Compilation:
#           gcc -fno-pie -no-pie ThreeValuesABC.s c.cpp -lstdc++ -z noexecstack

.section .text
ProgramInput:
    pushq   %rbx
    xorq    %rax, %rax
    call    scanf
    xorq    %rax, %rax
    popq    %rbx

    ret
ProgramOutput:
    pushq   %rbx
    xorq    %rax, %rax
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

#printf()
    lea     aInputStr(%rip), %rdi
    call    ProgramOutput
#scanf()
    lea     fmtInput(%rip), %rdi
    lea     a(%rip), %rsi
    call    ProgramInput
#printf()
    lea     bInputStr(%rip), %rdi
    call    ProgramOutput
#scanf()
    lea     fmtInput(%rip), %rdi
    lea     b(%rip), %rsi
    call    ProgramInput
#printf()
    lea     cInputStr(%rip), %rdi
    call    ProgramOutput
#scanf()
    lea     fmtInput(%rip), %rdi
    lea     c(%rip), %rsi
    call    ProgramInput

#if(a > c && b > a)
A_grtr_C_AND_B_grtr_A:
    movl    a(%rip), %eax
    cmpl    c(%rip), %eax
    ja      aGreater
    jbe     B_lwr_C_OR_B_lwr_A
             
             aGreater:
                cmpl    b(%rip), %eax
                jb      bGreater
                jae     B_lwr_C_OR_B_lwr_A
             bGreater:
             #d = a*b*c
                movl    a(%rip), %eax
                mull    b(%rip)
                mull    c(%rip)
                movl    %eax, d(%rip)

                lea     aOutputStr(%rip), %rdi
                movl    d(%rip), %esi
                call    ProgramOutput

# if(b < c || b < a)
B_lwr_C_OR_B_lwr_A:
    movl    b(%rip), %eax
    cmpl    c(%rip), %eax
    jb      ORisTrue
    jae     cGreater

    cGreater:
        cmpl    a(%rip), %eax
        jb      ORisTrue
        jae     C_grtr_A_AND_B_NOT_5

    ORisTrue:
        divl    a(%rip)
        movl    %eax, d(%rip)
        
        lea     bOutputStr(%rip), %rdi
        movl    d(%rip), %esi
        call    ProgramOutput
         
#if((c > a && b != 5) || (b > c && a != 0))
C_grtr_A_AND_B_NOT_5:
    
    movl    c(%rip), %eax
    cmpl    a(%rip), %eax
    ja      isbNOT5
    jbe     ANDnotTrue

    isbNOT5:
        movl    b(%rip), %eax
        cmpl     $5, %eax
        je      ANDnotTrue
        jne     orIsTrue
    
    ANDnotTrue:
        movl    b(%rip), %eax
        cmpl    c(%rip), %eax
        ja      isAnot0
        jmp     ProgramExit

    isAnot0:
            movl    a(%rip), %eax
            cmpl    $0, %eax
            jne     orIsTrue
            jmp     ProgramExit
    
    orIsTrue:
        movl    a(%rip), %eax
        addl    b(%rip), %eax
        addl    c(%rip), %eax
        movl    %eax, d(%rip)

        lea     cOutputStr(%rip), %rdi
        movl    d(%rip), %esi
        call    ProgramOutput

ProgramExit:
    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall


.section const, "a"
    aInputStr:  .asciz  "Enter first number: \n"
    bInputStr:  .asciz  "Enter second number: \n"
    cInputStr:  .asciz  "Enter third number: \n"

    fmtInput:   .asciz  "%d"

    aOutputStr: .ascii  "The value of three variables has been "
                .asciz  "multiplied, the product: %d\n"

    bOutputStr: .ascii  "The value of variable b has been divided "
                .asciz  "by a, the quotient: %d\n"

    cOutputStr: .ascii  "Values of all variables have been added, "
                .asciz  "the sum: %d\n"
.section .data
    a:  .int 0
    b:  .int 0
    c:  .int 0
    d:  .int 0
.section .bss
