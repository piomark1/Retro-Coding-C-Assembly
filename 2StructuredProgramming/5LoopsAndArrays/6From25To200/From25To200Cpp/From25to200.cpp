#include <stdlib.h>
#innclude <stdio.h>
int counter;
int main(void)
{
  counter = 25;
  while(counter <= 200)
    {
      printf("Counter: %d \n", counter);
      ++counter;
    }
  return 0;
}
