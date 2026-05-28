#include<stdio.h>
#include<stdlib.h>

#define PI 3.14
const int R = 10;
const int H = 20;
float CylinderArea;

int main(void)
{
    CylinderArea =(2*PI*R*H) + (2*PI*R*R);
    printf("The area of a cylinder is %.2f\n", CylinderArea);

    return 0;

}
