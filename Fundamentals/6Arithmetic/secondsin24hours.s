#Compilation:
#           gcc -fno-pie -no-pie secondsin24hours.s c.cpp -lstdc++ -z noexecstack
.section .text
intProgramOutput:
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
        
        movq    $24, %rax
        movq    min_in_hour(%rip), %rbx
        movq    sec_in_min(%rip), %rcx

        mulq    %rbx
        mulq    %rcx
        
        movl    %eax, sec_in_day(%rip)

        lea     fmtStr(%rip), %rdi
        movq    sec_in_day(%rip), %rsi
        call    intProgramOutput


    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    fmtStr: .asciz  "The number of seconds in a day is %d\n"
    
    min_in_hour:    .int 60
    sec_in_min:     .int 60
.section .data
    sec_in_day: .int 0
.section .bss
