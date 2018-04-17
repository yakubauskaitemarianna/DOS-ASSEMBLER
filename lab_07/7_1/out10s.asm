EXTRN	PR_print10 : NEAR
EXTRN  sEnter:BYTE
PUBLIC PR_print10_signed


Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code

PR_print10_signed   PROC NEAR
            
    	PUSH	BP		   ;передаем параметр
		MOV		BP,SP
		PUSH    SI

	get_param:

        MOV     AX, [BP+4] 
        MOV     SI, 16

    Exit:

    	POP     SI
		POP		BP
        RET  

PR_print10_signed ENDP

Code    ENDS
        END 