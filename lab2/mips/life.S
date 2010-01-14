#######################################################
## Game of Life
##
## Name: Mateusz Drozdzynski
## College: King's
## CRSID: md481
## Date: 01/12/2009
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
	# load the base framebuffer address
	li t0, 0xf0000000
	# load the base store address
	la s0, store_data
	# load 1 (useful constant)
	li s1, 1
	# move the return address to s4
	addi s4, ra, 0
	
nextstate.loop:
	# when finished processing, copy the store to framebuffer
	beq t0, 0xf0000500, nextstate.copy
	# initialise the counter to 0
	li s2, 0
	# calculate the column and store it in t3
	li t3, 40
	li t4, 0xf0000000
	sub t4, t0, t4
	div t4, t3
	mfhi t3
	# skip some checks if at top row
	ble t0, 0xf0000029, nextstate.4
	nop
	
nextstate.1:
	# skip if at first column
	beq t3, 0, nextstate.2
	nop
	# load top left cell
	lb t1, -41(t0)
	# skip the count if zero
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
	# keep the cell state if it has two neighbours
	beq s2, 2, nextstate.survive
	nop
	# make the cell alive if it has three neighbours
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
	# finish when all cells are copied
	beq t0, 0xf0000500, nextstate.end
	nop
	# load the cell state from the store
	lb t2, 0(s0)
	# increase the store address
	addi s0, s0, 1
	# write the state to framebuffer
	sb t2, 0(t0)
	# increase framebuffer address
	addi t0, t0, 1
	
	# continue looping
	j nextstate.copy_loop
	nop

nextstate.end:
	# jump back to original ra (stored in s4)
	jr s4
	nop
	
#######################################################
	
.end main
#include "serialio.S"
.data
.align 2
.comm store_data,2048,4

#######################################################
#
# 1. The incremental compilation is especially useful
#    for big projects where compiling the whole design
#    takes a substantial amount of time. With IC enabled
#    only the modules that were changed are recompiled.
#
# 2. Branch delay slots are instructions that are
#    executed after a branch instruction regarless of
#    whether the branch actually happened or not.
#    This is due to the fact that the pipeline is
#    running continuously and new instructions are
#    fetched before a branch is resolved.
#
# 3. The MIPS processor is software interlocked.