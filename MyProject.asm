
_Password_prompt:

;MyProject.c,26 :: 		void Password_prompt(){
;MyProject.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,28 :: 		Lcd_Out(1, 1, "Motor is Off");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,29 :: 		Lcd_Out(2,1,"and Locked");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,30 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Password_prompt0:
	DECFSZ     R13+0, 1
	GOTO       L_Password_prompt0
	DECFSZ     R12+0, 1
	GOTO       L_Password_prompt0
	DECFSZ     R11+0, 1
	GOTO       L_Password_prompt0
	NOP
	NOP
;MyProject.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,33 :: 		Lcd_Out(1, 1, "Enter 6 digit no:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,35 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);                // Cursor off
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,37 :: 		}
L_end_Password_prompt:
	RETURN
; end of _Password_prompt

_Init:

;MyProject.c,40 :: 		void Init(){
;MyProject.c,41 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,44 :: 		Lcd_Out(1, 1, "Welcome to");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,45 :: 		Lcd_Out(2, 1, "Password Lock");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,48 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_Init1:
	DECFSZ     R13+0, 1
	GOTO       L_Init1
	DECFSZ     R12+0, 1
	GOTO       L_Init1
	DECFSZ     R11+0, 1
	GOTO       L_Init1
	NOP
	NOP
;MyProject.c,49 :: 		Password_prompt();
	CALL       _Password_prompt+0
;MyProject.c,50 :: 		TRISB=0;
	CLRF       TRISB+0
;MyProject.c,52 :: 		count=0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,53 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;MyProject.c,54 :: 		}
L_end_Init:
	RETURN
; end of _Init

_me:

;MyProject.c,57 :: 		int me(char a[],char g[]){
;MyProject.c,58 :: 		int i=0;
	CLRF       me_i_L0+0
	CLRF       me_i_L0+1
;MyProject.c,59 :: 		for(i;i<6;i++){
L_me2:
	MOVLW      128
	XORWF      me_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__me43
	MOVLW      6
	SUBWF      me_i_L0+0, 0
L__me43:
	BTFSC      STATUS+0, 0
	GOTO       L_me3
;MyProject.c,60 :: 		if(a[i]!=g[i]){
	MOVF       me_i_L0+0, 0
	ADDWF      FARG_me_a+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       me_i_L0+0, 0
	ADDWF      FARG_me_g+0, 0
	MOVWF      FSR
	MOVF       R1+0, 0
	XORWF      INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_me5
;MyProject.c,61 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_me
;MyProject.c,62 :: 		}
L_me5:
;MyProject.c,59 :: 		for(i;i<6;i++){
	INCF       me_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       me_i_L0+1, 1
;MyProject.c,63 :: 		}
	GOTO       L_me2
L_me3:
;MyProject.c,64 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
;MyProject.c,65 :: 		}
L_end_me:
	RETURN
; end of _me

_Check_password:

;MyProject.c,68 :: 		int Check_password(){
;MyProject.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,71 :: 		if(me(actual_password, given_password)==1){
	MOVLW      _actual_password+0
	MOVWF      FARG_me_a+0
	MOVLW      _given_password+0
	MOVWF      FARG_me_g+0
	CALL       _me+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_password45
	MOVLW      1
	XORWF      R0+0, 0
L__Check_password45:
	BTFSS      STATUS+0, 2
	GOTO       L_Check_password6
;MyProject.c,72 :: 		Lcd_Out(1, 1, "Password Matched");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,73 :: 		Lcd_Out(2,1,"Motor is on");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,75 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_Check_password
;MyProject.c,76 :: 		}
L_Check_password6:
;MyProject.c,78 :: 		Lcd_Out(1, 1, "Incorrect Password");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,79 :: 		Lcd_Out(2, 1, "Try Again!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,81 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_Check_password8:
	DECFSZ     R13+0, 1
	GOTO       L_Check_password8
	DECFSZ     R12+0, 1
	GOTO       L_Check_password8
	DECFSZ     R11+0, 1
	GOTO       L_Check_password8
	NOP
;MyProject.c,82 :: 		Password_prompt();
	CALL       _Password_prompt+0
;MyProject.c,83 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;MyProject.c,87 :: 		}
L_end_Check_password:
	RETURN
; end of _Check_password

_main:

;MyProject.c,90 :: 		void main() {
;MyProject.c,91 :: 		Init();
	CALL       _Init+0
;MyProject.c,92 :: 		do {
L_main9:
;MyProject.c,93 :: 		kp = 0;                                // Reset key code variable
	CLRF       _kp+0
;MyProject.c,94 :: 		if(count==6)
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      6
	XORWF      _count+0, 0
L__main47:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;MyProject.c,96 :: 		PORTB.B7=Check_password();    //0/1 according to password check and drives the motor
	CALL       _Check_password+0
	BTFSC      R0+0, 0
	GOTO       L__main48
	BCF        PORTB+0, 7
	GOTO       L__main49
L__main48:
	BSF        PORTB+0, 7
L__main49:
;MyProject.c,97 :: 		count=0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,98 :: 		if(PORTB.B7==1){
	BTFSS      PORTB+0, 7
	GOTO       L_main13
;MyProject.c,99 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;MyProject.c,100 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,102 :: 		Lcd_Out(1,1,"Press * to Off");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,103 :: 		Lcd_Out(2,1,"and Lock again");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,104 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);           // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,106 :: 		do
L_main15:
;MyProject.c,108 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,109 :: 		while (kp!=13);
	MOVF       R0+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;MyProject.c,110 :: 		if(kp==13){
	MOVF       _kp+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;MyProject.c,111 :: 		PORTB.B7=0;
	BCF        PORTB+0, 7
;MyProject.c,112 :: 		Password_prompt();
	CALL       _Password_prompt+0
;MyProject.c,113 :: 		}
L_main18:
;MyProject.c,114 :: 		}
L_main13:
;MyProject.c,115 :: 		}
L_main12:
;MyProject.c,117 :: 		do
L_main19:
;MyProject.c,119 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;MyProject.c,120 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main19
;MyProject.c,121 :: 		switch (kp) {
	GOTO       L_main22
;MyProject.c,122 :: 		case  1: kp = 49;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 1        // Uncomment this block for keypad4x4
L_main24:
	MOVLW      49
	MOVWF      _kp+0
	MOVLW      49
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,123 :: 		case  2: kp = 50;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 2
L_main25:
	MOVLW      50
	MOVWF      _kp+0
	MOVLW      50
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,124 :: 		case  3: kp = 51;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 3
L_main26:
	MOVLW      51
	MOVWF      _kp+0
	MOVLW      51
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,125 :: 		case  4: kp = 65;Lcd_Chr_Cp(kp); break; // A
L_main27:
	MOVLW      65
	MOVWF      _kp+0
	MOVLW      65
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	GOTO       L_main23
;MyProject.c,126 :: 		case  5: kp = 52;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 4
L_main28:
	MOVLW      52
	MOVWF      _kp+0
	MOVLW      52
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,127 :: 		case  6: kp = 53;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 5
L_main29:
	MOVLW      53
	MOVWF      _kp+0
	MOVLW      53
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,128 :: 		case  7: kp = 54;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 6
L_main30:
	MOVLW      54
	MOVWF      _kp+0
	MOVLW      54
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,129 :: 		case  8: kp = 66;Lcd_Chr_Cp(kp); break; // B
L_main31:
	MOVLW      66
	MOVWF      _kp+0
	MOVLW      66
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	GOTO       L_main23
;MyProject.c,130 :: 		case  9: kp = 55;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 7
L_main32:
	MOVLW      55
	MOVWF      _kp+0
	MOVLW      55
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,131 :: 		case 10: kp = 56;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 8
L_main33:
	MOVLW      56
	MOVWF      _kp+0
	MOVLW      56
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,132 :: 		case 11: kp = 57;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 9
L_main34:
	MOVLW      57
	MOVWF      _kp+0
	MOVLW      57
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,133 :: 		case 12: kp = 67;Lcd_Chr_Cp(kp); break; // C
L_main35:
	MOVLW      67
	MOVWF      _kp+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	GOTO       L_main23
;MyProject.c,134 :: 		case 13: kp = 42;Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);count--; break; // *
L_main36:
	MOVLW      42
	MOVWF      _kp+0
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
	GOTO       L_main23
;MyProject.c,135 :: 		case 14: kp = 48;Lcd_Chr_Cp(kp);given_password[count]=kp;count++; break; // 0
L_main37:
	MOVLW      48
	MOVWF      _kp+0
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	MOVF       _count+0, 0
	ADDLW      _given_password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,136 :: 		case 15: kp = 35;Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);count++; break; // #
L_main38:
	MOVLW      35
	MOVWF      _kp+0
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	GOTO       L_main23
;MyProject.c,137 :: 		case 16: kp = 68;Lcd_Chr_Cp(kp); break; // D
L_main39:
	MOVLW      68
	MOVWF      _kp+0
	MOVLW      68
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	GOTO       L_main23
;MyProject.c,139 :: 		}
L_main22:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main28
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main29
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main30
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main31
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main33
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main34
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main36
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main39
L_main23:
;MyProject.c,140 :: 		} while (1);
	GOTO       L_main9
;MyProject.c,142 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
