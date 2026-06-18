#include<stdio.h>
#include<stdlib.h>

void MyFirstFunction(void);

int main(void)
{
    MyFirstFunction();
    return 0;
}
void MyFirstFunction(void)
{
    printf("I am Your first function.\n"
            "I don't take any arguments\n"
            "and return anything.\n");
            
}
