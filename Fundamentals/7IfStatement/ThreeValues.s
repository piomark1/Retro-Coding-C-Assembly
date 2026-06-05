#Compile:
#       gcc -fno-pie -no-pie ThreeValues.s c.cpp -lstdc++ -z noexecstack
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
    
#printf();
    lea     xInputStr(%rip), %rdi
    call    ProgramOutput

#scanf();
    lea     InputFmt(%rip), %rdi
    lea     x(%rip), %rsi
    call    ProgramInput

#printf();
    lea     yInputStr(%rip), %rdi
    call    ProgramOutput

#scanf();    
    lea     InputFmt(%rip), %rdi
    lea     y(%rip), %rsi
    call    ProgramInput

#z = x*y;

    movl    x(%rip), %eax
    movl    y(%rip), %ebx
    mull    %ebx
    movl    %eax, z(%rip)

Equal100:
    movl    z(%rip), %eax
    cmpl    $100, %eax
    ja      Abowe100
    jb      Below100
    
    lea     StrEqual(%rip), %rdi
    call    ProgramOutput
    
    jmp ProgramExit

Abowe100:
    lea     StrGreater(%rip), %rdi
    call    ProgramOutput
    
    jmp ProgramExit

Below100:
    lea     StrBelow(%rip), %rdi
    call    ProgramOutput

ProgramExit:
    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax
    
    syscall

.section const, "a"
    xInputStr:  .asciz  "Enter first number: \n"
    yInputStr:  .asciz  "Enter second number: \n"
    
    InputFmt:   .asciz  "%d"
    
    StrEqual:     .asciz  "Value of variable z is equal to number 100. \n"
    StrGreater:     .asciz  "Value of variable z is greater than number 100. \n"
    StrBelow:   .asciz  "Value of variable z is less than number 100. \n"
    
.section .data
    x:  .int 0
    y:  .int 0
    z:  .int 0
.section .bss
