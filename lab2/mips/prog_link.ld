     SECTIONS
     {
       . = 0x800000;
       .text : { *(.text) }
       .data : { *(.data) }
       .bss : { *(.bss) }
     }