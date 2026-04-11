#include<stdio.h>
#include<stdlib.h>

extern "C"
{
  void asmMain(void);
}

int main(void)
{
  asmMain();
}

