EXTRN  sEnter:BYTE
PUBLIC PR_print10


Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code

PR_print10   PROC NEAR
    
    Begin: 

        PUSH	BP		
		MOV		BP,SP
		PUSH	BX

		MOV		AX,[BP+4]
		MOV		BX,10

		PUSH	AX
	
	Loop1:
		MOV		DX,0
		DIV		BX
		MOV		CX,	AX			;сохраним значение AX (целая часть)
		MOV		AH,2	        ;печатаем пропуск
		MOV		DL,'a'
		INT		21h
		MOV		AX, CX		
		CMP		AX,0
		JNE		Loop1

		;делаем один откат назад

		MOV	AH,2
		MOV DL,8	
		INT 21h

		POP		AX

	Loop2:

		MOV		DX,0
		DIV		BX
		MOV		CX,	AX			;сохраним значение AX (целая часть)
		MOV		AH,2
		ADD		DL,'0'			;печатаем значение DX (остаток)
		INT		21h
		MOV		DL,8			;смещаемся назад ДВАЖДЫ!!!
		INT		21h
		INT		21h
		MOV		AX, CX
		CMP		AX,0
		JNE		Loop2

    Exit:   
    
		POP		BX
		POP		BP
		RET

PR_print10 ENDP

Code    ENDS
        END 