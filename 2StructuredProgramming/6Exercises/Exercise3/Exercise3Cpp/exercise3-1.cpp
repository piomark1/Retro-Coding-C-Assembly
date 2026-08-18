/* Write a program that will assign vlue 1 to each element
 * of any table.
 */
#include <stdlib.h>
#include <stdio.h>

int idx, array[10];
void ArraySet(int arr[], int val);

int main(void)
{
    ArraySet(array, 0);
    ArraySet(array, 1);
    return 0;
}
void ArraySet(int arr[], int val)
{
    for(idx=0; idx<10; ++idx)
    {
        printf("%d", arr[idx]=val);
        if(idx==9)
        {
            printf("\n");
        }
    }
    if(val == 1)
    {
            printf("An array was set to 1\n");
    }
    
}
