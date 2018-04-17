EXTRN	PR_print2 : NEAR
EXTRN  	sEnter:BYTE
PUBLIC  PR_print2_signed


Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code

PR_print2_signed   PROC NEAR
            
    begin:

		PUSH	BP		;передаем параметр
		MOV		BP,SP

	get_param:

		MOV		AX,[BP+4]
		CMP		AX, 0
		JGE		Call_print2

	make_neg:

    	PUSH	AX
    	MOV		AH, 2h
		MOV		DL, '-'
    	INT		21h
    	POP		AX
		NEG 	AX

	Call_print2:

		PUSH	AX
		CALL 	PR_print2
		ADD		SP, 2

    Exit:
    
        POP		BP
        RET

PR_print2_signed ENDP

Code    ENDS
        END 