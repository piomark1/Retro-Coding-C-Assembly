#include<stdio.h>
#include<stdlib.h>

#define ARE_OF_AGE 18
int age;
int main(void){
    
    printf("Enter your age: ");
    scanf("%d", &age);

    if (age >= ARE_OF_AGE)
    {
        printf("Yes, you are alreade of age. Come in!\n");
    }
    else
    {
        printf("Sorry, you have to wait %d years yet.\n", (ARE_OF_AGE-age));
    }
    return 0;
}
