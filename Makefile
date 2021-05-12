PROGNAME := volt4
CC       := /opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc
PROJINC  := ./mylib/include/
PROJLIB  := ./mylib/lib/
TONCINC  := /opt/devkitpro/libtonc/include/
TONCLIB  := /opt/devkitpro/libtonc/lib/libtonc.a
BUILDDIR := ./build/
CFLAGS   := -mthumb-interwork -mthumb -O2 -I$(TONCINC) -I$(PROJINC)
OBJECTS  := $(addprefix $(BUILDDIR),$(patsubst %.c,%.o,$(wildcard *.c))) $(addprefix $(BUILDDIR),$(notdir $(patsubst %.c,%.o,$(wildcard $(PROJLIB)*.c))))
$(info $(OBJECTS))

.PHONY: all

all: $(BUILDDIR)$(PROGNAME).elf
	# elfファイルから機械語部分のデータだけを取り出す？
	/opt/devkitpro/devkitARM/bin/arm-none-eabi-objcopy -v -O binary $(BUILDDIR)$(PROGNAME).elf $(BUILDDIR)$(PROGNAME).gba
	# ヘッダの修正
	gbafix $(BUILDDIR)$(PROGNAME).gba

# リンク

$(BUILDDIR)$(PROGNAME).elf: $(OBJECTS)
	$(CC) $^ $(TONCLIB) -mthumb-interwork -mthumb -specs=gba_mb.specs -o $@

# コンパイル

$(BUILDDIR)%.o: %.c
	$(CC) -c $< $(CFLAGS) -o $@

$(BUILDDIR)%.o: $(PROJLIB)%.c
	$(CC) -c $< $(CFLAGS) -o $@


clean:
	rm -f $(BUILDDIR)*.o $(BUILDDIR)$(PROGNAME).elf $(BUILDDIR)$(PROGNAME).gba
