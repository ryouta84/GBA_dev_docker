#include <tonc.h>

int main()
{
    REG_DISPCNT = DCNT_MODE3 | DCNT_BG2;

    txt_init_std();

    m3_puts(80, 50, "Hello World!", CLR_CYAN);

    while (1)
        ;

    return 0;
}
