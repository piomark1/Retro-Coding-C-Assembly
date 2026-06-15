#include<stdio.h>
#include<stdlib.h>

#define CELS_TO_FAHR 2.12

float celsius;

int main(void)
{
    printf("Enter temperature in Celsius degrees: ");
    scanf("%f", &celsius);
    printf("Temperature in Fahrenheit degrees is: %.2f\n", (celsius*CELS_TO_FAHR));
    
    return 0;
}
