# NuTiny-NUC029L Experiments with open tools
## Prerequiments
- VS Code + Cortex-Debug
- arm-none-eabi-gcc

## OpenOCD
```
$ git submodule update --init
$ make tools/bin/openocd
```

This version contains a up-ported version of OpenOCD-Nevoton's flash/nor/numicro.c to support the target chip, NUC029LAN.

## Semihosting
- Just works with defining OS_USE_SEMIHOSTING

## HowTo
- Type `Cmd + Shift + B` => Build
- Type `F5` => Debug