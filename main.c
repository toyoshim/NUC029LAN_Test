#include <stdio.h>
#include "NUC029xAN.h"

#include "gpio.h"
#include "timer.h"

extern void initialise_monitor_handles(void);

void SYS_Init(void) {
#if defined(OS_USE_SEMIHOSTING)
  initialise_monitor_handles();
#endif

  // Unlock protected registers
  SYS_UnlockReg();

  // Enable IP clock (TMR0)
  CLK->APBCLK = CLK_APBCLK_TMR0_EN_Msk;

  // Update System Core Clock
  SystemCoreClockUpdate();

  // Lock protected registers
  SYS_LockReg();
}

int main() {
  int8_t ch;

  SYS_Init();

  GPIO_SetMode(P3, BIT6, GPIO_PMD_OUTPUT);

  printf("Hello via semihost\n");
  printf("Running at %d Hz\n", SystemCoreClock);

  do {
    P36 = 0;                      // LED GPIO1 ON
    TIMER_Delay(TIMER0, 100000);  // 100msec
    P36 = 1;                      // LED GPIO1 OFF
    TIMER_Delay(TIMER0, 100000);  // 100msec
  } while (1);
}