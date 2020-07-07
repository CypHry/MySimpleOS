# kernel Makefile

KERNEL_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

__start__: all

include $(KERNEL_DIR)/../build/Makefile.defs

OUT_DIR = $(KERNEL_OUT_DIR)/out
OUT_FILES := boot.o kernel.o
OUT_FILES_FULL_PATH := $(foreach x, $(OUT_FILES), $(OUT_DIR)/$x)

all: out $(OUT_FILES) link
	@echo kernel makefile: all done

out:
	cd $(BUILD_DIR)
	mkdir -p $(OUT_DIR)

link:
	$(CC) -T linker.ld -o $(KERNEL_OUT_DIR)/$(MY_OS_NAME).bin $(LDFLAGS) $(OUT_FILES_FULL_PATH) $(LDLIBS)

clean:
	rm -rf $(KERNEL_OUT_DIR)