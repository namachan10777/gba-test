ENTRY(__start)

MEMORY {
	boot (w!x) : ORIGIN = 0x2000000, LENGTH = 256K
	wram (w!x) : ORIGIN = 0x3000000, LENGTH = 32K
	rom (w!x)  : ORIGIN = 0x8000000, LENGTH = 32M
}

SECTIONS {
	.text : {
		KEEP(target/crt0.o(.text));
		*(.text .text.*);
		. = ALIGN(4);
	} >rom = 0xff
}
