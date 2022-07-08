# NuTiny-NUC029L Experiments with open tools
## Prerequiments
- VS Code + Cortex-Debug
- arm-none-eabi-gcc

## OpenOCD
```
$ git submodule update --init
$ make tools/bin/openocd
```

This version contains a up-ported version of OpenOCD-Nevoton's flash/nor/numicro.c

## Program download
```
load
```
In the DEBUG CONSOLE.

## TODO
- semihost
- make depend