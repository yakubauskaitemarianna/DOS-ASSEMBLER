EXTRN  sEnter:BYTE
PUBLIC PR_print16

Data        SEGMENT PUBLIC
    List    DB  "0123456789ABCDEF"
Data        ENDS


Code        SEGMENT PUBLIC 'CODE'
            ASSUME CS:Code, DS:Data

PR_print16  PROC NEAR
     
    Begin:

        PUSH	BP		;передаем параметр
		MOV		BP,SP
		PUSH	BX

		MOV		CX, 4
		MOV		BX,[BP+4]
		MOV 	AX, 0 

	Loop1:

		MOV 	AL, BH
		SHR		AL, CL
		CMP		AL, 0
		JE 		Zero
		MOV		DI, BX
		LEA		BX, List
		XLAT
		MOV		BX, DI
		MOV		DL, AL
		MOV		AH,2
		INT		21h
	
	Zero:

		SHL		BX, CL
		CMP		BX, 0 
		JNE		Loop1

    Exit:  

		POP		BX
		POP		BP
		RET
		
PR_print16 ENDP

Code    ENDS
        END 