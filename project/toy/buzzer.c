#include <msp430.h>
#include "libTimer2.h"
#include "buzzer.h"

void buzzer_init()
{
  timerAUpmode();
  P2SEL2 &= ~(BIT6 | BIT7);
  P2SEL &= ~BIT7;
  P2SEL |= BIT6;
  P2DIR = BIT6;
}

void buzzer_set_period(short cycles)
{
  CCR0 = cycles;
  CCR1 = cycles >> 1;
}

void buzzer_off() //turn off
{
  CCR0 = 0;
  CCR1 = 0;
}
