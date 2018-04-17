EXTRN	PR_print16 : NEAR
EXTRN   sEnter:BYTE
PUBLIC  PR_print16_signed


Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code

PR_print16_signed   PROC NEAR

	begin:
            
    	PUSH	BP		  ;передаем параметр
		MOV		BP,SP
		PUSH    SI

	get_param:

        MOV     AX, [BP+4]
        MOV     SI, 16

    Exit:

    	POP     SI
		POP		BP
        RET

PR_print16_signed ENDP

Code    ENDS
        END 