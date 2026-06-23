#include <stdio.h>
#include <stdlib.h>

extern "C"
{
    //int my_function(int x, int y);
    int MulTwoInts(int x, int y);
}
//int MulTwoInts(int x, int y);
int main(void)
{
    printf("%d\n", MulTwoInts(12, 14));
    return 0;
}
/*int MulTwoInts(int x, int y)
{
    __asm__(
            "my_function:\n"
            "   imull %edi, %esi\n"
            "   movl   %esi, %eax\n"
            "   leave\n"
            "   ret\n"
        );
    return my_function(x, y);
}
*/
int MulTwoInts(int x, int y)
{
    __asm__(
            "imull  %edi, %esi\n"
            "movl   %esi, %eax\n"
            "leave\n"
            "ret\n"
            );
}
