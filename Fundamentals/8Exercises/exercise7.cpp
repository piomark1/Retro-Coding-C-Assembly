#include<stdio.h>
#include<stdlib.h>

int a, b, c, d, e;

int main(void)
{
    printf("Enter five  numbers:\n");
    scanf("%d", &a);
    scanf("%d", &b);
    scanf("%d", &c);
    scanf("%d", &d);
    scanf("%d", &e);

    if(((a>=b) && (a>=c)) && ((a>=d) && (a>=e)))
    {
        printf("The largest entered number is a: %d\n", a);
    }
    if(((b>=a)&&(b>=c))&&((b>=d)&&(b>=e)))
    {
        printf("The largest entered number is b: %d\n", b);
    }
    if(((c>=a)&&(c>=b))&&((c>=d)&&(c>=d)))
    {
        printf("The largest entered number is c: %d\n", c);
    }
    if(((d>=a)&&(d>=b))&&((d>=c)&&(d>=e)))
    {
        printf("The largest entered number is d: %d\n", d); 
    }
    if(((e>=a)&&(e>=b))&&((e>=c)&&(e>=d)))
    {
        printf("The largest entered number is e: %d\n", e);
    }
    return 0;
}

