# NuTiny-NUC029L Experiments with open tools
## Prerequiments
- VS Code + Cortex-Debug
- arm-none-eabi-gcc

## OpenOCD
```
$ git submodule update --init
$ make tools/bin/openocd
```

This version contains a ported version of OpenOCD-Nevoton's flash/nor/numicro.c
to support the target chip, NUC029LAN. OpenOCD-Nevoton is based on an old fork
of openocd, and there are several problems like:
- It requires root permission on mac to use HID based interface, such as Nu-Link
- Cortex-Debug could not establish the remote gdb connection

The port isn't perfect and omit some required code changes for other chips.
See `FIXME: comment` in the port CL.

## Semihosting
- Just works with defining OS_USE_SEMIHOSTING

## C Debug
- `RUN AND DEBUG` > `Debug C Hello`

## Embedded Rust Debug
- Follow [The Embedded Rust Book](https://docs.rust-embedded.org/book/intro/install.html)
for the initial installation.
- `RUN AND DEBUG` > `Debug Rust Hello`