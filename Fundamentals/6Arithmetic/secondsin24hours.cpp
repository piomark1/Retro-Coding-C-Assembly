#include<stdio.h>
#include<stdlib.h>

#define min_in_hour 60
const   int sec_in_min = 60;
int     sec_in_day;

int main(void)
{
    sec_in_day = 24*min_in_hour*sec_in_min;
    printf("The number of seconds in a day is %d\n", sec_in_day);
    return 0;

}
