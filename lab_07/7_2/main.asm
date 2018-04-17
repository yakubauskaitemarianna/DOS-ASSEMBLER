Stack   SEGMENT STACK 'STACK'
    DW  128h DUP (0)
Stack   ENDS

EXTRN PR_menu           : NEAR
EXTRN PR_input          : NEAR
EXTRN PR_print2         : NEAR
EXTRN PR_print2_signed  : NEAR
EXTRN PR_print10        : NEAR
EXTRN PR_print10_signed : NEAR
EXTRN PR_print16        : NEAR
EXTRN PR_print16_signed : NEAR

PUBLIC PR_new_line, sEnter 

Data    SEGMENT PUBLIC
    Funcs       DW  PR_menu, PR_input, PR_print2, PR_print2_signed, PR_print10, PR_print10_signed, PR_print16, PR_print16_signed
    X           DW  8
    sEnter      DB  '> ', '$'
Data    ENDS



Code    SEGMENT PUBLIC 'CODE'
        ASSUME CS:Code, DS:Data, SS:Stack

PR_new_line    PROC NEAR
            
    PUSH    AX
    PUSH    DX
    
    MOV     AH,2
    MOV     DL,10
    INT     21h
    MOV     DL,13
    INT     21h
    
    POP     DX
    POP     AX
    RET

PR_new_line ENDP


BEGIN:   

    Start:  
            MOV     AX,Data
            MOV     DS,AX
            CALL    PR_menu                     ;вывод меню

    Main_loop:
            
            CALL    PR_new_line
            MOV     AH,9
            LEA     DX,sEnter
            INT     21h
    
    Input_comand:

            MOV     AH,8                        ;ввод символа без эха
            INT     21h
            
            CMP     AL, '8'
            JA      Main_loop
            CMP     AL, '0'
            JB      Main_loop

            MOV     AH,2                        ;печатаем введенную цифру
            MOV     DL,AL
            INT     21h
            CALL    PR_new_line
 
            MOV     BL,AL
            SUB     BL,'0'                      ;получаем индекс команды

    Calling:

            CMP     BL, 8
            JE      Exit

            ADD     BL,BL                       ;удваиваем цифру, потому что адрес двухбайтовый
            MOV     BH,0

    Before:

            CMP     BL, 2
            JBE     Skip_push        
            PUSH X

    Skip_push:

            CALL Funcs[BX]

    After:

            CMP     BL, 2
            JBE     Skip_pop        
            ADD     SP, 2

    Skip_pop:

            CMP     BL, 2
            JNE     Main_loop
            MOV     X, AX                       ;если пользователь вводил число

            JMP Main_loop

    Exit:
    
            MOV     AH,4Ch
            MOV     AL,0
            INT     21h

Code    ENDS
        END  BEGIN