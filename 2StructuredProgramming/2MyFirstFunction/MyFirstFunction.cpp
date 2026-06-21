#include <stdio.h>
#include <stdlib.h>

extern "C"
{
  void MyFirstFunction(void);
}
int main(void)
{
  MyFirstFunction();
  return 0;
}
