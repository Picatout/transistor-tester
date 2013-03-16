/*
 * transistor_tester.asm
 *
 *  Created: 2013-03-16 11:02:54
 *   Author: Jacques
 *  Vérificateur de Transistor bi-jonction.  LED vert clignotant indique NPN fonctionnel. LED rouge clignotant indique PNP fonctionnel.
 */ 

 .NOLIST
 .include "tn13Adef.inc"
 .LIST

 .equ BASE_P  =PB0
 .equ EMT_P   =PB3
 .equ COL_P   =PB4
 .equ DELAY   =250
 
.macro base_hiz
    cbi DDRB, BASE_P
.endm

.macro base_drive
    sbi DDRB, BASE_P
.endm

.macro base_vss
    cbi PORTB, BASE_P
.endm

.macro base_vdd
    sbi PORTB, BASE_P
.endm

.macro emt_vss
    cbi PORTB, EMT_P
.endm

.macro emt_vdd
    sbi PORTB, EMT_P
.endm

.macro col_vss
    cbi PORTB, COL_P
.endm

.macro col_vdd
    sbi PORTB, COL_P
.endm

.macro _delay_ms // F_OSC=1Mhz, 1usec/cycle
    ldi R24, (@0*200) & 0xFF
	ldi R25, ((@0*200)>>8) & 0xFF
	ldi R26, ((@0*200)>>16) & 0xFF
l01:
	subi R24,1  // 1cycle
	sbci R25,0  // 1cycle
	sbci R26,0  // 1cycle
	brne l01    // 2cycles, total 5 cycles= 5usec*200=1000usec
	nop
.endm

 .dseg
 
 .listmac

 .cseg
 .org 0 // on peut commencer à zéro car on n'utilise pas les interruptions
 // pas d'interruption pas de sous-routines donc pas besoin de stack
 //    ldi R0, low(RAMEND)
 //	 out spl, r0
     eor R2,R2
	 out PORTB, R2
	 ldi R16, (1<<EMT_P) | (1<<COL_P)
	 out DDRB, R16
main:
     base_hiz
	 _delay_ms DELAY
	 // test NPN
	 base_drive
	 base_vdd
	 emt_vss
	 col_vdd
	 _delay_ms DELAY
	 // test PNP
	 base_vss
	 emt_vdd
	 col_vss
	 _delay_ms DELAY
	 rjmp main
