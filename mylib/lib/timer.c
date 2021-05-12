#include <tonc_memdef.h>
#include <tonc_memmap.h>

void sleep(u32 sec)
{
    REG_TM0CNT_L = 0;
    REG_TM0CNT_H = TM_FREQ_256 | TM_ENABLE;
    REG_TM1CNT_L = 0;
    REG_TM1CNT_H = TM_CASCADE | TM_ENABLE;

    while (REG_TM1CNT_L < sec)
    {

    }
    REG_TM0CNT_H = 0;
    REG_TM1CNT_H = 0;
}

void sleep_quarter(u32 sec)
{
    REG_TM0CNT_L = 0;
    REG_TM0CNT_H = TM_FREQ_1 | TM_ENABLE;
    REG_TM1CNT_L = 0;
    REG_TM1CNT_H = TM_CASCADE | TM_ENABLE;
    while (REG_TM1CNT_L < sec)
    {
    }
    REG_TM0CNT_H = 0;
    REG_TM1CNT_H = 0;
}
