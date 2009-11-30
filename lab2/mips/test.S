	######################################
	## TEST CODE
	######################################
	
	#include "regdef.h"
	.previous
	.text
	.align 2
	.ent main

    main:
	# Load 0xDEADBEEF into $t1
	# in a round-about way!
	addi t0, zero, 0x0021
	addi t1, zero, 0x0052
	sll  t0, t0, 24
	sll  t2, t1, 16
	or   t1, t0, t2
	ori  t1, t1, 0x4110
	nor  t1, t1, t1
	
	# Store this out to the 7-segment display
	li   t0, 0xF0000810
	sw   t1, 16(t0)

    main.end:
	j main.end
	
	.end main