EXTRN  sEnter:BYTE
PUBLIC PR_print2

Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code

PR_print2   PROC NEAR

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

PR_print2 ENDP

Code    ENDS
        END 