#include<stdio.h>
#include<stdlib>

extern "C"
{
  void asmMain(void);
}
int main(void)
{
  asmMain();
}
