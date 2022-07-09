#include <stdio.h>
#include "NUC029xAN.h"

extern void initialise_monitor_handles(void);

void SYS_Init(void) {
#if defined(OS_USE_SEMIHOSTING)
  initialise_monitor_handles();
#endif

  // Unlock protected registers
  SYS_UnlockReg();

  // Enable IP clock
  CLK->APBCLK = CLK_APBCLK_UART0_EN_Msk;

  // Update System Core Clock
  SystemCoreClockUpdate();

  // Lock protected registers
  SYS_LockReg();
}

int main() {
  int8_t ch;

  SYS_Init();

  printf("Hello via semihost\n\n");

  do {
  } while (1);
}