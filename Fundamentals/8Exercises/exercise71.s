#Compilation:
#          gcc -fno-pie -no-pie exercise71.s c.cpp -lstdc++ -z noexecstak

.section .text
ProgramInput:
    pushq  %rbx
    xorq   %rax, %rax
    call   scanf
    xorq   %rax, %rax
    popq   %rbx

    ret

ProgramOutput:
    pushq  %rbx
    call   printf
    xorq   %rax, %rax
    popq   %rbx

    ret

    .global  asmMain
asmMain:
    pushq  %rbp
    movq   %rsp, %rbp 
    subq   $16, %rsp

    lea     NumInStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     FmtInStr(%rip), %rdi
    pushq   %rdi
    lea     a(%rip), %rsi
    call    ProgramInput
    
    popq    %rdi
    lea     b(%rip), %rsi
    pushq   %rdi
    call    ProgramInput
    
    popq    %rdi
    lea     c(%rip), %rsi
    pushq   %rdi
    call    ProgramInput

    popq    %rdi
    lea     d(%rip), %rsi
    pushq   %rdi
    call    ProgramInput

    popq    %rdi
    lea     e(%rip), %rsi
    call    ProgramInput

Test_A:
    movl    a(%rip), %eax
    
    test_b:
        cmpl    b(%rip), %eax
        jge     test_c
        jmp     Test_B
    
        test_c:
            cmpl    c(%rip), %eax
            jge     test_d
            jmp     Test_B
        
            test_d:
                cmpl    d(%rip), %eax
                jge     test_e
                jmp     Test_B
            
                test_e:
                    cmpl    e(%rip), %eax
                    jge     Test_A_Out
                    jmp     Test_B
                
                    Test_A_Out:
                        lea     OutStrA(%rip), %rdi
                        movl    %eax, %esi
                        xorq    %rax, %rax
                        call    ProgramOutput
Test_B:
    movl    b(%rip), %eax

    test_a:
        cmpl    a(%rip), %eax
        jge     test_c1
        jmp     Test_C
        
        test_c1:
            cmpl    c(%rip), %eax
            jge     test_d1
            jmp     Test_C

            test_d1:
                cmpl    d(%rip), %eax
                jge     test_e1
                jmp     Test_C

                test_e1:
                    cmpl    e(%rip), %eax
                    jge     Test_B_Out
                    jmp     Test_C

                    Test_B_Out:
                        lea     OutStrB(%rip), %rdi
                        movl    %eax, %esi
                        xorq    %rax, %rax
                        call    ProgramOutput
Test_C:
    movl    c(%rip), %eax
    
    test_a1:
        cmpl    a(%rip), %eax
        jge     test_b1
        jmp     Test_D
        
        test_b1:
            cmpl    b(%rip), %eax
            jge     test_d2
            jmp     Test_D

            test_d2:
                cmpl    d(%rip), %eax
                jge     test_e2
                jmp     Test_D
                
                test_e2:
                    cmpl    e(%rip), %eax
                    jge     Test_C_Out
                    jmp     Test_D

                    Test_C_Out:
                        lea     OutStrC(%rip), %rdi
                        movl    %eax, %esi
                        xorq    %rax, %rax
                        call    ProgramOutput
Test_D:
    movl    d(%rip), %eax
    
    test_a2:
        cmpl    a(%rip), %eax
        jge     test_b2
        jmp     Test_E

        test_b2:
            cmpl    b(%rip), %eax
            jge     test_c2
            jmp     Test_E
            
            test_c2:
                cmpl    c(%rip), %eax
                jge     test_e3
                jmp     Test_E

                test_e3:
                    cmpl    e(%rip), %eax
                    jge     Test_D_Out
                    jmp     Test_E

                    Test_D_Out:
                        lea     OutStrD(%rip), %rdi
                        movl    %eax, %esi
                        xorq    %rax, %rax
                        call    ProgramOutput
Test_E:
    movl    e(%rip), %eax

    test_a3:
        cmpl    a(%rip), %eax
        jge     test_b3
        jmp     ProgramExit

        test_b3:
            cmpl    b(%rip), %eax
            jge     test_c3
            jmp     ProgramExit
            
            test_c3:
                cmpl    c(%rip), %eax
                jge     test_d3
                jmp     ProgramExit

                test_d3:
                    cmpl    d(%rip), %eax
                    jge     Test_E_Out
                    jmp     ProgramExit

                    Test_E_Out:
                        lea     OutStrE(%rip), %rdi
                        movl    %eax, %esi
                        xorq    %rax, %rax
                        call    ProgramOutput

ProgramExit:
    addq    $16, %rsp
    popq    %rbp
    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
    
.section const, "a"
    NumInStr:   .asciz  "Enter five numbers:\n"
    FmtInStr:   .asciz  "%d"  
    
    OutStrA:    .asciz  "The largest number is a: %d\n"
    OutStrB:    .asciz  "The largest number is b: %d\n"
    OutStrC:    .asciz  "The largest number is c: %d\n"
    OutStrD:    .asciz  "The largest number is d: %d\n"
    OutStrE:    .asciz  "The largest number is e: %d\n"

.section .data
    a:    .int    0
    b:    .int    0
    c:    .int    0
    d:    .int    0
    e:    .int    0
.section .bss
