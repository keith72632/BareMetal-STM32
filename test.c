#include <stdint.h>

uint32_t add(uint32_t num1, uint32_t num2)
{
    return num1 + num2;
}

int main(int argc, char **argv)
{
    uint32_t first = 10;
    uint32_t second = 5;
    uint32_t res = add(first, second);
}

