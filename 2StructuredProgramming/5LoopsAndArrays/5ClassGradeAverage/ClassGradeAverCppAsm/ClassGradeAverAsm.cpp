#include <stdio.h>
#include <stdlib.h>

extern "C"
{
    float AvrgFunc(void);
}

float   sum_avrg;
int counter;

float   WhatAverage(float x, int y);
float   students[21];

int main(void)
{
    //float students[21];
    sum_avrg = 0;

    for(counter=0; counter<21; ++counter)
    {
        printf("Enter the average grades of student No %d: ", counter+1);
        scanf("%f", &students[counter]);
            while ((students[counter] < 1.0) || (students[counter] > 6.0))
            {
                printf("Enter proper average grade value: ");
                scanf("%f", &students[counter]);
            }
        //sum_avrg += students[counter];
        __asm__("xorq   %rbx, %rbx\n"
                "pxor   %xmm0, %xmm0\n"
                "pxor   %xmm1, %xmm1\n"
                "movl   counter(%rip), %ebx\n"
                "movss  students(, %rbx, 4), %xmm0\n"
                "movss  sum_avrg(%rip), %xmm1\n"
                "addss  %xmm1, %xmm0\n"
                "movss  %xmm0, sum_avrg(%rip)\n");
    }
    printf("The class grades average is %.1f\n", WhatAverage(sum_avrg, counter));

    return 0;
}
float WhatAverage(float x, int y)
{
    //float z;
    //
    //z = x/y;

    //return z;
        __asm__("AvrgFunc:\n"
                "cvtsi2ss %rdi, %xmm1\n"
                "divss  %xmm1, %xmm0\n"
                "leave\n"
                "ret\n"
                );
    return AvrgFunc();
}
