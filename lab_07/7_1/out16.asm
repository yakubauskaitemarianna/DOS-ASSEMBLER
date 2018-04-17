
EXTRN  sEnter:BYTE
PUBLIC PR_print16

Data    SEGMENT PUBLIC
    List    DB  "0123456789ABCDEF"
Data    ENDS


Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code, DS:Data

PR_print16   PROC NEAR
     
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

PR_print16 ENDP

Code    ENDS
        END 