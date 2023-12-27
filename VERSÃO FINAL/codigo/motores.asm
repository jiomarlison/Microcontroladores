
_main:

;motores.c,1 :: 		void main() {
;motores.c,2 :: 		unsigned int duty = 0;
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      48
	MOVWF      main_sentido_L0+0
;motores.c,4 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;motores.c,5 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;motores.c,7 :: 		TrisB = 0x0F;
	MOVLW      15
	MOVWF      TRISB+0
;motores.c,8 :: 		PortB = 0x0F;
	MOVLW      15
	MOVWF      PORTB+0
;motores.c,9 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;motores.c,10 :: 		NOT_RBPU_bit = 0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;motores.c,11 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;motores.c,12 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;motores.c,13 :: 		PWM1_Set_Duty(duty);
	MOVF       main_duty_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,15 :: 		while(1){
L_main1:
;motores.c,16 :: 		if(UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;motores.c,17 :: 		sentido = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_sentido_L0+0
;motores.c,18 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;motores.c,19 :: 		}
L_main3:
;motores.c,22 :: 		if (sentido == 'q' | sentido == 'Q'){
	MOVF       main_sentido_L0+0, 0
	XORLW      113
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       main_sentido_L0+0, 0
	XORLW      81
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;motores.c,23 :: 		sentido = " ";
	MOVLW      ?lstr_1_motores+0
	MOVWF      main_sentido_L0+0
;motores.c,24 :: 		PWM1_Set_Duty(duty=255);
	MOVLW      255
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,25 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;motores.c,26 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;motores.c,27 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;motores.c,28 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;motores.c,29 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;motores.c,30 :: 		PWM1_Set_Duty(duty=0);
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,31 :: 		}
L_main5:
;motores.c,33 :: 		if (sentido == 'z' | sentido == 'Z'){
	MOVF       main_sentido_L0+0, 0
	XORLW      122
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       main_sentido_L0+0, 0
	XORLW      90
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;motores.c,34 :: 		sentido = " ";
	MOVLW      ?lstr_2_motores+0
	MOVWF      main_sentido_L0+0
;motores.c,35 :: 		PWM1_Set_Duty(duty=255);
	MOVLW      255
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,36 :: 		RB7_bit = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;motores.c,37 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;motores.c,38 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;motores.c,39 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;motores.c,40 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;motores.c,41 :: 		PWM1_Set_Duty(duty=0);
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,42 :: 		}
L_main7:
;motores.c,44 :: 		if (sentido == 'a' | sentido == 'A'){
	MOVF       main_sentido_L0+0, 0
	XORLW      97
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       main_sentido_L0+0, 0
	XORLW      65
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;motores.c,45 :: 		sentido = " ";
	MOVLW      ?lstr_3_motores+0
	MOVWF      main_sentido_L0+0
;motores.c,46 :: 		PWM1_Set_Duty(duty=255);
	MOVLW      255
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,47 :: 		RB7_bit = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;motores.c,48 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;motores.c,49 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;motores.c,50 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;motores.c,51 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;motores.c,52 :: 		PWM1_Set_Duty(duty=0);
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,53 :: 		}
L_main9:
;motores.c,55 :: 		if (sentido == 's' | sentido == 'S'){
	MOVF       main_sentido_L0+0, 0
	XORLW      115
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       main_sentido_L0+0, 0
	XORLW      83
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;motores.c,56 :: 		sentido = " ";
	MOVLW      ?lstr_4_motores+0
	MOVWF      main_sentido_L0+0
;motores.c,57 :: 		PWM1_Set_Duty(duty=255);
	MOVLW      255
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,58 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;motores.c,59 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;motores.c,60 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;motores.c,61 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;motores.c,62 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;motores.c,63 :: 		PWM1_Set_Duty(duty=0);
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,64 :: 		}
L_main11:
;motores.c,66 :: 		if (sentido == 'x' | sentido == 'X'){
	MOVF       main_sentido_L0+0, 0
	XORLW      120
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       main_sentido_L0+0, 0
	XORLW      88
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main13
;motores.c,67 :: 		sentido = " ";
	MOVLW      ?lstr_5_motores+0
	MOVWF      main_sentido_L0+0
;motores.c,68 :: 		PWM1_Set_Duty(duty=255);
	MOVLW      255
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,69 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;motores.c,70 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;motores.c,71 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;motores.c,72 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;motores.c,73 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;motores.c,74 :: 		PWM1_Set_Duty(duty=0);
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,75 :: 		}
L_main13:
;motores.c,77 :: 		if (sentido == 'w' | sentido == 'W'){
	MOVF       main_sentido_L0+0, 0
	XORLW      119
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       main_sentido_L0+0, 0
	XORLW      87
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;motores.c,78 :: 		sentido = " ";
	MOVLW      ?lstr_6_motores+0
	MOVWF      main_sentido_L0+0
;motores.c,79 :: 		PWM1_Set_Duty(duty=255);
	MOVLW      255
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,80 :: 		RB7_bit = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;motores.c,81 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;motores.c,82 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;motores.c,83 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;motores.c,84 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;motores.c,85 :: 		PWM1_Set_Duty(duty=0);
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;motores.c,86 :: 		}
L_main15:
;motores.c,88 :: 		}
	GOTO       L_main1
;motores.c,89 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
