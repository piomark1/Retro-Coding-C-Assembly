#Compilation:
#           gcc -fno-pie -no-pie exercise2.s c.cpp -lstdc++ -z noexecstack

        .equ    AGE, 20
.section .text
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

        lea     OutputStr(%rip), %rdi
        xorq    %rsi, %rsi
        movb    $AGE, %sil
        movl    age(%rip), %edx
        call    ProgramOutput

        popq    %rcx
        popq    %rbx
        popq    %rax

        xorq    %rdi, %rdi
        movq    $60, %rax

        syscall


.section const, "a"
    OutputStr:  .asciz  "'AGE' is %d, 'age' is  %d\n"
    #.equ    AGE, 20
    age:    .int    20
.section .data
.section .bss

