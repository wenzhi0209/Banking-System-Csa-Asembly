.MODEL small
.STACK 100
.DATA
	;Variable for Title & login
	TTL DB '                --------------|POPULAR BANK BHD|--------------',0DH,0AH
		DB '                   [Login Before Requesting Any Services!]',0DH,0AH,0DH,0AH,'$'
	LOGIN DB '                ---------------------------------------------',0DH,0AH
		  DB '                                   :Login: $'
	SIGN  DB '                ---------------------------------------------',0DH,0AH,'$'
	SLOGIN DB 0DH,0AH,'                       Enter Your Account ID: $'
	SPSW DB '                         Enter Your Password: $'
	;ERROR MESSAGE
	WRID DB '                                 !WRONG ID!$'
	WRPSW DB '                              !WRONG PASSWORD!$'
	RETRY DB 10,13,'                              ----------------',0DH,0AH
		  DB '                               Retry?-(Y|N): $' 
	INPUT DB 4 DUP("$")
	INPUT1 DB 6 DUP("$")
	;CUSTOMER DETAILS
	CUST_A DB 'A001'
	CUST_B DB 'A002'
	PASS_A DB 'csa123'
	PASS_B DB 'abc123'
	NOTE_A DW 3000	;BALANCE FOR CUSTOMER A AND B
	CENT_A DW 30
	NOTE_B DW 20000
	CENT_B DW 30
	VERIFY DB ?
	;--------------------------------------------------------------------------------------------
	;Variable for Menu & Selection 
	WELCOME DB 0DH,0AH,'                      ----------------------------------',0DH,0AH
			DB '                        |Welcome to POPULAR BANK BHD!|',0DH,0AH
			DB '                      ---------------------------------- ',0DH,0AH,'$'
	MENU DB '                                 SERVICE MENU',0DH,0AH
	     DB '                                 ~~~~~~~~~~~~',0DH,0AH
	     DB '                             1. Deposit Service',0DH,0AH
	     DB '                             2. Withdraw Service',0DH,0AH
	     DB '                             3. Transfer Service',0DH,0AH
	     DB '                             4. Summary Report',0DH,0AH
		 DB '                             5. Login with another account',0DH,0AH,'$'
	SELECTION DB 'Enter (1 to 5 for services above, ANY KEY to leave): $'
	CHOICE DB ?
	;--------------------------------------------------------------------------------------------
	;TRANSFER
	;DISPLAY PURPOSE
	TRANSFER_TTL DB 13,10,'                              ~~~~~~~~~~~~~~~~',13,10
	         DB '                              Transfer Service',13,10
			 DB '                              ~~~~~~~~~~~~~~~~',13,10,'$'
	NL DB 0DH,0AH,'$'
	CURRENT_ACC DB '                        ACCOUNT LOGGED IN: $'
	CURRENT_BAL DB '                        CURRENT BALANCE:RM $'
	ACCOUNT_BAL DB '                      YOUR ACCOUNT BALANCE: RM $'
	;SUMMARY ABOUT THE TRANSFER
	TRANS_SUM DB 10,13,'                           ---------------------',10,13
			  DB '                           |TRANSACTION SUMMARY|',10,13
			  DB '                           ---------------------$'
	TRANSFER_AMT DB 10,13,'                        TRANSFER AMOUNT: RM $'
	TAX_AMT DB 10,13,'                        TAX AMOUNT     : RM  $'
	TOTAL_TRANS_AMT DB 10,13,'                        TOTAL AMOUNT   : RM $'
	;PROMPT USER
	ASKACC DB 'Beneficiary Account no: $'
	ASKAMOUNT DB 0DH,0AH,'Amount (RM xxxx.xx):RM $'
	ASKCONT DB 0DH,0AH,'Continue?(Y/N): $'
	confirmation1 DB 'Are you confirm to transfer RM $'	
	confirmation2 DB ' to this account $'	
	confirmation3 DB 10,13,'Confirm?(Y/N): $'	
	;ERROR MESSAGE
	DUP_ACC DB 0DH,0AH,'                          !DUPLICATE ACCOUNT!$'
	INSUF_BAL DB 0DH,0AH,'                          !INSUFFICIENT BALANCE!$'
	INVALID_AMOUNT DB 10,13,'                        INVALID AMOUNT TO TRANSFER!'
	               DB 10,13,'MINIMUM TRANSFER IS RM 1.00 AND MAXIMUM TRANSFER AMOUNT IS RM 9999.00(INC. TAX)!$'
	INVALID_NUM DB 'YOUR INPUT MUST ONLY INCLUDE NUMBERS!',10,13,'$'
	;VERIFICATION
	DUPLICATE DB ?
	;STRING INPUT 
	AMOUNT LABEL BYTE
	MAX_AMOUNT DB 8
	ACT_AMOUNT DB ?
	AMOUNT_STORED DB 8 DUP ('$')
	;TRANSFER AMOUNT
	ACTUAL_AMOUNT_NOTE DB 4 DUP (0)
	REAL_AMOUNT_NOTE DW ?
	CENT_ARR DB 3 DUP(0)
	REAL_AMOUNT_CENT DB ?
	;TAX PART
	TAX DB 5 DUP (0)
	TAX_AMOUNT_NOTE DB ?
	TAX_AMOUNT_CENT DB ?
	;TOTAL AMOUNT
	TOTAL_AMOUNT_NOTE DW ?
	TOTAL_AMOUNT_CENT DW ?
	;COUNTER/DIV PURPOSE/MUL PURPOSE/STORAGE
	TTHOUSAND_AMOUNT_STORED1 DW 0
	TTHOUSAND_AMOUNT_STORED2 DW 0
	MULTIPLICANT DW 1
	TEN_THOUSAND DW 10000
	THOUSAND DW 1000
	TEN DW 10
	QUO DW ?
	COUNTER DB 0
	HUNDRED DB 100
	ONE DB 1
	THREE DW 3
	TOTAL DW 0
	HUNDREDS DW 100
	TENS DB 10

	NUMBER LABEL BYTE
	MAX_NUMBER DB 6
	ACT_NUMBER DB ?
	NUMBER_STORED DB 6 DUP ('$')
	ACTUAL_NUMBER DB 6 DUP (0)

	WDMENU  DB "			PLEASE SELECT WITHDRAW AMOUNT (1 to 9)",10,13
			DB "                      ------------------------------------------",10,13
			DB "		      1. RM 5000		       2. RM2000",10,13
			DB "		      3. RM 1000		       4. RM 500",10,13
			DB "		      5. RM  200		       6. RM 100",10,13
			DB "	  	      7. RM   50		       8. RM  20",10,13
			DB "	  	      9. Other amount",10,13,"$"
	WDSHOW DB "Current Amount > RM $"
	WDSELECT DB "Enter your selection (Other KEY to leave) : $"
	WDWRONG DB "Invalid input, please try again.",10,13,"$"
	WDERROR DB "Your current amount is not enough to withdraw this amount.",10,13,"$"
	WDEND DB "The transaction is finish. Your last amount is > (RM) $"
	WDASK DB "Please enter the amount you want to withdraw",10,13
		  DB "(Maximum withdraw amount is RM 50,000) : (RM) $"
	WDSALAH DB "Only the amount in multiple 10 can withdraw.$"
	WDERRORR DB "Your withdraw amount is over RM 50,000, please try again.$"
	WDCONFIRM DB "This transaction will charge RM $"
	WDYESNO DB "Would you like to continue? (Yes = Y, No = N) > $"
	WDINPUTERROR DB "Wrong input, please try again.$"
	WDSELECTION DB ?
	TTNOTE DW 0
	TTHOU DB ?
	CURRENTNOTE DW 0
	CURRENTCENT DW 0
	ANOTHER_ACCOUNT DB ?
	WD_RINGGIT_CHARGE DW ?
	WD_CENT_CHARGE DW ?
	SOLVE_DUPLICATE_REGISTER DW ?
	;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
	
	curAmt db 0dh,0ah,"Your account current amount	                      : $"
	waydep db "Deposit RM 20 pls key in (000020.00) dot auto show. MIN DEP AMT :RM20 $"
	addAmt db 0dh,0ah,"Please enter deposit amount (Q for terminate process) : RM $"
	depAmt db 0dh,0ah,"Total deposit amount     	                      : $"
	conMsg db "Please enter any key to continue ... $"

	futInt db "Future Interest Can Receive with Current Amount $"
	intAmt db 0dh,0ah,"			 Interest	Total Amount$"
	invalid db "The amount is over limit or below the requirement... $"
	dicision db ?
	cMsg db 0dh,0ah,"Are you confirm to deposit $"
	time db 0dh,0ah,"Time : $"
	oneY db 0dh,0ah,"1 years --   $"
	fiveY db 0dh,0ah,"5 years --   $"
	tenY db 0dh,0ah,"10 years --  $"
	RM db 'RM $'
	confirmD DB 10,13,'Confirm?(Y/N) (Q for terminate deposit) : $'	
	sumMsg db 0ah,0dh,'Summary of ALL Transaction $'
	numSumMsg db 0ah,0dh,'Number of transaction done : $'
	OutMt db '   OUT (Transfer) - $'
	InMt db '   IN  (Transfer) - $'
	OutMw db '   OUT (Withdraw) - $'
	InMd db'   IN  (Deposit)  - $'
	tendisplay db '10$'
	
	;stored amout
	tthousand_W db 0
	ringgit dw 0
	sen dw 0
	;add amount
	tthousand_ADD_W db 0
	ringgit_ADD_w dw 0
	sen_ADD_w dw 0
	irateU dw 12
	
	;interest amount
	iringgit dw 1000
	isen dw 10
	;store future amount
	inttthousand db 0
	intringgit dw 0
	intsen dw 0
	;store total interest
	t_iringgit dw 0
	t_isen dw 0
	t_tthousand db 0
	
	
	stoAmt db 0,0,0,0,0
	point db 0,0
	
	;special==============
	splace db 0
	
	
	tent dw 10000
	thousand_w dw 1000
	hundred_w dw 100
	ten_w dw 10
	
	total_wz dw 0
	
	tens_b db 10
	hundreds_b db 100
	location dw 0
	
	
	
	
	;temporaly place
	placeR dw 0
	placeS dw 0
	placett db 0
	typeIn db 0
	quo_w dw 0;store quotient
	re dw 0;store remainder
	quo2 db 0;byte ver
	re2 db 0;byte ver
	
	;date
	yearArr db 0,0,0,0
	year dw 0
	month db 0
	day db 0
	dweek db 0
	incY dw 0 ;interface for determine which yearArr
	;time 
	hours db 0
	minutes db 0
	seconds db 0

	
	;-----------------------------------------------------------------------------
	;SUMMARY-----------------------------------------------------------------------------
	
	ArrRecordA db 10 dup(5) ;maximun 10 latest record 1 is +amount 0 is -amount
	RtthousandA db 10 dup(0);
	RringgitA dw 10 dup(0)
	RsenA dw 10 dup(0)
	stoyearA dw 10 dup(0)
	stomonthA db 10 dup(0)
	stodayA db 10 dup(0)
	stohourA db 10 dup(0)
	stominA db 10 dup(0)
	stosecA db 10 dup(0)
	numRA dw 0
	numRAw dw 0;word size array
	noTranA db 0;
	
	ArrRecordB db 10 dup(5) ;maximun 10 latest record 1 is +amount 0 is -amount
	RtthousandB db 10 dup(0);
	RringgitB dw 10 dup(0)
	RsenB dw 10 dup(0)
	stoyearB dw 10 dup(0)
	stomonthB db 10 dup(0)
	stodayB db 10 dup(0)
	stohourB db 10 dup(0)
	stominB db 10 dup(0)
	stosecB db 10 dup(0)
	noTranB db 0

	numRB dw 0
	numRBw dw 0 ;word size array
	
	ttplace db 0;
	tempSI dw 0
	tempCX dw 0
	sortnum db 0
	;----------------------------------------------------------------------------------
	
	
.CODE 
MAIN PROC FAR
	MOV AX,@DATA
	MOV DS,AX
	
	;1-TITLE WITH LOGIN 
	;TITLE
	MOV AH,09H
	LEA DX,TTL
	INT 21H
	
	;LOGIN
	
	MOV AH,09H
	LEA DX,LOGIN
	INT 21H
	
	CUST_LOGIN:
	MOV AH,09H
	LEA DX,SLOGIN
	INT 21H
	
	MOV CX,4
	MOV SI,0
	LOGININPUT:
		MOV AH,01H
		INT 21H
		MOV INPUT[SI],AL
		INC SI
	LOOP LOGININPUT
	
	;CHECKING FOR CUSTOMER A ID
	MOV CX,4
	MOV SI,0
	MOV DI,0
	
	CUST_A_CHECK:
		MOV BH,CUST_A[DI]
		CMP BH,INPUT[SI]
		JNE CUST_B_CHECK ; TRY TO COMPARE WITH OTHER CUSTOMER
		INC SI
		INC DI
	LOOP CUST_A_CHECK
	JMP PSW_A
	
	;CHECKING FOR CUSTOMER B ID
	MOV CX,4
	MOV SI,0
	MOV DI,0
	CUST_B_CHECK: 
		MOV BH,CUST_B[DI]
		CMP BH,INPUT[SI]
		JNE WRONGID
		INC SI
		INC DI
	LOOP CUST_B_CHECK
	JMP PSW_B
	
	;IF WRONG ID
	WRONGID:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		mov ah,09H
		mov cx,43
		mov bh,0
		mov bl,0Ch
		int 10h
		LEA DX,WRID
		INT 21H
	JMP RT1
	RETRYSHOW:
	
	RT1:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,RETRY
		INT 21H
	
		MOV AH,01H
		INT 21H
		MOV AH,09H
		LEA DX,NL
		INT 21H

		CMP AL,'Y'
		JE MenuCP
		CMP AL,'y'
		JE MenuCP
		CMP AL,'N'
		JE QUITRETRY
		CMP AL,'n'
		JE QUITRETRY
		
		JMP RT1
		QUITRETRY:
		JMP QUIT

		MenuCP:
		JMP CUST_LOGIN
	;CHECKING PASSWORD FOR CUSTOMER A
	PSW_A:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,SPSW
		INT 21H
		
		MOV CX,6
		MOV SI,0
		PSW_AINPUT:
			MOV AH,07H
			INT 21H
			MOV INPUT1[SI],AL
			INC SI
			MOV AH,02H
			MOV DL,'*'
			INT 21H
		LOOP PSW_AINPUT
	
		MOV CX,6
		MOV SI,0
		MOV DI,0
		CMPPSW_A:
			MOV BL,INPUT1[SI]
			CMP BL,PASS_A[DI]
			JNE WRONGPASS
			INC DI
			INC SI
		LOOP CMPPSW_A
	MOV VERIFY,'A'
	JMP SUCCESS
	
	PSW_B:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,SPSW
		INT 21H
		
		MOV CX,6
		MOV SI,0
		PSW_BINPUT:
			MOV AH,07H
			INT 21H
			MOV INPUT1[SI],AL
			INC SI
			MOV AH,02H
			MOV DL,'*'
			INT 21H
		LOOP PSW_BINPUT
		
		MOV CX,6
		MOV SI,0
		MOV DI,0
		CMPPSW_B:
			MOV BL,INPUT1[SI]
			CMP BL,PASS_B[DI]
			JNE WRONGPASS
			INC DI
			INC SI
		LOOP CMPPSW_B
	MOV VERIFY,'B'
	JMP SUCCESS
	
	;PRINT IF WRONG PASSWORD
	WRONGPASS:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		mov ah,09H
		mov cx,46
		mov bh,0
		mov bl,0Ch
		int 10h
		LEA DX,WRPSW
		INT 21H
	JMP RT1
	
	
	;SUCCESS LOGIN
	SUCCESS:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,SIGN
		INT 21H
	;2 MENU WITH SELECTION
	;MENU
 	
	MOV AH,09H
	LEA DX,WELCOME
	INT 21H
	
	SELECTIONMENU:
		MOV AH,09H
		LEA DX,NL
		INT 21H

		mov ah,09H
		mov cx,45
		mov bh,0
		mov bl,0Ch
		int 10h
		LEA DX,MENU
		INT 21H
	
		MOV AH,09H
		LEA DX,NL
		INT 21H

		;3-Making Choice
		MOV AH,02H
		MOV DL,09H
		INT 21H
	
		MOV AH,09H
		LEA DX,SELECTION
		INT 21H
	
		MOV AH,01H
		INT 21H
		MOV CHOICE,AL
		SUB CHOICE,48

		CMP CHOICE,1
		JE DEPOSIT
		CMP CHOICE,2	
		JE WITHDRAWAL
		CMP CHOICE,3
		JE TRANS
		CMP CHOICE,4
		JE SUMMARY
		CMP CHOICE,5
		JE RELOGIN
	JMP RT1
	
	DEPOSIT:
		CALL FAR PTR doDeposit
	JMP SELECTIONMENU
	WITHDRAWAL:
		CALL FAR PTR clearSc
		CALL FAR PTR WITHDRAW 
	JMP SELECTIONMENU
	TRANS:
		CALL FAR PTR clearSc
		CALL FAR PTR TRANSFER
		
	SUMMARY:
		CALL FAR PTR showRecord
	JMP SELECTIONMENU
	
	RELOGIN:
		MOV ANOTHER_ACCOUNT,5
		MOV AH,09H
		LEA DX,NL
		INT 21H
		CALL FAR PTR clearSc
	JMP CUST_LOGIN
	
	;Ending
	
	
	QUIT: 
	MOV AX,4C00H
	INT 21H
	
MAIN ENDP

TRANSFER PROC
	MOV AX,9999
	CMP NOTE_A,AX
	JL CHECK_TTHOUSAND_DIGIT
	
	MOV AX,0
	MOV DX,0
	MOV AX,NOTE_A
	DIV TEN_THOUSAND
	MOV TTHOUSAND_AMOUNT_STORED1,AX
	MOV NOTE_A,DX
	
	CHECK_TTHOUSAND_DIGIT:
	MOV AX,9999
	CMP NOTE_B,AX
	JL START
	
	MOV AX,0
	MOV DX,0
	MOV AX,NOTE_B
	DIV TEN_THOUSAND
	MOV TTHOUSAND_AMOUNT_STORED2,AX
	MOV NOTE_B,DX
	
	START:
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	MOV AH,09H
	LEA DX,TRANSFER_TTL
	INT 21H
	
	;CURRENT ACCOUNT INFO
	CMP VERIFY,'A'
	JE ACCOUNT_A
	JMP ACCOUNT_B
	
	ACCOUNT_A:
	MOV AH,09H
	LEA DX,CURRENT_ACC
	INT 21H
	
	MOV CX,4
	MOV SI,0
	ACC_DISPLAY1: 
		MOV AH,02H
		MOV DL,CUST_A[SI]	
		INC SI
		INT 21H
	LOOP ACC_DISPLAY1
	
	MOV AH,09H
	LEA DX,NL
	INT 21H 
	
	MOV AH,09H
	LEA DX,CURRENT_BAL
	INT 21H
	
	CMP TTHOUSAND_AMOUNT_STORED1,0
	JZ PRINT_BAL_A
	
	MOV BX,TTHOUSAND_AMOUNT_STORED1
	
	MOV AH,02H
	MOV DL,BL
	ADD DL,48
	INT 21H
	
	PRINT_BAL_A:
	MOV CX,4
	MOV AX,NOTE_A
	CURRENT_BAL_A:
		MOV DX,0
		DIV THOUSAND
		MOV BX,DX
		
		MOV AH,02H
		MOV DL,AL
		ADD DL,48
		INT 21H 
		
		MOV DX,0
		MOV AX,THOUSAND
		DIV TEN
		MOV THOUSAND,AX
		MOV AX,BX
	LOOP CURRENT_BAL_A
	MOV THOUSAND,1000
	MOV AH,02H
	MOV DL,'.'
	INT 21H
	
	MOV AX,CENT_A
	MOV BL,10
	DIV BL
	MOV BX,AX
	
	MOV AH,02H
	MOV DL,BL
	ADD DL,48
	INT 21H
	
	MOV AH,02H
	MOV DL,BH
	ADD DL,48
	INT 21H
	
	MOV AH,09H
	LEA DX,NL
	INT 21H 
	JMP CONT05
	
	ACCOUNT_B:
	MOV AH,09H
	LEA DX,CURRENT_ACC
	INT 21H
	
	MOV CX,4
	MOV SI,0
	ACC_DISPLAY2: 
		MOV AH,02H
		MOV DL,CUST_B[SI]	
		INC SI
		INT 21H
	LOOP ACC_DISPLAY2
	
	MOV AH,09H
	LEA DX,NL
	INT 21H 
	
	MOV AH,09H
	LEA DX,CURRENT_BAL
	INT 21H
	
	CMP TTHOUSAND_AMOUNT_STORED2,0
	JZ PRINT_BAL_B
	
	MOV BX,TTHOUSAND_AMOUNT_STORED2
	
	MOV AH,02H
	MOV DL,BL
	ADD DL,48
	INT 21H
	
	PRINT_BAL_B:
	MOV CX,4
	MOV AX,NOTE_B
	CURRENT_BAL_B:
		MOV DX,0
		DIV THOUSAND
		MOV BX,DX
		
		MOV AH,02H
		MOV DL,AL
		ADD DL,48
		INT 21H 
		
		MOV DX,0
		MOV AX,THOUSAND
		DIV TEN
		MOV THOUSAND,AX
		MOV AX,BX
	LOOP CURRENT_BAL_B
	MOV THOUSAND,1000
	
	MOV AH,02H
	MOV DL,'.'
	INT 21H
	
	MOV AX,CENT_B
	MOV BL,10
	DIV BL
	MOV BX,AX
	
	MOV AH,02H
	MOV DL,BL
	ADD DL,48
	INT 21H
	
	MOV AH,02H
	MOV DL,BH
	ADD DL,48
	INT 21H
	
	MOV AH,09H
	LEA DX,NL
	INT 21H 
	
	CONT05:
	;ASK USER TO INPUT THE ACCOUNT ID FOR TRANSFER PURPOSE
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	MOV AH,09H
	LEA DX,ASKACC
	INT 21H
	
	MOV CX,4
	MOV SI,0   ;INPUT
	MOVE_INPUT: 
		MOV AH,01H
		INT 21H
		MOV INPUT[SI],AL	
		INC SI
	LOOP MOVE_INPUT
	
	;ACCOUNT VALIDATION
	MOV CX,4
	MOV SI,0
	MOV DI,0
	VALIDATION_ACCOUNT_A:
		MOV BH,CUST_A[SI]
		CMP BH,INPUT[DI]
		JNE VALIDATION_ACCOUNT_B
		INC DI
		INC SI
	LOOP VALIDATION_ACCOUNT_A
	MOV DUPLICATE,'A'
	JMP PROCEED1
	
	MOV CX,4
	MOV SI,0
	MOV DI,0
	VALIDATION_ACCOUNT_B:
		MOV BH,CUST_B[SI]
		CMP BH,INPUT[DI]
		JNE INVALIDID
		INC DI
		INC SI
	LOOP VALIDATION_ACCOUNT_B
	MOV DUPLICATE,'B'
	JMP PROCEED1
	
	INVALIDID:
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		mov ah,09H
		mov cx,43
		mov bh,0
		mov bl,0Ch
		int 10h
		LEA DX,WRID
		INT 21H
	JMP TRANS_RETRY
	
	;CHECK WHETHER IS THE ACCOUNT DUPLICATE WITH LOGIN
	PROCEED1:
		MOV BH,VERIFY
		CMP BH,DUPLICATE
		JNE PROCEED2
		
		MOV AH,09H
		LEA DX,DUP_ACC
		INT 21H
	JMP TRANS_RETRY
	
	;PROCEED TO TRANSFER AMOUNT 
	PROCEED2:
		MOV AH,09H
		LEA DX,ASKAMOUNT
		INT 21H
		
		MOV AH,0AH
		LEA DX,AMOUNT ;INPUT AMOUNT FROM USER
		INT 21H
	
		MOV AH,09H
		LEA DX,NL 
		INT 21H
		
		;VALIDATION
		MOV CH,0
		MOV CL,ACT_AMOUNT
		MOV SI,0
		CHECK_NUM:
			CMP AMOUNT_STORED[SI],'0'
			JL NOT_NUM
			CMP AMOUNT_STORED[SI],'9'
			JG NOT_NUM
			
			INC SI
		LOOP CHECK_NUM
		JMP STORE_AMT
		
		NOT_NUM:
		CMP AMOUNT_STORED[SI],'.'
		JE STORE_AMT
		MOV AH,09H
		LEA DX,INVALID_NUM
		INT 21H
		JMP TRANS_RETRY 
	
		;STORING THE ACTUAL NOTE AMOUNT TO ACTUAL_AMOUNT AND CENT AMOUNT TO CENT_ARR
		STORE_AMT:
		MOV CH,0
		MOV CL,ACT_AMOUNT
		SUB CL,2
		MOV SI,0
		MOV DI,0
		MOV BX,0
		FINAL_STORE:
			MOV AL,AMOUNT_STORED[DI]
			
			CMP AMOUNT_STORED[DI],"."
			JE CENT_STORED
			
			SUB AL,48
			MOV ACTUAL_AMOUNT_NOTE[SI],AL
			INC SI
			INC DI
			JMP FIN
			
			CENT_STORED:
			INC DI
			MOV AL,AMOUNT_STORED[DI]
			SUB AL,48
			MOV CENT_ARR[BX],AL
			INC BX
			INC DI
			MOV AL,AMOUNT_STORED[DI]
			SUB AL,48
			MOV CENT_ARR[BX],AL
			FIN:
		LOOP FINAL_STORE		
	
		;----------------------------------------------CALCULATION PART-----------------------------------------------------
		;CALCULATE THE TOTAL AMOUNT INPUT
		MOV CH,0
		MOV CL,ACT_AMOUNT
		SUB CL,3
		MOV BH,0
		MOV BL,ACT_AMOUNT
		DEC BX
		SUB BL,3
		MOV SI,BX
		COUNT:
			MOV DX,0
			MOV AH,0
			MOV AL,ACTUAL_AMOUNT_NOTE[SI]
			MUL MULTIPLICANT
			ADD REAL_AMOUNT_NOTE,AX
		
			MOV AX,MULTIPLICANT
			MUL TEN
			MOV MULTIPLICANT,AX
		
			DEC SI
		LOOP COUNT
		MOV MULTIPLICANT,1
		
		MOV CX,2
		MOV SI,1
		COUNT_CENT:
			MOV AL,CENT_ARR[SI]
			MUL MULTIPLICANT
			ADD REAL_AMOUNT_CENT,AL
			
			MOV AX,MULTIPLICANT
			MUL TEN
			MOV MULTIPLICANT,AX
		
			DEC SI
		LOOP COUNT_CENT
		MOV MULTIPLICANT,1
		
		MOV DX,REAL_AMOUNT_NOTE
		ADD TOTAL_AMOUNT_NOTE,DX
		
		MOV DH,0
		MOV DL,REAL_AMOUNT_CENT
		ADD TOTAL_AMOUNT_CENT,DX
		
		MOV BX,1000
		CMP REAL_AMOUNT_NOTE,BX
		JGE TAX_COMPUTATION
		JMP VALIDATION_CALCULATION
		
		TAX_COMPUTATION:
		MOV CX,4
		MOV SI,0
		MOV DI,0
		TAX_PART:
			MOV AL,ACTUAL_AMOUNT_NOTE[SI]
			MOV BL,1;TAX RATE
			MUL BL
			MOV TAX[DI],AL
			INC SI
			INC DI
		LOOP TAX_PART
		
		MOV BL,CENT_ARR[0]
		MOV TAX[4],BL
		
		MOV CX,2
		MOV SI,1
		TAX_NOTE_CAL:
			MOV AL,TAX[SI]
			MUL MULTIPLICANT
			ADD TAX_AMOUNT_NOTE,AL
			
			MOV AX,MULTIPLICANT
			MUL TEN
			MOV MULTIPLICANT,AX
			
			DEC SI
		LOOP TAX_NOTE_CAL
		MOV MULTIPLICANT,1
		
		MOV CX,2
		MOV SI,3
		TAX_CENT_CAL:
			MOV AL,TAX[SI]
			MUL MULTIPLICANT
			ADD TAX_AMOUNT_CENT,AL
			
			MOV AX,MULTIPLICANT
			MUL TEN
			MOV MULTIPLICANT,AX
			
			DEC SI
		LOOP TAX_CENT_CAL
		MOV MULTIPLICANT,1
		
		CMP TAX[4],5
		JL NO_CARRY
		INC TAX_AMOUNT_CENT
		
		MOV AH,0
		MOV AL,TAX_AMOUNT_CENT
		MOV BX,100
		CMP AX,BX
		JL NO_CARRY
		
		SUB TAX_AMOUNT_CENT,100
		INC TAX_AMOUNT_NOTE
		
		NO_CARRY:
		MOV BH,0
		MOV BL,TAX_AMOUNT_NOTE
		ADD TOTAL_AMOUNT_NOTE,BX
		
		MOV BH,0
		MOV BL,TAX_AMOUNT_CENT
		ADD TOTAL_AMOUNT_CENT,BX
		
		
		MOV AX,TOTAL_AMOUNT_CENT
		MOV BX,100
		CMP AX,BX
		JL VALIDATION_AMOUNT
		
		SUB TOTAL_AMOUNT_CENT,100
		INC TOTAL_AMOUNT_NOTE
		
		VALIDATION_AMOUNT:
		CMP TOTAL_AMOUNT_NOTE,9999
		JL VALIDATION_CALCULATION
		JG INVALID_AMOUNT_MSG
		
		CMP TOTAL_AMOUNT_CENT,0
		JE VALIDATION_CALCULATION
		
		INVALID_AMOUNT_MSG:
		MOV AH,09H
		LEA DX,INVALID_AMOUNT
		INT 21H
		JMP TRANS_RETRY
		
		;VALIDATION FOR BALANCE
		VALIDATION_CALCULATION:
		CMP VERIFY,'A'
		JNE AMOUNT_VALIDATION2
		
		
		MOV BX,TOTAL_AMOUNT_NOTE
		CMP NOTE_A,BX
		JL INADEQUATE_AMOUNT
		JE VALIDATION_CENT
		JMP ADEQUATE_AMOUNT
		
		AMOUNT_VALIDATION2:
		MOV BX,TOTAL_AMOUNT_NOTE
		CMP NOTE_B,BX
		JG ADEQUATE_AMOUNT
		JE VALIDATION_CENT
		JL INADEQUATE_AMOUNT
		
		VALIDATION_CENT:
			MOV BX,0
			CMP VERIFY,'A'
			JNE NEXT02
			MOV BX,CENT_A
			NEXT02:
			MOV BX,CENT_B
			
			CMP BX,TOTAL_AMOUNT_CENT
			JGE ADEQUATE_AMOUNT
	
		;INSUFFICIENT BALANCE
		INADEQUATE_AMOUNT:
			CMP VERIFY,'A'
			JNE BORROW_TTHOUSAND
			
			CMP TTHOUSAND_AMOUNT_STORED1,0
			JZ REAL_INADEQUATE_AMOUNT
			
			ADD NOTE_A,10000
			DEC TTHOUSAND_AMOUNT_STORED1
			JMP ADEQUATE_AMOUNT
			
			BORROW_TTHOUSAND:
			CMP TTHOUSAND_AMOUNT_STORED2,0
			JZ REAL_INADEQUATE_AMOUNT
			
			ADD NOTE_B,10000
			DEC TTHOUSAND_AMOUNT_STORED2
			JMP ADEQUATE_AMOUNT
			
			REAL_INADEQUATE_AMOUNT:
			MOV AH,09H
			LEA DX,NL 
			INT 21H
	
			MOV AH,09H
			LEA DX,INSUF_BAL
			INT 21H
			
			MOV REAL_AMOUNT_NOTE,0
			MOV REAL_AMOUNT_CENT,0
			MOV TOTAL_AMOUNT_NOTE,0
			MOV TOTAL_AMOUNT_CENT,0
			MOV TAX_AMOUNT_NOTE,0
			MOV TAX_AMOUNT_CENT,0
		JMP TRANS_RETRY
		
		;PROCEED IF SUFFICIENT
		ADEQUATE_AMOUNT:
			CMP VERIFY,'A'
			JNE BORROW
			
			MOV BX,CENT_A
			MOV DX,TOTAL_AMOUNT_CENT
			CMP BX,DX
			JGE CONT
			
			DEC NOTE_A
			ADD CENT_A,100
			JMP CONT 
			
			BORROW:
			MOV BX,CENT_B
			MOV DX,TOTAL_AMOUNT_CENT
			CMP BX,DX
			JGE CONT
			
			DEC NOTE_B
			ADD CENT_B,100
			
			CONT:
			MOV AH,09H
			LEA DX,NL 
			INT 21H
		
			;ASKING CONFIRMATION FROM THE USER
			MOV AH,09H
			LEA DX,confirmation1
			INT 21H
			
			MOV CH,0
			MOV CL,ACT_AMOUNT
			SUB CL,3
			MOV SI,0
			AMT_NOTE2:
				MOV AH,02H
				MOV DL,ACTUAL_AMOUNT_NOTE[SI]
				ADD DL,48
				INT 21H
				INC SI
			LOOP AMT_NOTE2
			
			MOV AH,02H
			MOV DL,'.'
			INT 21H
			
			MOV CX,2 
			MOV SI,0
			AMT_CENT2:
				MOV AH,02H
				MOV DL,CENT_ARR[SI]
				ADD DL,48
				INT 21H
				INC SI
			LOOP AMT_CENT2
			
			CONT04:
			MOV AH,09H
			LEA DX,confirmation2
			INT 21H
		
			CMP VERIFY,'A'
			MOV CX,4
			MOV SI,0
			JE CUST1
		
			CUST2:
				MOV AH,02H
				MOV DL,CUST_A[SI]
				INT 21H
				INC SI
			LOOP CUST2
			JMP CONFIRM
		
			CUST1:
				MOV AH,02H
				MOV DL,CUST_B[SI]
				INT 21H
				INC SI
			LOOP CUST1
		
		
			CONFIRM:
				MOV AH,09H
				LEA DX,confirmation3
				INT 21H
			
				MOV AH,01H
				INT 21H
				MOV BL,AL
				
				CMP BL, 'Y'
				JE CONFIRMED
				CMP BL,'y'
				JE CONFIRMED
				
				
				
				MOV REAL_AMOUNT_NOTE,0
				MOV REAL_AMOUNT_CENT,0
				MOV TOTAL_AMOUNT_NOTE,0
				MOV TOTAL_AMOUNT_CENT,0
				MOV TAX_AMOUNT_NOTE,0
				MOV TAX_AMOUNT_CENT,0
			JMP TRANS_RETRY
		
		;PROCEED FOR CALCULATION TO TRANSFER THE AMOUNT TO THE CONFIRMED ACCOUNT
		CONFIRMED:
		MOV AX,TOTAL_AMOUNT_NOTE
		MOV BX,TOTAL_AMOUNT_CENT
		MOV DL,0
		MOV DH,0
		CALL StoRecord
		
		MOV AX,REAL_AMOUNT_NOTE
		MOV BH,0
		MOV BL,REAL_AMOUNT_CENT
		MOV DL,0
		MOV DH,3
		CALL StoRecord
		
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,TRANS_SUM
		INT 21H
		;SHOW SUMMARY
		MOV AH,09H
		LEA DX,TRANSFER_AMT
		INT 21H
	
		MOV CH,0
		MOV CL,ACT_AMOUNT
		SUB CL,3
		MOV SI,0
		DISPLAY:
			MOV AH,02H
			MOV DL,ACTUAL_AMOUNT_NOTE[SI]
			ADD DL,48
			INT 21H
			INC SI
		LOOP DISPLAY
		
		MOV AH,02H
		MOV DL,'.'
		INT 21H
	
		MOV CX,2
		MOV SI,0
		DISPLAY_CENT:
			MOV AH,02H
			MOV DL,CENT_ARR[SI]
			ADD DL,48
			INT 21H
			INC SI
		LOOP DISPLAY_CENT
		
		;TAX AMOUNT
		MOV AH,09H
		LEA DX,TAX_AMT
		INT 21H
		
		MOV AH,0
		MOV AL,TAX_AMOUNT_NOTE
		MOV DX,0
		DIV TEN
		MOV BH,AL
		MOV BL,DL
		
		MOV AH,02H
		MOV DL,BH
		ADD DL,48
		INT 21H
		
		MOV AH,02H
		MOV DL,BL
		ADD DL,48
		INT 21H
		
		MOV AH,02H
		MOV DL,'.'
		INT 21H	

		MOV AH,0
		MOV AL,TAX_AMOUNT_CENT
		MOV DX,0
		DIV TEN
		MOV BH,AL
		MOV BL,DL
		
		MOV AH,02H
		MOV DL,BH
		ADD DL,48
		INT 21H
		
		MOV AH,02H
		MOV DL,BL
		ADD DL,48
		INT 21H
		;TOTAL_AMT 
		MOV AH,09H
		LEA DX,TOTAL_TRANS_AMT
		INT 21H
		
		MOV CX,4
		MOV AX,TOTAL_AMOUNT_NOTE
		SHOW_TOTAL_AMT:
			MOV DX,0
			DIV THOUSAND
			MOV BX,DX
			
			MOV AH,02H
			MOV DL,AL
			ADD DL,48
			INT 21H 
			
			MOV DX,0
			MOV AX,THOUSAND
			DIV TEN
			MOV THOUSAND,AX
			MOV AX,BX
		LOOP SHOW_TOTAL_AMT
		MOV THOUSAND,1000
		
		MOV AH,02H
		MOV DL,'.'
		INT 21H
		
		MOV AX,TOTAL_AMOUNT_CENT
		MOV BL,10
		DIV BL
		MOV BX,AX
		
		MOV AH,02H
		MOV DL,BL
		ADD DL,48
		INT 21H
		
		MOV AH,02H
		MOV DL,BH
		ADD DL,48
		INT 21H
		
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		MOV AH,09H
		LEA DX,ACCOUNT_BAL
		INT 21H
		
		MOV BX,TOTAL_AMOUNT_NOTE
		CMP VERIFY,'B'
		JE NEXT1
		SUB NOTE_A,BX
		MOV BX,REAL_AMOUNT_NOTE
		ADD NOTE_B,BX
		
		CMP TOTAL_AMOUNT_CENT,0
		JZ NEXT_DISPLAY1
		
		MOV BX,TOTAL_AMOUNT_CENT
		SUB CENT_A,BX
		MOV BH,0
		MOV BL,REAL_AMOUNT_CENT
		ADD CENT_B,BX
		
		MOV AX,CENT_B
		MOV BX,100
		CMP AX,BX
		JL NEXT_DISPLAY1
		
		SUB CENT_B,100
		INC NOTE_B
		
		NEXT_DISPLAY1:
		JMP DONE_A
			
		NEXT1:
		MOV BX,TOTAL_AMOUNT_NOTE
		SUB NOTE_B,BX
		MOV BX,REAL_AMOUNT_NOTE
		ADD NOTE_A,BX
		
		CMP TOTAL_AMOUNT_NOTE,0
		JZ NEXT_DISPLAY2
		
		MOV BX,TOTAL_AMOUNT_CENT
		SUB CENT_B,BX
		MOV BH,0
		MOV BL,REAL_AMOUNT_CENT
		ADD CENT_A,BX
		
		MOV AX,CENT_A
		MOV BX,100
		CMP AX,BX
		JL NEXT_DISPLAY2
		
		SUB CENT_A,100
		INC NOTE_A
	
		NEXT_DISPLAY2:
		JMP DONE_B
		
		;CALCULATION TO DISPLAY THE FINAL BALANCE FOR ACCOUNT_A
		DONE_A:
			CMP CENT_A,100
			JL STORE_TTHOUSAND_DIGIT1
			
			SUB CENT_A,100
			INC NOTE_A
			
			STORE_TTHOUSAND_DIGIT1:
			MOV AX,9999
			CMP NOTE_A,AX
			JL CONT01
		
			MOV AX,0
			MOV DX,0
			MOV AX,NOTE_A
			DIV TEN_THOUSAND
			ADD TTHOUSAND_AMOUNT_STORED1,AX
			MOV NOTE_A,DX
			
			CONT01:
			CMP NOTE_A,0
			JNZ PRINT_TTHOUSAND_DIGIT1
			CMP TTHOUSAND_AMOUNT_STORED1,0
			JNZ PRINT_TTHOUSAND_DIGIT1
			
			MOV AH,02H
			MOV DL,48
			INT 21H
			JMP CENT_DISPLAY1
			
			PRINT_TTHOUSAND_DIGIT1:
			CMP TTHOUSAND_AMOUNT_STORED1,0
			JZ NOTE_DISPLAY1
	
			MOV BX,TTHOUSAND_AMOUNT_STORED1
	
			MOV AH,02H
			MOV DL,BL
			ADD DL,48
			INT 21H
			
			NOTE_DISPLAY1:
			MOV CX,4
			MOV AX,NOTE_A
			SHOW_BAL1:
				MOV DX,0
				DIV THOUSAND
				MOV BX,DX
				
				MOV AH,02H
				MOV DL,AL
				ADD DL,48
				INT 21H 
				
				MOV DX,0
				MOV AX,THOUSAND
				DIV TEN
				MOV THOUSAND,AX
				MOV AX,BX
			LOOP SHOW_BAL1
			
			CENT_DISPLAY1:
			MOV AH,02H
			MOV DL,'.'
			INT 21H
			
			MOV AX,CENT_A
			MOV BL,10
			DIV BL
			MOV BX,AX
			
			MOV AH,02H
			MOV DL,BL
			ADD DL,48
			INT 21H
			
			MOV AH,02H
			MOV DL,BH
			ADD DL,48
			INT 21H
		MOV THOUSAND,1000
		MOV REAL_AMOUNT_NOTE,0
		MOV REAL_AMOUNT_CENT,0
		MOV TOTAL_AMOUNT_NOTE,0
		MOV TOTAL_AMOUNT_CENT,0
		MOV TAX_AMOUNT_NOTE,0
		MOV TAX_AMOUNT_CENT,0
		JMP TRANS_RETRY
		
		;CALCULATION TO DISPLAY THE FINAL BALANCE FOR ACCOUNT_B
		DONE_B:
			CMP CENT_B,100
			JL STORE_TTHOUSAND_DIGIT2
			
			SUB CENT_B,100
			INC NOTE_B
			
			STORE_TTHOUSAND_DIGIT2:
			MOV AX,9999
			CMP NOTE_B,AX
			JL CONT02
		
			MOV AX,0
			MOV DX,0
			MOV AX,NOTE_B
			DIV TEN_THOUSAND
			ADD TTHOUSAND_AMOUNT_STORED2,AX
			MOV NOTE_B,DX
			
			CONT02:
			CMP NOTE_B,0
			JNZ PRINT_TTHOUSAND_DIGIT2
			CMP TTHOUSAND_AMOUNT_STORED2,0
			JNZ PRINT_TTHOUSAND_DIGIT2
			
			MOV AH,02H
			MOV DL,48
			INT 21H
			JMP CENT_DISPLAY2
			
			PRINT_TTHOUSAND_DIGIT2:
			CMP TTHOUSAND_AMOUNT_STORED2,0
			JZ NOTE_DISPLAY2
	
			MOV BX,TTHOUSAND_AMOUNT_STORED2
	
			MOV AH,02H
			MOV DL,BL
			ADD DL,48
			INT 21H
			
			NOTE_DISPLAY2:
			MOV CX,4
			MOV AX,NOTE_B
			SHOW_BAL2:
				MOV DX,0
				DIV THOUSAND
				MOV BX,DX
				
				MOV AH,02H
				MOV DL,AL
				ADD DL,48
				INT 21H 
				
				MOV DX,0
				MOV AX,THOUSAND
				DIV TEN
				MOV THOUSAND,AX
				MOV AX,BX
			LOOP SHOW_BAL2
			
			CENT_DISPLAY2:
			MOV AH,02H
			MOV DL,'.'
			INT 21H
			
			MOV AX,CENT_B
			MOV BL,10
			DIV BL
			MOV BX,AX
			
			MOV AH,02H
			MOV DL,BL
			ADD DL,48
			INT 21H
			
			MOV AH,02H
			MOV DL,BH
			ADD DL,48
			INT 21H
		MOV THOUSAND,1000
		MOV THOUSAND,1000
		MOV REAL_AMOUNT_NOTE,0
		MOV REAL_AMOUNT_CENT,0
		MOV TOTAL_AMOUNT_NOTE,0
		MOV TOTAL_AMOUNT_CENT,0
		MOV TAX_AMOUNT_NOTE,0
		MOV TAX_AMOUNT_CENT,0
	JMP TRANS_RETRY
	
	CONT03:    ;FOR JUMPING PURPOSE
	CALL FAR PTR clearSc
	JMP START
	
	;ASK USER WHETHER WANT TO CONTINUE CURRENT SERVICE OR NOT(FOR ALL EXCEPT SUMMARY)
	TRANS_RETRY:
	MOV AH,09H
	LEA DX,ASKCONT
	INT 21H
	
	MOV AH,01H
	INT 21H
	CMP AL,'Y'
	JE CONT03
	MOV AH,09H
	LEA DX,NL
	INT 21H
	CMP AL,'y'
	JE CONT03
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	CALL FAR PTR clearSc
	JMP SELECTIONMENU
	
	
TRANSFER ENDP

;-------------------------------------------------------------------------------------------
doDeposit proc FAR
	dep:
	cmp VERIFY,'A'
	JNE putB
	mov bx,TTHOUSAND_AMOUNT_STORED1
	mov tthousand_W,bl
	mov ax,NOTE_A
	mov dx,0
	div tent
	add tthousand_W,al
	mov ringgit,dx
	mov bx,CENT_A
	mov sen,bx
	jmp StartD
	putB:
	mov bx,TTHOUSAND_AMOUNT_STORED2
	mov tthousand_W,bl
	mov ax,NOTE_B
	mov dx,0
	div tent
	add tthousand_W,al
	mov ringgit,dx
	mov bx,CENT_B
	mov sen,bx
	
	StartD:
	call far ptr clearSc
	mov ah,09h
	lea dx,time
	int 21h
	;---call date
	mov ah,2ah
	int 21h
	mov year,cx
	mov month,dh;dh
	mov day,dl
	mov dweek,al
	mov incY,0
	call FAR PTR DateD
	;---call date end
	mov ah,09h
	lea dx,nl
	int 21h

	mov ah,2ch
	int 21h
	mov hours,ch
	mov minutes,cl
	mov seconds,dh
	call FAR PTR timeD

	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx,curAmt
	int 21h
	
	mov ax,ringgit
	mov bx,sen
	mov typeIn,1
	call FAR PTR form; form the number
	call FAR PTR show; show the number

	mov ah,09h
	lea dx,nl
	int 21h

	call FAR PTR getN
	;----------------------------------
	call far ptr clearSc
	mov ah,09h
	lea dx,nl
	int 21h

	mov ah,09h
	lea dx,depAmt
	int 21h

	mov ax,ringgit_ADD_w
	mov bx,sen_ADD_w
	mov typeIn,4
	call FAR PTR form
	call FAR PTR show

	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx,curAmt
	int 21h
	
	mov ax,ringgit
	mov bx,sen
	mov typeIn,1
	call FAR PTR form
	call FAR PTR show

	mov ah,09h
	lea dx,nl
	int 21h
	
	
	;calculation interest
	call FAR PTR ShowI
	
	cmp VERIFY,'A'
	JNE putB2
	mov bx,0
	mov bl,tthousand_W
	mov TTHOUSAND_AMOUNT_STORED1,bx
	mov bx,ringgit
	mov NOTE_A,bx
	mov bx,sen
	mov CENT_A,bx
	
	jmp check2
	putB2:
	mov bx,0
	mov bl,tthousand_W
	mov TTHOUSAND_AMOUNT_STORED2,bx
	mov bx,ringgit
	mov NOTE_B,bx
	mov bx,sen
	mov CENT_B,bx
	
	check2:
	mov ah,09h
	lea dx,ASKCONT
	int 21h
	mov ah,01h
	int 21h
	cmp al,'N'
	je endD
	cmp al,'n'
	je endD
	cmp al,'Y'
	je checkPoint2
	cmp al,'y'
	je checkPoint2
	JMP check2

	checkPoint2:
	JMP dep

	endD:
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09H
	mov cx,37
	mov bh,0
	mov bl,0Ch
	int 10H
	lea dx,conMsg
	int 21H

	mov ah,01H
	int 21H

	call far ptr clearSc
	RET

doDeposit endp

form proc FAR
	;ringgit form
	mov cx,4
	mov si,4
	store:
		mov dx,0
		div ten_w 
		mov quo_w,ax ;store quotient dx is remain
		mov stoAmt[si],dl
		mov ax,quo_w
		dec si
	loop store
	
	cmp typeIn,0
	JE next1_w
	
	cmp typeIn,3
	je sumdis

	cmp typeIn,4
	je depshow
	
	cmp typeIn,2
	Jne next2_w
	mov ch,inttthousand ;2 for display interest+current amount,future value
	jmp storeTT
	
	sumdis:
	mov ch,ttplace
	jmp storeTT

	depshow:
	mov ch,tthousand_ADD_W
	jmp storeTT
	
	next1_w:
	mov ch,t_tthousand ;show total interest
	JMP storeTT
	
	next2_w:
	mov ch,tthousand_W ;original amount
	
	storeTT:
	mov stoAmt[si],ch
	
	mov ax,bx
	;sen form
	mov cx,2
	mov si,1 
	store2:
		mov dx,0
		div ten_w 
		mov quo_w,ax ;store quotient dx is remain
		mov point[si],dl
		mov ax,quo_w
		dec si
	loop store2
	
	
	RET
form endp

show proc FAR

	;decision 0 for interest display
	mov ah,09h
	lea dx,RM
	int 21h
	
	cmp typeIn,2
	Jne con
	cmp splace,0
	je con
	mov ah,02h
	mov dl,splace
	add dl,48
	int 21h
	JMP put6d
	
	con:
	mov cx,5
	mov si,0
	checkZero:
			mov bl,stoAmt[si]
			cmp bl,0
			ja put
			inc si
	loop checkZero
	
	cmp si,5
	jne put
	inc cx
	jmp put
	put6d:
	mov cx,5
	mov si,0
	put:
		mov ah,02h
		mov dl,stoAmt[si]
		add dl,48
		int 21h
		inc si
	loop put
	
	mov ah,02h
	mov dl,'.'
	int 21h
	
	mov cx,2
	mov si,0
	put2:
		mov ah,02h
		mov dl,point[si]
		add dl,48
		int 21h
		inc si
	loop put2
	
	mov ax,0
	mov bx,0

	RET
show endp

getN proc FAR
	mov total_wz,0
	mov dl,tthousand_W
	mov placett,dl
	mov bx,ringgit
	mov placeR,bx
	mov bx,sen
	mov placeS,bx
	
	JMP redo

	notValid:
	mov ah,09h
	lea dx,nl
	int 21h

	mov ah,09H
	mov cx,53
	mov bh,0
	mov bl,0Ch
	int 10h

	lea dx,invalid
	int 21H


	again:
	mov tthousand_ADD_W,0
	mov ringgit_ADD_w,0
	mov sen_ADD_w,0
	mov total_wz,0
	mov dl,placett
	mov tthousand_W,dl
	mov bx,placeR
	mov ringgit,bx
	mov bx,placeS
	mov sen,bx
	
	redo:
	mov ah,09H
	lea dx,nl
	int 21h
	mov ah,09H
	lea dx,nl
	int 21h

	mov ah,09h
	mov cx,70
	mov bh,0
	mov bl,0Ch
	int 10h

	lea dx,waydep
	int 21h

	mov ah,09H
	lea dx,nl
	int 21h
	lea dx,addAmt
	int 21h
	
	mov cx,5
	lea si,stoAmt
	get:
		mov ah,01h
		int 21h
		cmp al,'Q'
		JE checkPoint3
		cmp al,'q'
		JE checkPoint3
		sub al,48
		cmp al,0
		jl redo
		cmp al,9
		ja redo
		mov [si],al
		inc si
	loop get
	
	mov ah,02h
	mov dl,'.'
	int 21h
	
	mov cx,2
	lea si,point
	get2:
		mov ah,01h
		int 21h
		cmp al,'Q'
		JE checkPoint3
		cmp al,'q'
		JE checkPoint3
		sub al,48
		cmp al,0
		jl redo
		cmp al,9
		ja redo
		mov [si],al
		inc si
	loop get2
	
	
	mov ah,09h
	lea dx,cMsg
	int 21h
	
	call far ptr show
	check:
	mov ah,09h
	lea dx,confirmD
	int 21h
	mov ah,01h
	int 21h 
	mov bl,al
	cmp bl,'N'
	je checkPoint
	cmp bl,'n'
	je checkPoint
	cmp bl,'Y'
	je yes
	cmp bl,'y'
	je yes
	cmp bl,'Q'
	je checkPoint3
	cmp bl,'q'
	je checkPoint3
	JMP check
	checkPoint:
	Jmp again
	checkPoint3:
	mov tthousand_ADD_W,0
	mov ringgit_ADD_w,0
	mov sen_ADD_w,0
	RET
	
	yes:	;calculate real amount
	lea si,stoAmt
	mov bl,[si]
	add tthousand_W,bl
	mov tthousand_ADD_W,bl
	inc si
	
	mov al,[si]
	mov ah,0
	mul thousand_w
	add total_wz,ax
	inc si
		
	mov al,[si]
	mov ah,0
	mul hundred_w
	add total_wz,ax
	inc si
	
	mov al,[si]
	mov ah,0
	mul ten_w
	add total_wz,ax
	inc si
	
	mov al,[si]
	mov ah,0
	add total_wz,ax
	
	mov bx,total_wz
	mov ringgit_ADD_w,bx
	mov bx,ringgit
	add bx,total_wz
	mov ax,bx
	mov dx,0
	div tent
	add tthousand_W,al
	cmp tthousand_W,9
	jna valid1
	jmp notValid
	valid1:
	mov ringgit,dx
	
	;sen /point
	mov total_wz,0
	lea si,point
	mov al,[si]
	mov ah,0
	mul ten_w
	add total_wz,ax
	inc si
		
	mov al,[si]
	mov ah,0
	add total_wz,ax
	mov bx,total_wz
	mov sen_ADD_w,bx
	
	mov bx,sen
	add bx,total_wz
	mov ax,bx
	div hundred_w
	cmp ax,0
	jbe notOne1
	inc ringgit
	cmp ringgit,9999
	
	jbe notOne1
	inc tthousand_W
	cmp tthousand_W,9
	jna valid2
	jmp notValid
	valid2:
	mov ringgit,0
	notOne1:
			mov sen,dx
		
	cmp tthousand_ADD_W,0
	jne validAmt
	cmp ringgit_ADD_w,20
	jae validAmt
	jmp notValid

	validAmt:	
	mov ax,ringgit_ADD_w ;放总共+或-的千位数进AX
	mov bx,sen_ADD_w;放总共+/-的CENT 进 BX
	mov dl,tthousand_ADD_W; 如果有万就放（1-9），没有就放0
	mov dh,2 ;1 是 加数额 ，0是减数额,3 another acc,2 for dep,4 for w
	call StoRecord; call function
	
	mov t_iringgit,0
	mov t_isen,0
	mov t_tthousand,0

	RET
getN endp


calI proc FAR
	mov iringgit,0
	mov isen,0
	
	cmp splace,0
	jne haveII
	cmp inttthousand,0
	jne haveI
	cmp intringgit,5000
	jae haveI
	RET
	
	haveII:
	mov ax,0
	mov al,splace
	mul hundreds_b
	mov dx,0
	mul irateU
	add iringgit,ax
	
	haveI:
	mov ax,0
	mov al,inttthousand
	mul tens_b
	mov dx,0
	mul irateU
	add iringgit,ax
	
	
	mov dx,0
	mov ax,intringgit
	div thousand_w
	
	mov quo_w,ax
	mov re,dx
	
	mul irateU
	mov quo_w,ax
	
	mov ax,re
	mul irateU
	mov re,ax

	;sen jin wei
	mov ax,re	
	mov dx,0
	div thousand_w
	add quo_w,ax
	mov ax,quo_w
	add iringgit,ax
	
	cmp dx,995
	JB notOne2
	inc iringgit
	
	notOne2:
			mov ax,dx
			mov dx,0
			div ten_w
			mov quo_w,ax
			mov re,dx
			
			cmp dx,5
			jb notOne3
			inc quo_w
			
			
	notOne3:
			mov bx,quo_w
		    mov isen,bx
			mov ax,intsen
			mul irateU
			cmp ax,500
			jb notOne4
			inc isen
	notOne4:
	
	mov bx,intsen
	add bx,isen
	
	mov ax,bx
	mov dx,0
	div hundred_w
	mov intsen,dx
	add intringgit,ax
	
	mov bx,intringgit
	add bx,iringgit
	mov ax,bx
	mov dx,0
	div tent
	add inttthousand,al
	mov intringgit,dx
	
	mov al,inttthousand
	mov ah,0
	div tens_b
	mov inttthousand,ah
	add splace,al
	
	;--------------------------------------------
	
	mov bx,t_isen
	add bx,isen
	
	mov ax,bx
	mov dx,0
	div hundred_w
	mov t_isen,dx
	add t_iringgit,ax
	
	mov bx,t_iringgit
	add bx,iringgit
	mov ax,bx
	mov dx,0
	div tent
	add t_tthousand,al
	mov t_iringgit,dx
	
			
	RET
calI endp

DateD proc FAR
	
	mov ax,year
	add ax,incY
	mov cx,4
	mov si,3
	yearC:
		mov dx,0
		div ten_w 
		mov quo_w,ax ;store quotient dx is remain
		mov yearArr[si],dl
		mov ax,quo_w
		dec si
	loop yearC
	
	;display part
	mov cx,4
	mov si,0
	yearD:
		mov ah,02h
		mov dl,yearArr[si]
		add dl,48
		int 21h
		inc si
	loop yearD
	
	mov ah,02h
	mov dl,'-'
	int 21h
	
	mov ax,0
	mov al,month
	div tens_b
	mov quo2,al
	mov re2,ah
	
	mov ah,02h
	mov dl,quo2
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,re2
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,'-'
	int 21h
	
	mov ax,0
	mov al,day
	div tens_b
	mov quo2,al
	mov re2,ah
	
	mov ah,02h
	mov dl,quo2
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,re2
	add dl,30h
	int 21h

	
	RET
DateD endp

timeD proc far

	mov ax,0
	mov al,hours
	div tens_b
	mov quo2,al
	mov re2,ah
	
	mov ah,02h
	mov dl,quo2
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,re2
	add dl,30h
	int 21h

	mov ah,02h
	mov dl,':'
	int 21h

	mov ax,0
	mov al,minutes
	div tens_b
	mov quo2,al
	mov re2,ah
	
	mov ah,02h
	mov dl,quo2
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,re2
	add dl,30h
	int 21h

	mov ah,02h
	mov dl,':'
	int 21h

	mov ax,0
	mov al,seconds
	div tens_b
	mov quo2,al
	mov re2,ah
	
	mov ah,02h
	mov dl,quo2
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,re2
	add dl,30h
	int 21h

	RET
timeD endp

ShowI proc FAR
    mov splace,0
	mov bh,tthousand_W
	mov inttthousand,bh
	mov bx,ringgit
	mov intringgit,bx
	mov bx,sen
	mov intsen,bx

	call calI
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	lea dx,nl
	int 21h

	mov ah,09h
	mov cx,80
	mov bh,0
	mov bl,70h
	int 10h

	lea dx,futInt
	int 21h
	
	mov ah,09h
	lea dx,intAmt
	int 21h
	
	
	
	mov ah,09h
	lea dx,oneY
	int 21h
	mov incY,1
	call DateD
	
	mov ah,02h
	mov dl,':'
	int 21h
	
	mov ah,02h
	mov dl,' '
	int 21h
	
	mov ax,t_iringgit
	mov bx,t_isen
	mov typeIn,0
	call form
	call show
	
	mov ah,02h
	mov dl,09
	int 21h
	
	mov ax,intringgit
	mov bx,intsen
	mov typeIn,2
	call form
	call show
	
	mov cx,4
	cal5:
		call calI
	loop cal5
	
	mov ah,09h
	lea dx,fiveY
	int 21h
	mov incY,5
	call DateD
	
	mov ah,02h
	mov dl,':'
	int 21h
	
	mov ah,02h
	mov dl,' '
	int 21h
	
	mov ax,t_iringgit
	mov bx,t_isen
	mov typeIn,0
	call form
	call show
	
	mov ah,02h
	mov dl,09
	int 21h
	
	mov ax,intringgit
	mov bx,intsen
	mov typeIn,2
	call form
	call show
	
	mov cx,5
	cal10:
		call calI
	loop cal10
	
	mov ah,09h
	lea dx,tenY
	int 21h
	mov incY,10
	call DateD
	
	mov ah,02h
	mov dl,':'
	int 21h
	
	mov ah,02h
	mov dl,' '
	int 21h
	
	mov ax,t_iringgit
	mov bx,t_isen
	mov typeIn,0
	call form
	call show
	
	mov ah,02h
	mov dl,09
	int 21h
	
	mov ax,intringgit
	mov bx,intsen
	mov typeIn,2
	call form
	call show	
	
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	mov cx,80
	mov bh,0
	mov bl,70h
	int 10h
	lea dx,nl
	int 21h
	
	
	RET
ShowI endp

; mov ax,NAME  put note(thousand) amount to ax
; mov bx,NAME  put cent amount to bx
; mov dl,NAME  put tenthousand amount to dl
; mov dh,NAME  put sign to dh 1 for positive 0 for negative
StoRecord proc
	cmp dl,0
	jne validSumarry
	cmp ax,0
	jne validSumarry
	cmp bx,0
	jne validSumarry
	RET
	validSumarry:
	cmp dh,3 
	jne NTran
	cmp verify,'A'
	Je TranB
	jmp TranA
	
	NTran:;normal transaction
	cmp VERIFY,'A'
	jne Brec
	TranA:
	mov si,numRA
	mov di,numRAw
	mov RringgitA[di],ax
	mov RsenA[di],bx
	mov ArrRecordA[si],dh
	mov RtthousandA[si],dl
	mov ah,2ah
	int 21h
	mov stoyearA[di],cx
	mov stomonthA[si],dh
	mov stodayA[si],dl
	mov ah,2ch
	int 21h
	mov stohourA[si],ch
	mov stominA[si],cl
	mov stosecA[si],dh
	
	doneRA:
	inc noTranA
	inc numRA
	add numRAw,2
	cmp numRA,10
	Jne endRec
	mov numRA,0
	mov numRAw,0
	jmp endRec
	
	TranB:
	Brec:
	mov si,numRB
	mov di,numRBw
	mov RringgitB[di],ax
	mov RsenB[di],bx
	mov ArrRecordB[si],dh
	mov RtthousandB[si],dl
	mov ah,2ah
	int 21h
	mov stoyearB[di],cx
	mov stomonthB[si],dh
	mov stodayB[si],dl
	mov ah,2ch
	int 21h
	mov stohourB[si],ch
	mov stominB[si],cl
	mov stosecB[si],dh

	doneRB:
	inc noTranB
	inc numRB
	add numRBw,2
	cmp numRB,10
	Jne endRec
	mov numRB,0
	mov numRBw,0
	jmp endRec
	
	
	endRec:
	RET
	
StoRecord endp

showRecord proc far
	call far ptr clearSc
	
	mov ah,09h
	lea dx,sumMsg
	int 21h
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	cmp VERIFY,'A'
	Je showRA
	jmp ShowRB
	showRA:

	mov ah,09H
	lea dx,numSumMsg
	int 21H

	mov ax,0
	mov al,noTranA
	div hundreds_b
	mov bx,ax

	cmp bl,0
	je nextNum
	mov ah,02H
	mov dl,bl
	add dl,30H
	int 21H

	nextNum:
	mov ax,0
	mov al,bh
	div tens_b
	mov bx,ax

	cmp bl,0
	je nextNum2
	mov ah,02H
	mov dl,bl
	add dl,30H
	int 21h
	nextNum2:
	mov ah,02H
	mov dl,bh
	add dl,30H
	int 21H
	mov ah,09
	lea dx,nl
	int 21H


	mov cx,10
	mov si,0
	mov di,0
	mov sortnum,1
	RoutA:
		mov tempCX,cx
		mov tempSI,si
		JMP showSnum
	
		continueSum:
		cmp ArrRecordA[si],5
		je nextRA
		cmp ArrRecordA[si],0
		je OutMsg
		cmp ArrRecordA[SI],2
		je OutMsg2
		cmp ArrRecordA[SI],4
		je OutMsg3

		mov ah,09h
		lea dx,InMt
		int 21h
		jmp printNumA
		
		printNumA:
		mov bl,RtthousandA[si]
		mov ttplace,bl
		mov ax,RringgitA[di]
		mov bx,RsenA[di]
		mov typeIn,3
		call far ptr form
		call far ptr show
		mov cx,tempCX
		mov si,tempSI
		jmp processA
			
		nextRA:
		mov cx,tempCX
		mov si,tempSI
		inc si
		add di,2
		inc sortnum

	loop RoutA
	Jmp endShowR
	
	OutMsg:
		mov ah,09h
		lea dx,OutMt
		int 21h
	jmp printNumA

	OutMsg2:
		mov ah,09h
		lea dx,InMd
		int 21h
	jmp printNumA

	OutMsg3:
		mov ah,09h
		lea dx,OutMw
		int 21h
	jmp printNumA

	processA:
		mov ah,03h
		mov bx,0
		int 10h
		mov ah,02H
		mov bh,0
		mov dl,35
		int 10h
		mov dl,' '
		int 21h
		mov cx,tempCX
		mov si,tempSI
		mov bx,stoyearA[di]
		mov al,stodayA[si]
		mov ah,stomonthA[si]
		mov year,bx
		mov day,al
		mov month,ah
		mov incY,0
		call far ptr DateD

		mov ah,02H
		mov dl,' '
		int 21h
		mov cx,tempCX
		mov si,tempSI
		mov bh,stohourA[si]
		mov bl,stominA[si]
		mov al,stosecA[si]
		mov hours,bh
		mov minutes,bl
		mov seconds,al
		call FAR PTR timeD
	JMP nextRA
	showSnum:
		mov ah,09
		lea dx,nl
		int 21H
		cmp sortnum,10
		je isten
		mov ah,02H
		mov dl,sortnum
		add dl,30H
		int 21H
		mov ah,02H
		mov dl,' '
		int 21H
		JMP continueSum
		isten:
		mov ah,09H
		lea dx,tendisplay
		int 21H
		jmp continueSum

	
	ShowRB:
	mov ah,09H
	lea dx,numSumMsg
	int 21H

	mov ax,0
	mov al,noTranB
	div hundreds_b
	mov bx,ax

	cmp bl,0
	je nextNum3
	mov ah,02H
	mov dl,bl
	add dl,30H
	int 21H

	nextNum3:
	mov ax,0
	mov al,bh
	div tens_b
	mov bx,ax

	cmp bl,0
	je nextNum4
	mov ah,02H
	mov dl,bl
	add dl,30H
	int 21h
	nextNum4:
	mov ah,02H
	mov dl,bh
	add dl,30H
	int 21h
	mov ah,09
	lea dx,nl
	int 21H


	mov cx,10
	mov si,0
	mov di,0
	mov sortnum,1
	RoutB:
		mov tempCX,cx
		mov tempSI,si
		jmp showSnum2
	
		continueSum2:
		cmp ArrRecordB[si],5
		je nextRB
		cmp ArrRecordB[si],0
		je OutMsgB
		cmp ArrRecordB[SI],2
		je OutMsg2B
		cmp ArrRecordB[SI],4
		je OutMsg3B

		
		mov ah,09h
		lea dx,InMt
		int 21h
		jmp printNumB
		
		printNumB:
		mov bl,RtthousandB[si]
		mov ttplace,bl
		mov ax,RringgitB[di]
		mov bx,RsenB[di]
		mov typeIn,3
		call far ptr form
		call far ptr show
		mov cx,tempCX
		mov si,tempSI
		jmp processB
		
		nextRB:
		mov cx,tempCX
		mov si,tempSI
		inc si
		add di,2
		inc sortnum
		
	loop RoutB
	JMP endShowR
	
	OutMsgB:
		mov ah,09h
		lea dx,OutMt
		int 21h
		jmp printNumB

		OutMsg2B:
		mov ah,09h
		lea dx,InMd
		int 21h
		jmp printNumB

		OutMsg3B:
		mov ah,09h
		lea dx,OutMw
		int 21h
		jmp printNumB	

	processB:
		mov ah,03h
		mov bx,0
		int 10h
		mov ah,02H
		mov bh,0
		mov dl,35
		int 10h
		mov dl,' '
		int 21h
		mov cx,tempCX
		mov si,tempSI
		mov bx,stoyearB[di]
		mov al,stodayB[si]
		mov ah,stomonthB[si]
		mov year,bx
		mov day,al
		mov month,ah
		mov incY,0
		call far ptr DateD

		mov ah,02H
		mov dl,' '
		int 21h
		mov cx,tempCX
		mov si,tempSI
		mov bh,stohourB[si]
		mov bl,stominB[si]
		mov al,stosecB[si]
		mov hours,bh
		mov minutes,bl
		mov seconds,al
		call FAR PTR timeD
	JMP nextRB
	showSnum2:
		mov ah,09
		lea dx,nl
		int 21H
		cmp sortnum,10
		je isten2
		mov ah,02H
		mov dl,sortnum
		add dl,30H
		int 21H
		mov ah,02H
		mov dl,' '
		int 21H
		JMP continueSum2
		isten2:
		mov ah,09H
		lea dx,tendisplay
		int 21H
	jmp continueSum2




	endShowR:
	
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09H
	mov cx,37
	mov bh,0
	mov bl,0Ch
	int 10H
	lea dx,conMsg
	int 21H

	mov ah,01H
	int 21H

	call far ptr clearSc
	RET
	


showRecord endp

clearSc proc FAR
	mov ah,06h
	mov bh,07h
	mov al,0
	mov cx,0
	mov dh,24
	mov dl,79
	int 10H

	mov ah,02H
	mov bh,0
	mov dx,0
	int 10h

	RET
clearSc endp



WITHDRAW PROC
	CMP VERIFY,'A'
	JE ACCOUNTA
	JMP ACCOUNTB

	ACCOUNTA:
		MOV TTNOTE,0
		MOV CURRENTNOTE,0
		MOV CURRENTCENT,0
		MOV AX,NOTE_A
		MOV DX,0
		DIV TEN_THOUSAND
		ADD TTNOTE,AX
		MOV AX,TTHOUSAND_AMOUNT_STORED1
		ADD TTNOTE,AX
		ADD CURRENTNOTE,DX

		MOV AX,CENT_A
		ADD CURRENTCENT,AX
		JMP START_WITHDRAW

	ACCOUNTB:
		MOV TTNOTE,0
		MOV CURRENTNOTE,0
		MOV CURRENTCENT,0
		MOV AX,NOTE_B
		MOV DX,0
		DIV TEN_THOUSAND
		ADD TTNOTE,AX
		MOV AX,TTHOUSAND_AMOUNT_STORED2
		ADD TTNOTE,AX
		ADD CURRENTNOTE,DX

		MOV AX,CENT_B
		ADD CURRENTCENT,AX
		JMP START_WITHDRAW

	START_WITHDRAW:
		MOV AH,9
		LEA DX,NL
		INT 21H

		MOV AX,0600H
		MOV BH,71H
		MOV CX,0
		MOV DX,024FH
		INT 10H

		MOV AX,0600H
		MOV BH,2
		MOV CX,0300H
		MOV DX,034FH
		INT 10H

		MOV AX,0600H
		MOV BH,3
		MOV CX,0400H
		MOV DX,044FH
		INT 10H

		MOV AX,0600H
		MOV BH,4
		MOV CX,0500H
		MOV DX,054FH
		INT 10H

		MOV AX,0600H
		MOV BH,5
		MOV CX,0600H
		MOV DX,064FH
		INT 10H

		MOV AX,0600H
		MOV BH,6
		MOV CX,0700H
		MOV DX,074FH
		INT 10H

		MOV AH,9
		LEA DX,WDMENU
		INT 21H

		MOV AH,9
		LEA DX,NL
		INT 21H

		MOV AH,9
		LEA DX,WDSHOW
		INT 21H

		CALL OUTPUT

		MOV AH,9
		LEA DX,NL
		INT 21H

		MOV AH,9
		LEA DX,WDSELECT
		INT 21H

		MOV AH,1
		INT 21H
		SUB AL,30H
		MOV WDSELECTION,AL

		MOV AH,9
		LEA DX,NL
		INT 21H

		CMP WDSELECTION,1
		JE WITHDRAW_SELECTION1
		CMP WDSELECTION,2
		JE TEMPORARY_JUMP1
		CMP WDSELECTION,3
		JE TEMPORARY_JUMP2
		CMP WDSELECTION,4
		JE TEMPORARY_JUMP3
		CMP WDSELECTION,5
		JE TEMPORARY_JUMP4
		CMP WDSELECTION,6
		JE TEMPORARY_JUMP5
		CMP WDSELECTION,7
		JE TEMPORARY_JUMP6
		CMP WDSELECTION,8
		JE TEMPORARY_JUMP7
		CMP WDSELECTION,9
		JE TEMPORARY_JUMP8

		JMP SELECTIONMENU

		TEMPORARY_JUMP1:
			JMP WITHDRAW_SELECTION2
		TEMPORARY_JUMP2:
			JMP WITHDRAW_SELECTION3
		TEMPORARY_JUMP3:
			JMP WITHDRAW_SELECTION4
		TEMPORARY_JUMP4:
			JMP WITHDRAW_SELECTION5

		WITHDRAW_SELECTION1:
			CMP CURRENTNOTE,5020
			JGE WITHDRAW_CALCULATION1

			CMP TTNOTE,0
			JG BRING_PLACE1

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			TEMPORARY_JUMP25:
				JMP TEMPORARY_JUMP14
			TEMPORARY_JUMP5:
				JMP WITHDRAW_SELECTION6
			TEMPORARY_JUMP6:
				JMP WITHDRAW_SELECTION7
			TEMPORARY_JUMP7:
				JMP WITHDRAW_SELECTION8
			TEMPORARY_JUMP8:
				JMP WITHDRAW_SELECTION9

			BRING_PLACE1:
				CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION1:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM1
				CMP AL,'y'
				JE WITHDRAW_CONFIRM1
				CMP AL,'N'
				JE TEMPORARY_JUMP25
				CMP AL,'n'
				JE TEMPORARY_JUMP25

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION1
				
				WITHDRAW_CONFIRM1:
				SUB CURRENTNOTE,5005

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT1A
				JMP ACCOUNT1B

				ACCOUNT1A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END1

				ACCOUNT1B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END1:
					MOV AX,5005
					MOV BX,0
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

					TEMPORARY_JUMP14:
						JMP SELECTIONMENU

		WITHDRAW_SELECTION2:
			CMP CURRENTNOTE,2020
			JGE WITHDRAW_CALCULATION2

			CMP TTNOTE,0
			JG BRING_PLACE2

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			BRING_PLACE2:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION2:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM2
				CMP AL,'y'
				JE WITHDRAW_CONFIRM2
				CMP AL,'N'
				JE TEMPORARY_JUMP14
				CMP AL,'n'
				JE TEMPORARY_JUMP14

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION2

				WITHDRAW_CONFIRM2:
				SUB CURRENTNOTE,2005

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT2A
				JMP ACCOUNT2B

				ACCOUNT2A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END2

				ACCOUNT2B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END2:
					MOV AX,2005
					MOV BX,0
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

		WITHDRAW_SELECTION3:
			CMP CURRENTNOTE,1020
			JGE WITHDRAW_CALCULATION3

			CMP TTNOTE,0
			JG BRING_PLACE3

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			BRING_PLACE3:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION3:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM3
				CMP AL,'y'
				JE WITHDRAW_CONFIRM3
				CMP AL,'N'
				JE TEMPORARY_JUMP28
				CMP AL,'n'
				JE TEMPORARY_JUMP28

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION3

				TEMPORARY_JUMP28:
					JMP TEMPORARY_JUMP15

				WITHDRAW_CONFIRM3:
				SUB CURRENTNOTE,1005

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT3A
				JMP ACCOUNT3B

				ACCOUNT3A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END3

				ACCOUNT3B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END3:
					MOV AX,1005
					MOV BX,0
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

					TEMPORARY_JUMP15:
						JMP SELECTIONMENU

		WITHDRAW_SELECTION4:
			CMP CURRENTNOTE,520
			JGE WITHDRAW_CALCULATION4

			CMP TTNOTE,0
			JG BRING_PLACE4

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			BRING_PLACE4:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION4:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'1'
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM4
				CMP AL,'y'
				JE WITHDRAW_CONFIRM4
				CMP AL,'N'
				JE TEMPORARY_JUMP15
				CMP AL,'n'
				JE TEMPORARY_JUMP15

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION4

				WITHDRAW_CONFIRM4:
				SUB CURRENTNOTE,501
				CMP CURRENTCENT,50
				JGE SUBTRACT_CENT1

				CALL LEND_RINGGIT

				SUBTRACT_CENT1:
					SUB CURRENTCENT,50

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT4A
				JMP ACCOUNT4B

				ACCOUNT4A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END4

				ACCOUNT4B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END4:
					MOV AX,501
					MOV BX,50
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

		WITHDRAW_SELECTION5:
			CMP CURRENTNOTE,220
			JGE WITHDRAW_CALCULATION5

			CMP TTNOTE,0
			JG BRING_PLACE5

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			TEMPORARY_JUMP26:
				JMP TEMPORARY_JUMP16

			BRING_PLACE5:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION5:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AH,2
				MOV DL,'6'
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM5
				CMP AL,'y'
				JE WITHDRAW_CONFIRM5
				CMP AL,'N'
				JE TEMPORARY_JUMP26
				CMP AL,'n'
				JE TEMPORARY_JUMP26

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION5

				WITHDRAW_CONFIRM5:
				SUB CURRENTNOTE,200
				CMP CURRENTCENT,60
				JGE SUBTRACT_CENT2

				CALL LEND_RINGGIT

				SUBTRACT_CENT2:
					SUB CURRENTCENT,60

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT5A
				JMP ACCOUNT5B

				ACCOUNT5A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END5

				ACCOUNT5B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END5:
					MOV AX,200
					MOV BX,60
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

					TEMPORARY_JUMP16:
						JMP SELECTIONMENU

		WITHDRAW_SELECTION6:
			CMP CURRENTNOTE,120
			JGE WITHDRAW_CALCULATION6

			CMP TTNOTE,0
			JG BRING_PLACE6

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			BRING_PLACE6:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION6:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AH,2
				MOV DL,'3'
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM6
				CMP AL,'y'
				JE WITHDRAW_CONFIRM6
				CMP AL,'N'
				JE TEMPORARY_JUMP16
				CMP AL,'n'
				JE TEMPORARY_JUMP16

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION6

				WITHDRAW_CONFIRM6:
				SUB CURRENTNOTE,100
				CMP CURRENTCENT,30
				JGE SUBTRACT_CENT3

				CALL LEND_RINGGIT

				SUBTRACT_CENT3:
					SUB CURRENTCENT,30

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT6A
				JMP ACCOUNT6B

				ACCOUNT6A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END6

				ACCOUNT6B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END6:
					MOV AX,100
					MOV BX,30
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

		WITHDRAW_SELECTION7:
			CMP CURRENTNOTE,70
			JGE WITHDRAW_CALCULATION7

			CMP TTNOTE,0
			JG BRING_PLACE7

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			TEMPORARY_JUMP27:
				JMP TEMPORARY_JUMP17

			BRING_PLACE7:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION7:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AH,2
				MOV DL,'1'
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM7
				CMP AL,'y'
				JE WITHDRAW_CONFIRM7
				CMP AL,'N'
				JE TEMPORARY_JUMP27
				CMP AL,'n'
				JE TEMPORARY_JUMP27

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION7

				WITHDRAW_CONFIRM7:
				SUB CURRENTNOTE,50
				CMP CURRENTCENT,15
				JGE SUBTRACT_CENT4

				CALL LEND_RINGGIT

				SUBTRACT_CENT4:
					SUB CURRENTCENT,15

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT7A
				JMP ACCOUNT7B

				ACCOUNT7A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END7

				ACCOUNT7B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END7:
					MOV AX,50
					MOV BX,15
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

					TEMPORARY_JUMP17:
						JMP SELECTIONMENU

		WITHDRAW_SELECTION8:
			CMP CURRENTNOTE,40
			JGE WITHDRAW_CALCULATION8

			CMP TTNOTE,0
			JG BRING_PLACE8

			CALL clearSc

			MOV AH,9
			MOV CX,58
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDERROR
			INT 21H
			JMP WITHDRAW

			BRING_PLACE8:
			CALL LEND_TENTHOUSAND

			WITHDRAW_CALCULATION8:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,2
				MOV DL,'6'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM8
				CMP AL,'y'
				JE WITHDRAW_CONFIRM8
				CMP AL,'N'
				JE TEMPORARY_JUMP17
				CMP AL,'n'
				JE TEMPORARY_JUMP17

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_CALCULATION8

				WITHDRAW_CONFIRM8:
				SUB CURRENTNOTE,20
				CMP CURRENTCENT,6
				JGE SUBTRACT_CENT5

				CALL LEND_RINGGIT

				SUBTRACT_CENT5:
					SUB CURRENTCENT,6

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT8A
				JMP ACCOUNT8B

				ACCOUNT8A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END8

				ACCOUNT8B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END8:
					MOV AX,20
					MOV BX,6
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

		WITHDRAW_SELECTION9:
			MOV AH,9
			LEA DX,WDASK
			INT 21H 
	
			MOV AH,10
			LEA DX,NUMBER
			INT 21H
	
			MOV AH,9
			LEA DX,NL 
			INT 21H

			MOV CH,0
			MOV CL,ACT_NUMBER
			MOV SI,0
			MOV DI,0

			STORE_FINAL:
			MOV BL,NUMBER_STORED[DI]
			SUB BL,30H
			MOV ACTUAL_NUMBER[SI],BL
			INC SI
			INC DI
			LOOP STORE_FINAL

			MOV BX,SI
			MOV CX,SI
			MOV SI,0

			LOOPING:
				CMP ACTUAL_NUMBER[SI],0
				JL WRONG_INPUT
				CMP ACTUAL_NUMBER[SI],9
				JG WRONG_INPUT

				JMP INCREASE_SI

				WRONG_INPUT:
				CALL clearSc

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDSHOW
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_SELECTION9

				INCREASE_SI:
					INC SI
			LOOP LOOPING

			CMP BX,2
			JE TWO_DIGIT
			CMP BX,3
			JE TEMPORARY_JUMP9
			CMP BX,4
			JE TEMPORARY_JUMP10
			CMP BX,5
			JE TEMPORARY_JUMP11

			CALL clearSc

			MOV AH,9
			MOV CX,44
			MOV BH,0
			MOV BL,12
			INT 10H

			MOV AH,9
			LEA DX,WDSALAH
			INT 21H

			MOV AH,9
			LEA DX,NL
			INT 21H

			MOV AH,9
			LEA DX,WDSHOW
			INT 21H

			CALL OUTPUT

			MOV AH,9
			LEA DX,NL
			INT 21H

			JMP WITHDRAW_SELECTION9

			TEMPORARY_JUMP9:
				JMP THREE_DIGIT
			TEMPORARY_JUMP10:
				JMP FOUR_DIGIT
			TEMPORARY_JUMP11:
				JMP FIVE_DIGIT

			TWO_DIGIT:
				MOV TOTAL,0
				MOV AL,NUMBER_STORED[0]
				SUB AL,30H
				MUL TENS
				ADD TOTAL,AX
				MOV AL,NUMBER_STORED[1]
				SUB AL,30H
				MUL ONE
				ADD TOTAL,AX

				MOV AX,TOTAL
				DIV TENS
				CMP AH,0
				JNE TEMPORARY_JUMP12

				MOV AX,TOTAL
				ADD AX,20
				CMP CURRENTNOTE,AX
				JGE CALCULATE_CHARGE1

				CMP TTNOTE,0
				JG BRING_PLACE9

				CALL clearSc

				MOV AH,9
				MOV CX,58
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDERROR
				INT 21H
				JMP WITHDRAW
		
				TEMPORARY_JUMP12:
					JMP ERROR

				MOV AH,9
				LEA DX,NL
				INT 21H

				BRING_PLACE9:
				CALL LEND_TENTHOUSAND
				JMP CALCULATE_CHARGE1

				JMP WITHDRAW_SELECTION9

				CALCULATE_CHARGE1:
				MOV BX,TOTAL
				MOV AX,TOTAL
				MUL THREE
				DIV TENS

				MOV CX,AX
				MOV AH,0
				DIV TENS
				MOV TOTAL,BX
				MOV BX,AX

				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'0'
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AH,2
				MOV DL,BL
				ADD DL,30H
				INT 21H

				MOV AH,2
				MOV DL,BH
				ADD DL,30H
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM9
				CMP AL,'y'
				JE WITHDRAW_CONFIRM9
				CMP AL,'N'
				JE TEMPORARY_JUMP18
				CMP AL,'n'
				JE TEMPORARY_JUMP18

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP CALCULATE_CHARGE1

				WITHDRAW_CONFIRM9:
				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV BH,0
				MOV WD_CENT_CHARGE,CX
				CMP CURRENTCENT,CX
				JGE SUBTRACT_CENT6

				CALL LEND_RINGGIT

				SUBTRACT_CENT6:
					SUB CURRENTCENT,CX

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H

				MOV BX,TOTAL
				SUB CURRENTNOTE,BX
				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT9A
				JMP ACCOUNT9B

				TEMPORARY_JUMP18:
					JMP SELECTIONMENU

				ACCOUNT9A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END9

				ACCOUNT9B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END9:
					MOV AX,TOTAL
					MOV BX,WD_CENT_CHARGE
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

			THREE_DIGIT:
				MOV TOTAL,0
				MOV AL,NUMBER_STORED[0]
				SUB AL,30H
				MUL HUNDRED
				ADD TOTAL,AX
				MOV AL,NUMBER_STORED[1]
				SUB AL,30H
				MUL TENS
				ADD TOTAL,AX
				MOV AL,NUMBER_STORED[2]
				SUB AL,30H
				MUL ONE
				ADD TOTAL,AX

				MOV AX,TOTAL
				DIV TENS
				CMP AH,0
				JNE TEMPORARY_JUMP20

				MOV AX,TOTAL
				ADD AX,20
				CMP CURRENTNOTE,AX
				JGE CALCULATE_CHARGE2

				CMP TTNOTE,0
				JG BRING_PLACE10

				CALL clearSc

				MOV AH,9
				MOV CX,58
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDERROR
				INT 21H
				JMP WITHDRAW

				TEMPORARY_JUMP20:
					JMP ERROR

				BRING_PLACE10:
				CALL LEND_TENTHOUSAND
				JMP CALCULATE_CHARGE2

				JMP WITHDRAW_SELECTION9

				CALCULATE_CHARGE2:
				MOV AX,TOTAL
				MUL THREE
				DIV THOUSAND
				MOV BX,AX
				MOV CX,DX

				MOV BH,0

				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,BL
				ADD DL,30H
				INT 21H

				MOV AH,2
				MOV DL,'.'
				INT 21H

				MOV AX,CX
				DIV TENS
				DIV TENS
				MOV CX,AX

				MOV AH,2
				MOV DL,CL
				ADD DL,30H
				INT 21H

				MOV AH,2
				MOV DL,CH
				ADD DL,30H
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM10
				CMP AL,'y'
				JE WITHDRAW_CONFIRM10
				CMP AL,'N'
				JE TEMPORARY_JUMP29
				CMP AL,'n'
				JE TEMPORARY_JUMP29

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP CALCULATE_CHARGE2

				TEMPORARY_JUMP29:
					JMP TEMPORARY_JUMP21

				WITHDRAW_CONFIRM10:
				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AX,TOTAL
				MUL THREE
				DIV THOUSAND
				MOV BX,AX
				MOV CX,DX

				MOV WD_RINGGIT_CHARGE,BX
				SUB CURRENTNOTE,BX
				MOV AX,CX
				DIV TENS
				MOV AH,0
				MOV WD_CENT_CHARGE,AX
				CMP CURRENTCENT,AX
				JGE SUBTRACT_CENT7
				
				CALL LEND_RINGGIT

				SUBTRACT_CENT7:
					SUB CURRENTCENT,AX

				CALL clearSc

				MOV AH,9
				LEA DX,WDEND
				INT 21H
				
				MOV BX,TOTAL
				SUB CURRENTNOTE,BX
				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT10A
				JMP ACCOUNT10B

				ACCOUNT10A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END10

				ACCOUNT10B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END10:
					MOV AX,TOTAL
					ADD AX,WD_RINGGIT_CHARGE
					MOV BX,WD_CENT_CHARGE
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

					TEMPORARY_JUMP19:
						JMP ERROR

			FOUR_DIGIT:
				MOV TOTAL,0
				MOV AX,0
				MOV AL,NUMBER_STORED[0]
				SUB AL,30H
				MUL TENS
				MOV TOTAL,AX
				MOV DX,0
				MUL HUNDREDS
				MOV TOTAL,AX
				
				MOV AX,0
				MOV AL,NUMBER_STORED[1]
				SUB AL,30H
				MUL HUNDREDS
				ADD TOTAL,AX
				MOV AX,0
				MOV AL,NUMBER_STORED[2]
				SUB AL,30H
				MUL TENS
				ADD TOTAL,AX
				MOV AX,0
				MOV AL,NUMBER_STORED[3]
				SUB AL,30H
				MUL ONE
				ADD TOTAL,AX
				
				MOV BX,TOTAL
				MOV DX,0
				MOV AX,TOTAL
				DIV TEN
				CMP DX,0
				JNE TEMPORARY_JUMP30

				MOV AX,TOTAL
				ADD AX,20
				CMP CURRENTNOTE,AX
				JGE START_CALCULATION1

				CMP TTNOTE,0
				JG START_CALCULATION1

				JMP NOT_ENOUGH

				TEMPORARY_JUMP21:
					JMP SELECTIONMENU

				START_CALCULATION1:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM11
				CMP AL,'y'
				JE WITHDRAW_CONFIRM11
				CMP AL,'N'
				JE TEMPORARY_JUMP21
				CMP AL,'n'
				JE TEMPORARY_JUMP21

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP START_CALCULATION1

				TEMPORARY_JUMP30:
				 JMP ERROR

				WITHDRAW_CONFIRM11:
				MOV AX,TOTAL
				CMP CURRENTNOTE,AX
				JGE CALCULATE_CHARGE3

				CMP TTNOTE,0
				JG BRING_PLACE11

				CALL clearSc

				MOV AH,9
				MOV CX,58
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDERROR
				INT 21H
				JMP WITHDRAW

				ERROR:
					CALL clearSc

					MOV AH,9
					MOV CX,44
					MOV BH,0
					MOV BL,12
					INT 10H

					MOV AH,9
					LEA DX,WDSALAH
					INT 21H

					MOV AH,9
					LEA DX,NL
					INT 21H

					MOV AH,9
					LEA DX,WDSHOW
					INT 21H

					CALL OUTPUT

					MOV AH,9
					LEA DX,NL
					INT 21H

					JMP WITHDRAW_SELECTION9

				BRING_PLACE11:
				CALL LEND_TENTHOUSAND
				JMP CALCULATE_CHARGE3

				JMP WITHDRAW_SELECTION9

				CALCULATE_CHARGE3:
				SUB CURRENTNOTE,5
				SUB CURRENTNOTE,BX

				CALL clearSc
				
				MOV AH,9
				LEA DX,NL
				INT 21H
					
				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT11A
				JMP ACCOUNT11B

				ACCOUNT11A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END11

				ACCOUNT11B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END11:
					MOV AX,TOTAL
					ADD AX,5
					MOV BX,0
					MOV DL,0
					MOV DH,4
					CALL StoRecord
					JMP SELECTIONMENU

			FIVE_DIGIT:
				CMP ACTUAL_NUMBER[0],5
				JL NEXT

				CMP ACTUAL_NUMBER[0],5
				JG OVER_AMOUNT

				CMP ACTUAL_NUMBER[1],0
				JNE OVER_AMOUNT

				CMP ACTUAL_NUMBER[2],0
				JNE OVER_AMOUNT

				CMP ACTUAL_NUMBER[3],0
				JNE OVER_AMOUNT

				CMP ACTUAL_NUMBER[4],0
				JNE OVER_AMOUNT

				JMP NEXT

				OVER_AMOUNT:
				CALL clearSc

				MOV AH,9
				MOV CX,57
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDERRORR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDSHOW
				INT 21H

				CALL OUTPUT

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW_SELECTION9

				NEXT:
				MOV TOTAL,0
				MOV AX,0
				MOV AL,NUMBER_STORED[0]
				SUB AL,30H
				MOV DX,0
				MUL TEN_THOUSAND
				ADD TOTAL,AX

				MOV AX,0
				MOV AL,NUMBER_STORED[1]
				SUB AL,30H
				MOV DX,0
				MUL THOUSAND
				ADD TOTAL,AX

				MOV AX,0
				MOV AL,NUMBER_STORED[2]
				SUB AL,30H
				MUL HUNDREDS
				ADD TOTAL,AX

				MOV AX,0
				MOV AL,NUMBER_STORED[3]
				SUB AL,30H
				MUL TENS
				ADD TOTAL,AX

				MOV AX,0
				MOV AL,NUMBER_STORED[4]
				SUB AL,30H
				MUL ONE
				ADD TOTAL,AX
				
				MOV BX,TOTAL
				MOV DX,0
				MOV AX,TOTAL
				DIV TEN
				CMP DX,0
				JNE TEMPORARY_JUMP13

				ADD TOTAL,20
				MOV AX,0
				MOV AX,TOTAL
				MOV DX,0
				DIV TEN_THOUSAND
				CMP TTNOTE,AX
				JL TEMPORARY_JUMP31

				CMP CURRENTNOTE,DX
				JGE START_CALCULATION2

				MOV AX,0
				MOV AX,TOTAL
				MOV DX,0
				DIV TEN_THOUSAND
				MOV BX,TTNOTE
				SUB BX,AX

				CMP BX,0
				JG START_CALCULATION2

				TEMPORARY_JUMP31:
					JMP NOT_ENOUGH
				TEMPORARY_JUMP13:
					JMP ERROR
				TEMPORARY_JUMP22:
					JMP SELECTIONMENU

				START_CALCULATION2:
				MOV AH,9
				LEA DX,WDCONFIRM
				INT 21H

				MOV AH,2
				MOV DL,'5'
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				LEA DX,WDYESNO
				INT 21H

				MOV AH,1
				INT 21H

				CMP AL,'Y'
				JE WITHDRAW_CONFIRM12
				CMP AL,'y'
				JE WITHDRAW_CONFIRM12
				CMP AL,'N'
				JE TEMPORARY_JUMP22
				CMP AL,'n'
				JE TEMPORARY_JUMP22

				MOV AH,9
				LEA DX,NL
				INT 21H

				MOV AH,9
				MOV CX,30
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDINPUTERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP START_CALCULATION2

				WITHDRAW_CONFIRM12:
				SUB TOTAL,20
				MOV AX,0
				MOV AX,TOTAL
				MOV DX,0
				DIV TEN_THOUSAND
				SUB TTNOTE,AX
				MOV AH,0
				MOV TTHOU,AL

				MOV CX,DX
				MOV SOLVE_DUPLICATE_REGISTER,DX
				CMP CURRENTNOTE,CX
				JGE CALCULATE_CHARGE4

				CMP TTNOTE,0
				JG BRING_PLACE12

				NOT_ENOUGH:
				CALL clearSc

				MOV AH,9
				MOV CX,58
				MOV BH,0
				MOV BL,12
				INT 10H

				MOV AH,9
				LEA DX,WDERROR
				INT 21H

				MOV AH,9
				LEA DX,NL
				INT 21H

				JMP WITHDRAW

				BRING_PLACE12:
				CALL LEND_TENTHOUSAND

				CALCULATE_CHARGE4:
				CALL clearSc

				MOV AH,9
				LEA DX,NL
				INT 21H
					
				MOV AH,9
				LEA DX,WDEND
				INT 21H

				CMP CURRENTNOTE,5
				JGE SUB_CHARGE

				CALL LEND_TENTHOUSAND

				SUB_CHARGE:
					SUB CURRENTNOTE,5

				MOV CX,SOLVE_DUPLICATE_REGISTER

				CMP CURRENTNOTE,CX
				JGE SUB_WITHDRAW_AMOUNT

				CALL LEND_TENTHOUSAND

				SUB_WITHDRAW_AMOUNT:
					SUB CURRENTNOTE,CX
					MOV WD_RINGGIT_CHARGE,CX
					CALL OUTPUT

					MOV AH,9
					LEA DX,NL
					INT 21H
	
					MOV AH,9
					LEA DX,NL
					INT 21H

				CMP VERIFY,'A'
				JE ACCOUNT12A
				JMP ACCOUNT12B

				ACCOUNT12A:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED1,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_A,AX
					MOV AX,CURRENTCENT
					MOV CENT_A,AX
					JMP END12

				ACCOUNT12B:
					MOV AX,TTNOTE
					MOV TTHOUSAND_AMOUNT_STORED2,AX
					MOV AX,CURRENTNOTE
					MOV NOTE_B,AX
					MOV AX,CURRENTCENT
					MOV CENT_B,AX

				END12:
					MOV AX,WD_RINGGIT_CHARGE
					ADD AX,5
					MOV BX,0
					MOV DL,TTHOU
					MOV DH,4
					CALL StoRecord
				JMP SELECTIONMENU

WITHDRAW ENDP

OUTPUT PROC
	CMP VERIFY,'A'
	JE ACC_A
	JMP ACC_B

	ACC_A:
		MOV AX,CURRENTNOTE
		MOV NOTE_A,AX
		MOV AX,TTNOTE
		MUL TEN_THOUSAND
		ADD NOTE_A,AX

		MOV AX,CURRENTCENT
		MOV CENT_A,AX
		JMP SETERUSNYA

	ACC_B:
		MOV AX,CURRENTNOTE
		MOV NOTE_B,AX
		MOV AX,TTNOTE
		MUL TEN_THOUSAND
		ADD NOTE_B,AX

		MOV AX,CURRENTCENT
		MOV CENT_B,AX
		JMP SETERUSNYA

	SETERUSNYA:
		CMP TTNOTE,0
		JNE GOT_FIFTH_DIGIT
		JMP FOUR_DIGIT_OUTPUT

	GOT_FIFTH_DIGIT:
		MOV AH,2
		MOV DX,TTNOTE
		ADD DX,30H
		INT 21H

		CMP CURRENTNOTE,1000
		JGE FOUR_DIGIT_OUTPUT
		CMP CURRENTNOTE,100
		JGE ONE_ZERO
		CMP CURRENTNOTE,10
		JGE TWO_ZERO

		MOV AH,2
		MOV DL,'0'
		INT 21H
		MOV AH,2
		MOV DL,'0'
		INT 21H
		MOV AH,2
		MOV DL,'0'
		INT 21H
		JMP FOUR_DIGIT_OUTPUT

	ONE_ZERO:
		MOV AH,2
		MOV DL,'0'
		INT 21H
		JMP FOUR_DIGIT_OUTPUT

	TWO_ZERO:
		MOV AH,2
		MOV DL,'0'
		INT 21H
		MOV AH,2
		MOV DL,'0'
		INT 21H
		JMP FOUR_DIGIT_OUTPUT

	FOUR_DIGIT_OUTPUT:
		CMP CURRENTNOTE,1000
		JGE THOU
		CMP CURRENTNOTE,100
		JGE TEMPORARY_JUMP23
		CMP CURRENTNOTE,10
		JGE TEMPORARY_JUMP24
	
		MOV AH,2
		MOV DX,CURRENTNOTE
		ADD DX,30H
		INT 21H
	
		MOV AH,2
		MOV DL,'.'
		INT 21H
	
		MOV AX,CURRENTCENT
		DIV TENS
		MOV BX,AX
	
		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H
	
		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H
	
		JMP BEHIDE
		TEMPORARY_JUMP23:
			JMP HUN
		TEMPORARY_JUMP24:
			JMP TE
	
	THOU:
		MOV AX,CURRENTNOTE
		DIV HUNDRED
		MOV BX,AX

		MOV CH,BH
				
		MOV AH,0
		MOV AL,BL
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		MOV AH,0
		MOV AL,CH
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,'.'
		INT 21H

		MOV AX,CURRENTCENT
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		JMP BEHIDE

	HUN:
		MOV AX,CURRENTNOTE
		DIV HUNDRED
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,0
		MOV AL,BH
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,'.'
		INT 21H

		MOV AX,CURRENTCENT
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		JMP BEHIDE

	TE:
		MOV AX,CURRENTNOTE
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,'.'
		INT 21H

		MOV AX,CURRENTCENT
		DIV TENS
		MOV BX,AX

		MOV AH,2
		MOV DL,BL
		ADD DL,30H
		INT 21H

		MOV AH,2
		MOV DL,BH
		ADD DL,30H
		INT 21H

		BEHIDE:
		RET
			
OUTPUT ENDP

LEND_TENTHOUSAND PROC
	DEC TTNOTE
	ADD CURRENTNOTE,10000

	RET
LEND_TENTHOUSAND ENDP

LEND_RINGGIT PROC
	DEC CURRENTNOTE
	ADD CURRENTCENT,100

	RET
LEND_RINGGIT ENDP


END MAIN