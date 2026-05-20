#Compilation:
#           gcc -fno-pie -no-pie c.cpp variables.s -lstdc++ -z noexecstack

    fmtStr: .ascii  "My name is John, I am %u"
            .ascii  " years old, I walk to school %lu cm out away"
            .ascii  " of my home.\n"
            .ascii  "Girls from my school have body temperature %d Celsius degrees\n"
            .ascii  "so I spent on them only %f percent of my income\n"
            .ascii  "from my extra job what is fertilise trading\n"
            .asciz  "%f GBP/kg.\n"

.section .data

    percent:          .double 0.0   #double is 8 bytes long
    MyAge:            .int  0     #unsigned int is 4 bytes long
    range:            .quad 0     #unsigned long is 8 bytes long 
    temperature:      .int  0     #int is 4 bytes long
    fertilise_price:  .single  0.0   #float is 4 bytes long 

.section .bss
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
    pushq   %rax
    pushq   %rbx

    movl    $20, MyAge(%rip)

    lea       fmtStr(%rip), %rdi
    xorq      %rsi, %rsi
    movl      MyAge, %esi
    movq      range, %rdx
    xorq      %rcx, %rcx
    movl      temperature, %ecx
    cvtss2sd  percent(%rip), %xmm0
    cvtss2sd  fertilise_price(%rip), %xmm1
    call    ProgramOutput

    popq    %rbx
    popq    %rax
    popq    %rbp

    xorq  %rdi, %rdi
    xorq  %rax, %rax
    movq  $60, %rax

    syscall
