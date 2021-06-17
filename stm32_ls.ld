ENTRY(Reset_Handler)

MEMORY
{
    FLASH(rx):ORIGIN =0x08000000,LENGTH =1024K
    SRAM(rwx):ORIGIN =0x20000000,LENGTH =128K
}

SECTIONS
{
    .text :
    {
        *(.isr_vector)
        *(.text)
        *(.rodata)
        . = ALIGN(4); /*4 byte aligned*/
       __etext = .; /*stored the updated location counter in to a symbol*/
    }> FLASH  

    .data :
    {
        __sdata = 0x20000000; /* start of data */
        *(.data)
        . = ALIGN(4);
        __edata = .; /*end of data*/
    }> SRAM AT> FLASH

    .bss :
    {
        __sbss = .;
        *(.bss)
        *(COMMON)
        . = ALIGN(4);
        __ebss = .;
    }> SRAM
}
