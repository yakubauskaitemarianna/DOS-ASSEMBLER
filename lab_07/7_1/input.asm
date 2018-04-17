EXTRN  sEnter : BYTE
PUBLIC PR_input

Data         SEGMENT PUBLIC
    s_end    DB  13,10,'<entered>',13,10,'$'
Data         ENDS

Code         SEGMENT PUBLIC 'CODE'
             ASSUME CS:Code

PR_input     PROC NEAR
    
    begin:     

        PUSH    BX
        PUSH    DX
        PUSH    SI 
        MOV     AX, 0
        MOV     BX, 0

        MOV     AH, 9
        LEA     DX, sEnter
        INT     21h
        MOV     DX, 0 

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