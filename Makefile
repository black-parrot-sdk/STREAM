RISCV_GCC  = $(CROSS_COMPILE)gcc --static -nostartfiles -fPIC -march=rv64ima -mabi=lp64 -mcmodel=medany -I$(BP_TEST_DIR)/include
RISCV_LINK = -static -nostartfiles -L$(BP_TEST_DIR)/lib -T riscv.ld

all: stream.riscv

stream.riscv: stream.s printf.s
	$(RISCV_GCC) $(RISCV_LINK) -O3 -o $@ stream.s printf.s -lperch

%.s:
	$(RISCV_GCC) -O3 -S -o $@ $*.c

clean:
	rm -f *.riscv
	rm -f *.s
