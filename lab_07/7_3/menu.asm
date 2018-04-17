
EXTRN PR_new_line : NEAR
PUBLIC PR_menu

Data        SEGMENT PUBLIC 
    sMenu   DB  10,13,'   MENU', '$'
    sM0     DB  '0. Print MENU', '$'
    sM1     DB  '1. Input int', '$'
    sM2     DB  '2. Print unsigned BIN', '$'
    sM3     DB  '3. Print signed BIN', '$'
    sM4     DB  '4. Print unsigned TEN', '$'
    sM5     DB  '5. Print signed TEN', '$'
    sM6     DB  '6. Print unsigned HEX', '$'
    sM7     DB  '7. Print signed HEX','$'
    sM8     DB  '8. Exit', '$'
Data        ENDS

Code        SEGMENT PUBLIC 'CODE'
            ASSUME CS:Code, DS:Data

PR_menu     PROC NEAR
    
    MOV     AH,9
    
    LEA     DX,sMenu     ;загружаем действующий адрес SMenu в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM0       ;загружаем действующий адрес SM0 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM1       ;загружаем действующий адрес SM1 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM2       ;загружаем действующий адрес SM2 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM3       ;загружаем действующий адрес SM3 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM4       ;загружаем действующий адрес SM4 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM5       ;загружаем действующий адрес SM5 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM6       ;загружаем действующий адрес SM6 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM7       ;загружаем действующий адрес SM7 в DX
    INT     21h
    CALL    PR_new_line
    LEA     DX,sM8       ;загружаем действующий адрес SM8 в DX
    INT     21h
    
    RET

PR_menu ENDP

Code    ENDS
        END 