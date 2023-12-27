#line 1 "C:/Users/PROFESSOR/Desktop/SIS. MIC. PROJETO 03 - CONTROLE SERIAL/VERSÃO FINAL/codigo/motores.c"
void main() {
 unsigned int duty = 0;
 char sentido = '0';
 UART1_Init(9600);
 delay_ms(100);

 TrisB = 0x0F;
 PortB = 0x0F;
 CMCON = 7;
 NOT_RBPU_bit = 0;
 PWM1_Init(5000);
 PWM1_Start();
 PWM1_Set_Duty(duty);

 while(1){
 if(UART1_Data_Ready()){
 sentido = UART1_Read();
 delay_ms(100);
 }


 if (sentido == 'q' | sentido == 'Q'){
 sentido = " ";
 PWM1_Set_Duty(duty=255);
 RB7_bit = 0;
 RB6_bit = 1;
 RB5_bit = 0;
 RB4_bit = 1;
 delay_ms(1000);
 PWM1_Set_Duty(duty=0);
 }

 if (sentido == 'z' | sentido == 'Z'){
 sentido = " ";
 PWM1_Set_Duty(duty=255);
 RB7_bit = 1;
 RB6_bit = 0;
 RB5_bit = 1;
 RB4_bit = 0;
 delay_ms(1000);
 PWM1_Set_Duty(duty=0);
 }

 if (sentido == 'a' | sentido == 'A'){
 sentido = " ";
 PWM1_Set_Duty(duty=255);
 RB7_bit = 1;
 RB6_bit = 1;
 RB5_bit = 0;
 RB4_bit = 1;
 delay_ms(1000);
 PWM1_Set_Duty(duty=0);
 }

 if (sentido == 's' | sentido == 'S'){
 sentido = " ";
 PWM1_Set_Duty(duty=255);
 RB7_bit = 0;
 RB6_bit = 1;
 RB5_bit = 1;
 RB4_bit = 1;
 delay_ms(1000);
 PWM1_Set_Duty(duty=0);
 }

 if (sentido == 'x' | sentido == 'X'){
 sentido = " ";
 PWM1_Set_Duty(duty=255);
 RB7_bit = 0;
 RB6_bit = 1;
 RB5_bit = 1;
 RB4_bit = 0;
 delay_ms(1000);
 PWM1_Set_Duty(duty=0);
 }

 if (sentido == 'w' | sentido == 'W'){
 sentido = " ";
 PWM1_Set_Duty(duty=255);
 RB7_bit = 1;
 RB6_bit = 0;
 RB5_bit = 0;
 RB4_bit = 1;
 delay_ms(1000);
 PWM1_Set_Duty(duty=0);
 }

 }
}
