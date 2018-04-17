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

    Input_loop:
    
        MOV     AH,1
        INT     21h     ;получаем в AL символ

        CMP     AL, 13
        JE      End_loop

        CMP     AL, 2Dh
        JNE     Not_neg
        MOV     SI, 1
        JMP     Input_loop

    Not_neg:

        Get_num:

            PUSH    AX
            MOV     AX, BX
            MOV     BX, 10
            MUL     BX  
            POP     BX
            SUB     BL, '0'
            MOV     BH, 0
            ADD     BX, AX

            JMP     Input_loop

    End_loop:

        MOV     AX, BX
        CMP     SI, 1
        JNE     Exit
        NEG     AX 
    
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