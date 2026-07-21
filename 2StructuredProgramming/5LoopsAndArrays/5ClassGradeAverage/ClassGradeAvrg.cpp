#include <stdlib.h>
#include <stdio.h>

float sum_avrg;
int counter;
float   WhatAverage(float x, int y);

int main(void)    
{
    float students[21];
    sum_avrg = 0;

    for(counter=0; counter<21; counter++)
    {
        printf("Enter the average grades of the student No %d: ", counter+1);
        scanf("%f", &students[counter]);

        while((students[counter] < 1.0) || (students[counter] > 6.0))
            {
                printf("Enter proper value: );
                scanf("%f", &students[counter]);
            }
        sum_avrg += students[counter];
    }
  
    printf("Class grade average is %.1f\n", WhatAverage(sum_avrg, counter));
    return 0;
}
float WhatAverage(float x, int y)
{
    float z;

    z=x/y;

    return z;

}
