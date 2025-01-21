BASE=/opt/arm-none-eabi-gcc/share/gcc-arm-none-eabi/samples
include $(BASE)/src/makefile.conf
BASE=/opt/arm-none-eabi-gcc/share/gcc-arm-none-eabi/samples

NAME=minimum
STARTUP_DEFS=-D__STARTUP_CLEAR_BSS -D__START=main

LDSCRIPTS=-L. -L$(BASE)/ldscripts -T nokeep.ld
LFLAGS=$(USE_NANO) $(USE_NOHOST) $(LDSCRIPTS) $(GC) $(MAP)

all: $(NAME)-$(CORE).axf

$(NAME)-$(CORE).axf: $(NAME).c $(STARTUP)
	$(CC) $^ $(CFLAGS) $(LFLAGS) -o $@

clean:
	rm -f $(NAME)*.axf *.map *.o
