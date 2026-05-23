#include<stdio.h>
#include<stdlib.h>

double        percent;
unsigned int  MyAge;
unsigned long range;
int           temperature;
float         fertilise_price;

int main(void)
{
  percent     = 0.000001;
  MyAge       = 20;
  range       = 100000;
  temperature = -5;
  fertilise_price = 12.35;

  //Text cut for two strings. One with integer values only, second with float values. 
  printf("My name is John, I am %u"
         " years old, I walk to school %lu cm out away"
         " of my home.\n"
         "Girls from my school have body temperature %d Celsius degrees\n",
         MyAge, 
         range,
         temperature
        );
  printf("so I spent on them only %f percent of my income\n"
          "from my extra job what is fertilise trading\n"
          "%f GBP/kg.\n",
          percent,
          fertilise_price
         );

  return 0;

}
