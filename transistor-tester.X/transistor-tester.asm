;NOM: Transistor-tester
;DESCRIPTION: vérificateur de transistor à jonction. Détermine si le transistor
;             est fonctionnel ainsi que son type: NPN ou PNP.
;DATE: 2013-03-15
;AUTEUR: Jacques Deschênes
;MCU: PIC10F200/202
;FONCTIONNEMENT: GP0 contrôle la base à travers une résistance de 33K
;                GP1 est relié à l'émetteur.
;                GP2 est relié au collecteur à travers 2 LED en opposisition.
;                La LED verte clignote lorsqu'un transistor NPN fonctionnel est
;                branché au circuit.
;                La LED rouge clignote lorsqu'un transistor PNP fonctionnel est
;                branché au circuit.
;                Si les 2 LED clignotent en alternance c'est qu'il y a un court-
;                circuuit collecteur-émetteur
;                Une aucune LED n'allume c'est que le transistor est défecteux

    include <P10F202.INC>

    __config _WDTE_OFF& _MCLRE_OFF ; pas de watchdog, pas de reset


;;;;;;;;;;;; constantes ;;;;;;;;;;;;;;;;
BASE_P EQU GP0   ; contrôle base transistor
EMT_P  EQU GP1   ;  émetteur transistor
COL_P  EQU GP2   ;  collecteur transistor

OPTION_CFG EQU  B'11000001' ; TIMER0 contrôlé par Fosc/4, diviseur TMR0=4
                            ; pas de weak pullup, pas de wakeup on pin change.

TRIS_CFG EQU  B'1001' ; GP1 et GP2 en sortie

DELAY EQU D'250'

;;;;;;;;;;;; macros ;;;;;;;;;;;;;;;;;;;;
#define BASE  GPIO, BASE_P
#define EMT   GPIO, EMT_P
#define COL   GPIO, COL_P

emt_vss macro ; met l'émetteur à Vss
   bcf EMT
   endm

emt_vdd macro ; met l'émetteur à Vdd
   bsf EMT
   endm

col_vss macro ; met le collecteur à Vss
   bcf COL
   endm

col_vdd macro ; met le collecteur à Vdd
   bsf COL
   endm

base_drive macro ; met BASE_P en mode sortie
   movlw TRIS_CFG & ~(1<<BASE_P)
   tris GPIO
   endm

base_hiz macro ; met BASE_P en haute impédance
   movlw TRIS_CFG
   tris GPIO
   endm

base_vss macro ; met la base à Vss
   base_drive
   bcf BASE
   endm

base_vdd macro ; met la base à Vdd
   base_drive
   bsf BASE
   endm


_delay_ms macro msec
    movlw msec & H'FF'
    movwf dly_cntr
    movlw (msec>>8)& H'FF'
    movwf dly_cntr+1
    call delay_msec
    endm

;;;;;;;;;;;; variables ;;;;;;;;;;;;;;;;;
    udata
dly_cntr res 2

;;;;;;;;;;;; code ;;;;;;;;;;;;;;;;;;;;;;
rst_vector org 0
    movwf OSCCAL
    goto init

delay_msec
    clrf TMR0
    movlw 5
    addwf TMR0, F
    movfw TMR0
    skpz
    goto $-2
    movlw 1
    subwf dly_cntr, F
    skpnc
    goto delay_msec+1
    subwf dly_cntr+1,F
    skpnc
    goto delay_msec+1
    return

;;;;;;;;;;;; initialisation MCU ;;;;;;;;
init
    movlw OPTION_CFG
    option
    movlw  TRIS_CFG ; GP1 et GP2 en sortie
    tris GPIO


;;;;;;;;;;;; procédure principale ;;;;;;
main
;pas de drive sur la base du transistor
;les 2 LEDS devrait-être éteintes
    _delay_ms DELAY
;test NPN
    emt_vss
    col_vdd
    base_vdd ;LED vert devrait allumé.
    _delay_ms DELAY
    base_hiz ;LED vert devrait éteindre
    _delay_ms DELAY
;test PNP
    emt_vdd
    col_vss
    base_vss ; LED rouge devrait allumé
    _delay_ms DELAY
    base_hiz ; LED rouge devrait éteindre
    end




