#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    float FloatDiffRet(void);
    int IntDiffRet(void);
}

int value, first, second;
float first_float, second_float;

float   FloatDifference(float x, float y);
int     IntDifference(int x, int y);     

int main(void)
{
    do
    {
        system("clear");
       
        printf("1-Integer Difference Calculator\n"
                "2-Float Differnece Calculator\n"
                "3-Exit\n");

        printf("Enter value 1 or 2: ");
        scanf("%d", &value);

        switch(value)
        {
            case 1:
            {
                printf("Enter first number: ");
                scanf("%d", &first);
                printf("Enter second number: ");
                scanf("%d", &second);

                printf("\nThe difference of entered integers is %d\n", IntDifference(first, second));

                break;
            }
            case 2:
            {
                printf("Enter first float number: ");
                scanf("%f", &first_float);
                printf("Enter second float number: ");
                scanf("%f", &second_float);

                printf("\nThe difference of entered floats is %.2f\n", FloatDifference(first_float, second_float));

                break;
            }
        }
        getchar();
        getchar();
    }
    while(value != 3);
    
    system("clear");

    
    return 0;
}

float FloatDifference(float x, float y)
{
    __asm__("FloatDiffRet:\n"
            "   subss %xmm1, %xmm0\n"
            "   leave\n"
            "   ret\n");
    
    return FloatDiffRet();
}

int IntDifference(int x, int y)
{
    __asm__("IntDiffRet:\n"
                "subl %esi, %edi\n"
                "movl %edi, %eax\n"
                "leave\n"
                "ret\n");
    
    return IntDiffRet(); 
}

