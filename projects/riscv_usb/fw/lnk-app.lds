MEMORY
{
    ROM (rx)    : ORIGIN = 0x00010000, LENGTH = 0xc000
    SPRAM (xrw) : ORIGIN = 0x0001c000, LENGTH = 0x4000
    BRAM  (xrw) : ORIGIN = 0x00000010, LENGTH = 0x03f0
}
ENTRY(_start)
SECTIONS {
    .text :
    {
        . = ALIGN(4);
        *(.text.start)
        *(.text)
        *(.text*)
        *(.rodata)
        *(.rodata*)
        *(.srodata)
        *(.srodata*)
        . = ALIGN(4);
        _etext = .;
        _sidata = _etext;
    } >ROM
    .data : AT ( _sidata )
    {
        . = ALIGN(4);
        _sdata = .;
        _ram_start = .;
        . = ALIGN(4);
        *(.data)
        *(.data*)
        *(.sdata)
        *(.sdata*)
        . = ALIGN(4);
        _edata = .;
    } >SPRAM
    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        *(.sbss)
        *(.sbss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } >SPRAM
    .heap :
    {
        . = ALIGN(4);
        _heap_start = .;
    } >SPRAM
}
