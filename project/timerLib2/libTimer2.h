#ifndef libTimer2_included
#define libTimer2_included

void configureClocks();
void enableWDTInterrupts();
void timerAUpmode();

unsigned char gert_sr();
void set_sr(), or_sr(), and_sr();

#endif
