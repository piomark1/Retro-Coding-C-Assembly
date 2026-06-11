#include<stdio.h>
#include<stdlib.h>

#define PI  3.14

float   R;

int main(void)
{
    printf("Eneter radius: ");
    scanf("%f", &R);

    printf("The area of a circle is %.2f\n", (PI*R*R));

    return 0;
}
