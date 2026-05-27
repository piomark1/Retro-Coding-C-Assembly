#include<stdio.h>
#include<stdlib.h>

#define PI  3.14
float   SphereArea;
const   int R = 5;

int main(void)
{
    SphereArea = 4*PI*R*R;
    printf("Area of a sphere is %f\n", SphereArea);
    return 0;
}



