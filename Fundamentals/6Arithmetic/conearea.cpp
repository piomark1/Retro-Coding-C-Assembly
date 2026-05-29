/*Compilation:
 *              gcc conearea.cpp -lm
 */
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

#define     PI  3.14
const   int R = 10;
const   int H = 10;
float   ConeArea;

int main(void)
{
    ConeArea = (PI*R) * (R + sqrt((H*H) + (R*R)));
    printf("The area of the cone is %.2f\n", ConeArea);
    return 0;
}

