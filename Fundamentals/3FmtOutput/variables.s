#Compilation:
#           gcc -fno-pie -no-pie c.cpp variables.s -lstdc++ -z noexecstack

    fmtStr: .ascii  "My name is John, I am %u"
            .ascii  " years old, I walk to school %lu cm out away"
            .ascii  " of my home.\n"
            .asciz  "Girls from my school have body temperature %d Celsius degrees\n"
            
    floatStr:        .ascii  "so I spent on them only %f percent of my income\n"
                     .ascii  "from my extra job what is fertilise trading"
                     .asciz  " %f GBP/kg.\n"

.section .data

    percent:          .double 0.000001   #double is 8 bytes long
    MyAge:            .int  20     #unsigned int is 4 bytes long
    range:            .quad 1000000000     #unsigned long is 8 bytes long 
    temperature:      .int  -5     #int is 4 bytes long
    fertilise_price:  .single  12.35   #float is 4 bytes long 

.section .bss
.section .text

intProgramOutput:
    pushq   %rbx
    xorq    %rax, %rax
    call    printf
    xorq    %rax, %rax
    popq    %rbx
    ret

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
    pushq   %rax
    pushq   %rbx


    lea       fmtStr(%rip), %rdi
    xorq      %rsi, %rsi
    movl      MyAge, %esi
    movq      range, %rdx
    xorq      %rcx, %rcx
    movl      temperature, %ecx
    call      intProgramOutput

    lea       floatStr(%rip), %rdi
    movsd     percent(%rip), %xmm0
    cvtss2sd  fertilise_price, %xmm1
    call      floatProgramOutput

    popq    %rbx
    popq    %rax
    popq    %rbp

    xorq  %rdi, %rdi
    xorq  %rax, %rax
    movq  $60, %rax

    syscall
