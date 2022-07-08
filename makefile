CC	= arm-none-eabi-gcc
OBJCOPY	= arm-none-eabi-objcopy
CFLAGS	= \
	-mcpu=cortex-m0 -mthumb -Os -std=gnu11 -g \
	-fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections \
	-INUC029xANBSP/Library/CMSIS/Include \
	-INUC029xANBSP/Library/StdDriver/inc \
	-INUC029xANBSP/Library/Device/Nuvoton/NUC029xAN/Include
LDFLAGS	= \
	-T NUC029xANBSP/Library/Device/Nuvoton/NUC029xAN/Source/GCC/gcc_arm.ld \
	-Xlinker --gc-section -Wl,-Map,$(TARGET).map --specs=nano.specs
OBJS	= main.o \
	_syscalls.o startup_NUC029xAN.o system_NUC029xAN.o \
	retarget.o uart.o
TARGET	= test

$(TARGET).hex:  $(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.c
	$(CC) -c $(CFLAGS) $<

%.o: NUC029xANBSP/Library/Device/Nuvoton/NUC029xAN/Source/GCC/%.c
	$(CC) -c $(CFLAGS) $<

%.o: NUC029xANBSP/Library/Device/Nuvoton/NUC029xAN/Source/%.c
	$(CC) -c $(CFLAGS) $<

%.o: NUC029xANBSP/Library/StdDriver/src/%.c
	$(CC) -c $(CFLAGS) $<

%.o: NUC029xANBSP/Library/Device/Nuvoton/NUC029xAN/Source/GCC/%.S
	$(CC) -c $(CFLAGS) $<

clean:
	rm -f *.o *.map $(TARGET).hex $(TARGET).elf

tools/bin/openocd:
	(cd openocd && ./bootstrap && \
	 ./configure --prefix=$(PWD)/tools && \
 	 make && make install)
 
