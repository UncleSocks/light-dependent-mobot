;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Author: Tyrone Kevin Ilisan	      	;
;Date: 01 October 2018			;
;Version: 1.0				;
;Title: Light-Dependent MOBOT		;
;					;
;Description: PIC16F84			;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


STATUS EQU 03H
TRISA EQU 85H
TRISB EQU 86H
PORTA EQU 05H
PORTB EQU 06H
COUNT1 EQU 08H

BSF STATUS,5
MOVLW 00H
MOVWF PORTA 
MOVLW B'11111111'
MOVWF PORTB
BCF STATUS,5

MAIN
TEST_FORWARD BTFSC PORTB,0 
		     GOTO MOVE_FORWARD
		     GOTO TEST_LEFT
		     
MOVE_FORWARD CALL DELAY
		     MOVLW 05H
			 MOVWF PORTA
			 GOTO TEST_FORWARD
			 
TEST_LEFT BTFSC PORTB,1
		  GOTO MOVE_LEFT
		  GOTO TEST_HARDLEFT
		  
MOVE_LEFT CALL DELAY
		  MOVLW 09H
	 	  MOVWF PORTA
	 	  GOTO TEST_LEFT
	 	  
TEST_HARDLEFT BTFSC PORTB,2
		      GOTO MOVE_HARDLEFT
		      GOTO TEST_RIGHT
		      
MOVE_HARDLEFT CALL DELAY
			  MOVLW 02H
			  MOVWF PORTA
			  GOTO TEST_HARDLEFT
			  
TEST_RIGHT BTFSC PORTB,3
		   GOTO MOVE_RIGHT
		   GOTO TEST_HARDRIGHT
		   
MOVE_RIGHT CALL DELAY
		   MOVLW 0AH
		   MOVWF PORTA
		   GOTO TEST_RIGHT
		   
TEST_HARDRIGHT BTFSC PORTB,4
			   GOTO MOVE_HARDRIGHT
			   GOTO STOP
			   
MOVE_HARDRIGHT CALL DELAY
			   MOVLW 04H
			   MOVWF PORTA
			   GOTO TEST_HARDRIGHT
			   
STOP MOVLW 00H
	 MOVWF PORTA
	 GOTO MAIN

DELAY 
		LOOP DECFSZ COUNT1,1
		GOTO LOOP
		RETURN
		
END
