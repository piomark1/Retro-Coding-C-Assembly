#include <stdlib.h>
#include <stdio.h>

extern "C"
{
  void TakeAndRet(void);
}
int main(void)
{
  TakeAndRet();
}
