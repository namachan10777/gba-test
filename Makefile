TRIPLE := arm-none-eabi
RUST_SOURCES := $(shell find . -type f -name *.rs) Cargo.toml Cargo.lock $(TRIPLE).json
CARGO_BINARY := target/$(TRIPLE)/release/arm7tdmi-test

.PHONY: all
all: game.gba

target/crt0.o: crt0.S
	$(TRIPLE)-as $< -o $@

$(CARGO_BINARY): $(RUST_SOURCES)
	cargo xbuild --target $(TRIPLE).json --release

game.gba: $(CARGO_BINARY)
	$(TRIPLE)-objcopy -O binary $< $@
