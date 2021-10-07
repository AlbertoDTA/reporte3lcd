#include "p16F628a.inc"    
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    

RES_VECT  CODE    0x0000            ; processor reset vector
    
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
  
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program

i EQU 0x20
j EQU 0x21
x equ 0x30
y equ 0x31
z equ 0x32
a equ 0x33 

START
    
    
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0 
    CLRF TRISB
    CLRF TRISA
    BCF STATUS, RP0
    
    BCF PORTA,1
    BCF PORTA,0
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
INICIO	  
   
    CALL first
    CALL tiempo
    CALL Limpia
    CALL second
    CALL tiempo
    CALL Limpia
    CALL third
    CALL tiempo
    CALL Limpia
        
    GOTO INICIO


first
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x83		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'B'
    MOVWF PORTB
    CALL exec

    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW 'A'
    MOVWF PORTB
    CALL exec

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC2		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'O'
    MOVWF PORTB
    CALL exec

    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec

    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x82		;LCD position
    MOVWF PORTB
    CALL exec
    RETURN
    
    
second
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x85		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'C'
    MOVWF PORTB
    CALL exec

    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC2		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'T'
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW '7'
    MOVWF PORTB
    CALL exec
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec


    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x82		;LCD position
    MOVWF PORTB
    CALL exec
    RETURN
 
third    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x81		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'J'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec


    

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC3		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
     MOVLW ' '
    MOVWF PORTB
    CALL exec
    
     MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    
    
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x82		;LCD position
    MOVWF PORTB
    CALL exec
    RETURN    
    
exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN

Limpia
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec


    

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC1		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec 
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    
    
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    RETURN    

   tiempo
    movlw d'201' ;establecer valor de la variable k
    movwf x
    xloop:
    nop
    decfsz x,f
    goto xloop
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    movlw d'252' ;establecer valor de la variable i
    movwf y
    yloop:
    nop ;NOPs de relleno (ajuste de tiempo)
    nop
    nop
    nop
    nop
    nop 
    movlw d'113' ;establecer valor de la variable j
    movwf z
    zloop:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'10' ;establecer valor de la variable k
    movwf a
    aloop:
    decfsz a,f
    goto aloop
    decfsz z,f
    goto zloop
    decfsz y,f
    goto yloop
    RETURN ;salir de la rutina de tiempo y regresar al
    ;valor de contador de programa
			
    END