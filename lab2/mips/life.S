#######################################################
## Game of Life
##
## Name :
## College  :
## CRSID:
## Date :
#######################################################

#include "regdef.h"
.previous
.text
.set noreorder
.set nomacro
.set nobopt
.align 2
.ent main

main:
	# load mouse button press indicator
	lw a0, 0xf0000834
	nop
	# load button press indicator
	lw a1, 0xf0000830
	nop
	
main.loop:
main.toggle:
	lw t0, 0xf0000834
	beq a0, t0, main.nextstate
	nop
	jal toggle
	nop
main.nextstate:
	lw t1, 0xf0000830
	beq a1, t1, main.end
	nop
	jal nextstate
	nop
main.end:
	j main.loop
	nop
	
#######################################################
##----------------------------------------------
## FUNCTION TO TOGGLE A CELL
##----------------------------------------------

toggle:
	# reset button press indicator
	lw a0, 0xf0000834
	# load base cell address
	li t0, 0xf0000000
	# load mouse x position
	lw t1, 0xf0000838
	srl t1, 5
	# load mouse y position
	lw t2, 0xf000083c
	srl t2, 5
	# calculate cell array offset
	li t3, 40
	mult t2, t3
	mflo t2
	add t1, t1, t2
	add t0, t0, t1
	# load current cell state
	lb t3, 0(t0)
	# toggle cell state
	addi t3, 1
	andi t3, 1
	sb t3, 0(t0)
	jr ra
	nop

#######################################################
##----------------------------------------------
## FUNCTION TO GIVE THE NEXT STATE
##----------------------------------------------
## Live != 0
## Dead == 0
##----------------------------------------------

nextstate:
	# reset button press indicator
	lw a1, 0xf0000830
	
	li t0, 0xf0000000
	la s0, store_data
	li s1, 1
	addi s4, ra, 0
	
nextstate.loop:
	beq t0, 0xf0000500, nextstate.copy
	li s2, 0
	li t3, 40
	li t4, 0xf0000000
	sub t4, t0, t4
	div t4, t3
	mfhi t3
	ble t0, 0xf0000029, nextstate.4
	nop
	
nextstate.1:
	beq t3, 0, nextstate.2
	nop
	lb t1, -41(t0)
	beq t1, zero, nextstate.2
	nop
	jal nextstate.count
	nop
	
nextstate.2:
	lb t1, -40(t0)
	beq t1, zero, nextstate.3
	nop
	jal nextstate.count
	nop
	
nextstate.3:
	beq t3, 39, nextstate.4
	nop
	lb t1, -39(t0)
	beq t1, zero, nextstate.4
	nop
	jal nextstate.count
	nop

nextstate.4:
	beq t3, zero, nextstate.5
	nop
	lb t1, -1(t0)
	beq t1, zero, nextstate.5
	nop
	jal nextstate.count
	nop

nextstate.5:
	lb t2, 0(t0)
	nop
	
nextstate.6:
	beq t3, 39, nextstate.7
	nop
	lb t1, 1(t0)
	beq t1, zero, nextstate.7
	nop
	jal nextstate.count
	nop

nextstate.7:
	bge t0, 0xf00004d8, nextstate.compute
	nop
	beq t3, 0, nextstate.8
	nop
	lb t1, 39(t0)
	beq t1, zero, nextstate.8
	nop
	jal nextstate.count
	nop
	
nextstate.8:
	lb t1, 40(t0)
	beq t1, zero, nextstate.9
	nop
	jal nextstate.count
	nop
	
nextstate.9:
	beq t3, 39, nextstate.compute
	nop
	lb t1, 41(t0)
	beq t1, zero, nextstate.compute
	nop
	jal nextstate.count
	nop
	
nextstate.compute:
	beq s2, 2, nextstate.survive
	nop
	beq s2, 3, nextstate.live
	nop
	
nextstate.die:
	sb zero, 0(s0)
	addi t0, t0, 1
	addi s0, s0, 1
	j nextstate.loop
	nop
nextstate.survive:
	sb t2, 0(s0)
	addi t0, t0, 1
	addi s0, s0, 1
	j nextstate.loop
	nop
nextstate.live:
	sb s1, 0(s0)
	addi t0, t0, 1
	addi s0, s0, 1
	j nextstate.loop
	nop
nextstate.count:
	addi s2, s2, 1
	jr ra
	nop
nextstate.copy:
	li t0, 0xf0000000
	la s0, store_data
nextstate.copy_loop:
	beq t0, 0xf0000800, nextstate.end
	nop
	lb t2, 0(s0)
	addi s0, s0, 1
	sb t2, 0(t0)
	addi t0, t0, 1
	
	j nextstate.copy_loop
	nop
nextstate.end:
	jr s4
	nop
	
#######################################################
	
.end main
#include "serialio.S"
.data
.align 2
.comm store_data,2048,4