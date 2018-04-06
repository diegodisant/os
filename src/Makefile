SDKDIR=./sdk
KERNELDIR=./kernel
USERLANDDIR=./userland

help:
	@echo "Makefile to build Captaincode Operative System"
	@echo "Usage make [all | clean | help | build | run]"
	@echo ""
	@echo

all:
	@echo "[-] Building Kernel"
	make -C $(KERNELDIR)
	@echo "[-] Building SDK"
	make -C $(SDKDIR)
	@echo "[-] Building Userland"
	make -C $(USERLANDDIR)

build:
	zip -r devos-$(VERSION).zip

run:
	@echo "Running Captaincode Operative System"
	cd $(SDKDIR) && sudo bash ./diskimage.sh
	cd $(SDKDIR) && ./qemu.sh

clean:
	make -C $(KERNELDIR) clean
	make -C $(USERLANDDIR) clean
