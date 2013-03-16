/*
 * transistor_tester.c
 *
 * Created: 2013-03-16 10:28:54
 *  Author: Jacques
 * Description: utilise 2 LEDs pour indiquer le type de transistor bi-jonction NPN ou PNP et s'il et en bon état.
 * PB0 contrôle la base du transistor
 * PB3 contrôle l'émetteur
 * PB4 contrôle le collecteur
 */ 

#define F_OSC 1000000 // 1 Mhz

#include <avr/io.h>
#include <util/delay.h>

#define BASE_P PB0
#define EMT_P  PB3
#define COL_P  PB4

#define emt_vss() (PORTB &= ~(1<<EMT_P))
#define emt_vdd() (PORTB |= 1<<EMT_P)
#define col_vss() (PORTB &= ~(1<<COL_P))
#define col_vdd() (PORTB |= 1<<COL_P)
#define base_drive() (DDRB |= 1<<BASE_P)
#define base_hiz() (DDRB &= ~(1<<BASE_P))
#define base_vss() (PORTB&=~(1<<BASE_P))
#define base_vdd() (PORTB|=1<<BASE_P)
  

#define DELAY 250

int main(void)
{
	PORTB = 0;
	DDRB = 1<<EMT_P | 1<<COL_P;
	
    while(1)
    {
       base_hiz();
	   _delay_ms(DELAY);
	   base_drive();
	   // test pour NPN
	   emt_vss();
	   col_vdd();
	   base_vdd();
	   _delay_ms(DELAY);
	   // test pour PNP
	   base_vss();
	   emt_vdd();
	   col_vss();
	   _delay_ms(DELAY);
	           
    }
}