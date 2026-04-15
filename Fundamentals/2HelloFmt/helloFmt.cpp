//Compilation: gcc -o helloFmt helloFmt.cpp
#include<stdio.h>
#include<stdlib.h>

//char *FmtStr =  "**************************************\n"
//                "************Hello ASM World!**********\n"
//                "**************************************\000";

char FmtStr[] = "**************************************\n"
                "************Hello ASM World!**********\n"
                "**************************************\000";
int main(void)
{
  system("clear");
  
  printf("%s\n", FmtStr);

  getchar();
  system("clear");

  return 0;
}
