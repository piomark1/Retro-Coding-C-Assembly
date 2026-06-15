//Simplified exercise7.cpp with if statement only.
//This'll be helpful when we'll start rewriting 
//this program in Gas.
#include<stdio.h>
#include<stdlib.h>

int a, b, c, d, e;

int main(void)
{
    printf("Enter five numbers:\n");
    scanf("%d", &a);
    scanf("%d", &b);
    scanf("%d", &c);
    scanf("%d", &d);
    scanf("%d", &e);
    
    if(a>=b)
    {
        if(a>=c)
        {
            if(a>=d)
            {
                if(a>=e)
                {
                    printf("The largest number is a: %d\n", a);
                }
            }
        }
    }
    if(b>=a)
    {
        if(b>=c)
        {
            if(b>=d)
            {
                if(b>=e)
                {
                    printf("The largest number is b: %d\n", b);
                }
            }
        }
    }
    if(c>=a)
    {
        if(c>=b)
        {
            if(c>=d)
            {
                if(c>=e)
                {
                    printf("The largest number is c: %d\n", c);
                }
            }
        }
    }
    if(d>=a)
    {
        if(d>=b)
        {
            if(d>=c)
            {
                if(d>=e)
                {
                    printf("The largest number is d: %d\n", d);
                }
            }
        }
    }
    if(e>=a)
    {
        if(e>=b)
        {
            if(e>=c)
            {
                if(e>=d)
                {
                    printf("The largest number is e: %d\n", e);
                }
            }
        }
    }
        
    return 0;
}
