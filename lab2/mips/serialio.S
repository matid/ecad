
# SerialIO routines

#include "regdef.h"
#define uart_addr 0xF0000840
.previous
.text
.align 2

.globl UART_TXD			
.globl UART_TXD_STR		
.globl UART_TXD_DECIMAL		
.globl UART_TXD_HEX		
.globl UART_TXD_HEX_DIGIT	
.globl UART_RXD			
.globl UART_RXD_HEX		

#------------------------------------------------------------------------------
# Send the lower 8 bits of a0
# Waits until there is room in the tx fifo buffer
# Dirties t0, t1
.align 2
.ent UART_TXD
UART_TXD:
    # wait until the fifo isn't full
    li   t0, uart_addr
  UART_TXD.loop:
    lw   t1, 4(t0)                    # load the control word
    srl  t1, t1,  16
    beq  t1, zero, UART_TXD.loop
    nop
    sw   a0, 0(t0)
    jr   ra
    nop
.end UART_TXD

#------------------------------------------------------------------------------
# Send a null-terminated string starting at byte address a0
# Dirties t0, t1, t2, t3
.align 2
.ent UART_TXD_STR
UART_TXD_STR:
    add  t2, zero, ra		# save the return address
    add  t3, zero, a0		# save the string address
  UART_TXD_STR.start:
    lb   a0, 0(t3)
    beq  a0, zero, UART_TXD_STR.end
    nop
    jal  UART_TXD
    addi t3, t3, 1
    j    UART_TXD_STR.start
    nop
  UART_TXD_STR.end:
    jr   t2
    nop
.end UART_TXD_STR

#------------------------------------------------------------------------------
# Transmit the value in a0 as an ascii integer
# Dirties t0, t1, t2, t3, t4, t5
.align 2
.ent UART_TXD_DECIMAL
UART_TXD_DECIMAL:
    add  t3, zero, a0
    addi t4, zero, 9
    addi t5, zero, 0
  UART_TXD_DECIMAL.loop:
    addi t2, zero, 1
    addi t1, t4, 0
    addi t0, zero, 10
  UART_TXD_DECIMAL.mul10:
    mult t2, t0
    mflo t2
    addi t1, t1, -1
    bne  t1, zero, UART_TXD_DECIMAL.mul10
    nop
    div  zero, t3, t2
    mflo t1
    bne  t1, zero, UART_TXD_DECIMAL.send
    nop
    beq  t5, zero, UART_TXD_DECIMAL.endsend
  UART_TXD_DECIMAL.send:
    addi a0, t1, 48
    addi t5, ra, 0
    jal  UART_TXD
    nop
    addi ra, t5, 0
    addi t5, zero, 1
    mflo t1
    mul  t1, t2
    mflo t2
    sub  t3, t3, t2
  UART_TXD_DECIMAL.endsend:
    addi t4, t4, -1
    bne t4, zero, UART_TXD_DECIMAL.loop
    nop
    addi a0, t3, 48
    jal UART_TXD
    nop
    jr  ra
    nop
.end UART_TXD_DECIMAL

#------------------------------------------------------------------------------
# Transmit 8 hex digits representing the word in a0
# Dirties t0, t1, t2, t3, t4, t5
.align 2
.ent UART_TXD_HEX
UART_TXD_HEX:
    add  t2, zero, ra		# save the return address
    add  t3, zero, a0		# save the value
    addi t4, zero, 32			# shift amount
  UART_TXD_HEX.loop:
    addi t4, t4, -4
    srl a0, t3, t4
    andi a0, a0, 15
    addi t5, a0, -10
    bgez t5, UART_TXD_HEX.letter
    nop
    addi a0, a0, 48
    j    UART_TXD_HEX.tx
    nop
  UART_TXD_HEX.letter:
    addi a0, a0, 55
  UART_TXD_HEX.tx:
    jal  UART_TXD
    nop
    bne  t4, zero, UART_TXD_HEX.loop
    nop
    jr   t2
    nop
.end UART_TXD_HEX

#------------------------------------------------------------------------------
# Transmit lower 4 bits of a0 as a hex digit
# Dirties t0, t1, t2, t3
.align 2
.ent UART_TXD_HEX_DIGIT
UART_TXD_HEX_DIGIT:
    add  t2, zero, ra		# save the return address
    andi a0, a0, 15
    addi t3, a0, -10
    bgez t3, UART_TXD_HEX_DIGIT.letter
    nop
    addi a0, a0, 48
    j    UART_TXD_HEX_DIGIT.tx
    nop
  UART_TXD_HEX_DIGIT.letter:
    addi a0, a0, 55
  UART_TXD_HEX_DIGIT.tx:
    jal UART_TXD
    nop
    jr   t2
    nop
.end UART_TXD_HEX_DIGIT

#------------------------------------------------------------------------------
# Return a byte in v0, and the number of (remaining) bytes
# in the receive fifo in v1
# Dirties t0, t1
.align 2
.ent UART_RXD
UART_RXD:
    # wait until a read is valid
    
  UART_RXD.loop:
    li   t0, uart_addr
    lw   t1, 0(t0)
    andi t0, t1, 0x8000
    beq  t0, zero, UART_RXD.loop
    nop
    andi v0, t1, 0x00FF
    srl  v1, t1, 15
    jr   ra
    nop
.end UART_RXD

#------------------------------------------------------------------------------
# Return a byte in v0 from hex (i.e. 0..9,a..f => 0..15),
# and the number of (remaining) bytes in the receive fifo in v1
# If a non-hex digit is received, 0 is returned
# Dirties t0, t1, t2, t3
.align 2
.ent UART_RXD_HEX
UART_RXD_HEX:
    add  t2, zero, ra		# save the return address
    jal  UART_RXD
    nop
    addi t3, v0, -48
    bltz  t3, UART_RXD_HEX.err
    nop
    addi t3, v0, -58
    bgez t3, UART_RXD_HEX.notnum
    nop
    addi v0, v0, -48
    jr   t2
    nop
  UART_RXD_HEX.notnum:
    addi t3, v0, -65
    bltz  t3, UART_RXD_HEX.err
    nop
    addi t3, v0, -71
    bgez t3, UART_RXD_HEX.notupper
    nop    
    addi v0, v0, -55
    jr   t2
    nop
  UART_RXD_HEX.notupper:
    addi t3, v0, -97
    bltz  t3, UART_RXD_HEX.err
    nop
    addi t3, v0, -103
    bgez t3, UART_RXD_HEX.err
    nop
    addi v0, v0, -87
    jr   t2
    nop
  UART_RXD_HEX.err:
    add  v0, zero, zero
    jr   t2
    nop 
.end UART_RXD_HEX

#------------------------------------------------------------------------------
