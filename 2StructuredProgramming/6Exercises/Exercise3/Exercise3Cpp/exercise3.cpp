/*
Write a program that will assign vlue 1 to each element
of any array.
*/
#include <stdlib.h>
#include <stdio.h>

int indx, arry[10];

int main(void)
{
  for(indx=0; indx<10; ++indx)
    {
      printf("%d", array[indx] = 0);
      if(indx == 9)
      {
        printf("\n");
      }
    }
  for(indx=0; indx<10; ++indx)
    {
      printf("%d", array[indx]=1);
      if(indx == 9)
      {
        printf("\n");
      }
    }
  return 0;
}
