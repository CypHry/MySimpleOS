__start__: install 

include build/Makefile.defs

kernel_all: 
	cd $(KERNEL_DIR) && $(MAKE)

kernel_clean:
	cd $(KERNEL_DIR) && $(MAKE) clean

install: kernel_all
	mkdir -p $(MY_OS_OUT_DIR)/boot/grub
	cp grub/grub.cfg $(MY_OS_OUT_DIR)/boot/grub/grub.cfg
	cp $(KERNEL_OUT_DIR)/$(MY_OS_NAME).bin $(MY_OS_OUT_DIR)/boot/$(MY_OS_NAME).bin
	grub-mkrescue -o $(MY_OS_OUT_DIR)/$(MY_OS_NAME).iso $(MY_OS_OUT_DIR)

run: 
	qemu-system-i386 -cdrom $(MY_OS_OUT_DIR)/$(MY_OS_NAME).iso -curses

clean:
	rm -rf $(OUT_DIR)