CROSS_COMPILE ?= arm-linux-gnueabihf-
CC := $(CROSS_COMPILE)gcc
CFLAGS ?= -Wall -Wextra -O2

TARGET := hello_imx6ull
SRC := src/hello.c

.PHONY: all check clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

check: $(TARGET)
	@info="$$(file $(TARGET))"; \
	echo "$$info"; \
	echo "$$info" | grep -Eq 'ELF 32-bit.*ARM' || { \
		echo "ERROR: $(TARGET) is not an ARM 32-bit ELF executable." >&2; \
		exit 1; \
	}

clean:
	rm -f $(TARGET)
