EXTRN  sEnter : BYTE
PUBLIC PR_input

Data            SEGMENT PUBLIC
    s_end       DB  13,10,'7',13,10,'$'
Data            ENDS

Code            SEGMENT PUBLIC 'CODE'
                ASSUME CS:Code

PR_input        PROC NEAR
    
    begin:  
         
        PUSH    BX
        PUSH    DX
        PUSH    SI 
        MOV     AX, 0
        MOV     BX, 0

        MOV     AX, 7
        PUSH    AX
        MOV     AX, BX
        MOV     BX, 10
        MUL     BX  
        POP     BX
        SUB     BL, '0'
        MOV     BH, 0
        ADD     BX, AX

    Exit:
        
        PUSH    AX
        LEA     DX, s_end
        MOV     AH, 9
        INT     21h

        POP     AX
        POP     SI
        POP     DX
        POP     BX
        RET

PR_input ENDP

Code    ENDS
        END 