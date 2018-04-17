EXTRN  sEnter:BYTE
PUBLIC PR_print2

Code        SEGMENT PUBLIC 'CODE'
            ASSUME CS:Code

PR_print2   PROC NEAR

	begin:

		PUSH	BP		    ;передаем параметр
		MOV		BP,SP
		PUSH	SI

	get_param:

		MOV		AX, [BP+4]	;получаем в АХ число, которое надо распечатать
		MOV		SI, 16

	;Цикл избавления от незначащих нулей

	Loop1:

		MOV		DH, 0
		SHL		AX, 1
		JNC		Loop1_next
		INC 	DH
		JMP		Loop2_print

	Loop1_next:

		DEC 	SI
		JNZ 	Loop1

	Loop2:

		MOV 	DH, 0
		SHL		AX, 1
		JNC		Loop2_print
        INC 	DH

    Loop2_print:

    	MOV		DL, '0'
    	ADD		DL, DH
    	MOV 	CX, AX 
    	MOV		AH, 2
    	INT		21h
    	MOV		AX, CX
    	DEC		SI
    	JNZ		Loop2

    Exit:

        POP     SI
        POP		BP
        RET

PR_print2 ENDP

Code    ENDS
        END 