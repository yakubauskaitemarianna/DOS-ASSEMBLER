EXTRN	PR_print10 : NEAR
EXTRN   sEnter:BYTE
PUBLIC  PR_print10_signed


Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code

PR_print10_signed   PROC NEAR
            
    begin:

		PUSH	BP		;передаем параметр
		MOV		BP,SP		

	get_param:

		MOV		AX,[BP+4]
		CMP		AX, 0
		JGE		Call_print10

	make_neg:

    	PUSH 	AX
    	MOV		AH, 2h
		MOV		DL, '-'
    	INT		21h
    	POP		AX
		NEG 	AX

	Call_print10:

		PUSH	AX
		CALL 	PR_print10
		ADD		SP, 2

        
    Exit:
    
        POP		BP
        RET

PR_print10_signed ENDP

Code    ENDS
        END 