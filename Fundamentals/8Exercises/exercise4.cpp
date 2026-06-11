#include<stdio.h>
#include<stdlib.h>

const float PI = 3.14;
float R, H;

int main(void)
{
    printf("Enter radius of the cylinder: ");
    scanf("%f", &R);
    printf("Enter height of the cylinder: ");
    scanf("%f", &H);

    printf("The area of the cylinder is %.2f\n", ((2*PI*R*H)+(2*PI*R*R)));

    return 0;
}
