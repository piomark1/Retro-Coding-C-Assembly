#include <stdlib.h>
#include <stdio.h>

extern "C"
{
  void asmMain(void);
}

int main(void)
{
  asmMain();
}
