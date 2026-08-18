/*
Write a program that will assign vlue 1 to each element
of any table.
*/
#include <stdlib.h>
#include <stdio.h>

int index, table[10];

int main(void)
{
  for(index=0; index<10; ++index)
    {
      table[index] = 1;
    }
  return 0;
}
