#include<stdio.h>
#include<stdlib.h>

#define TimeRange 480
#define months_a_year 12

int main(void)
{
    int Age;
    int CalculatedAge;
    int HowMannyYears;

    HowMannyYears = TimeRange/months_a_year;
    scanf("%d", &Age);

    CalculatedAge = Age + HowMannyYears;

    printf("After 480 months, it means %d years, ", HowMannyYears);
    printf("You'll be %d years old\n", CalculatedAge);
    return 0;
}
