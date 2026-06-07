#include<stdio.h>
#include<stdlib.h>

int a, b, c, d;

int main(void)
{
    printf("Enter first number: \n");
    scanf("%d", &a);
    printf("Enter second number: \n");
    scanf("%d", &b);
    printf("Enter thrid number: \n");
    scanf("%d", &c);
    
    if (a > c && b > a)
    {
        d = a*b*c;
        printf("The value of three variables has been multiplied, "
                "the product: %d\n", d);
    }
    if (b < c || b < a)
    {
        d = b/a;
        printf("The value of variable b has been divided by a, "
                "the quotient: %d\n", d);
    }
    if ((c > a && b != 5) || (b > c && a != 0))
    {
        d = a+b+c;
        printf("Values of all variables have been added, "
                "the sum: %d\n", d);
    }
    return 0;

}
