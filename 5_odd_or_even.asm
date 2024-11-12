ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    M1 DB 10,13, "ENTER A NUMBER: $"
    M2 DB 10,13, "ODD$"
    M3 DB 10,13, "EVEN$"
DATA ENDS

PRTMSG MACRO MSG
    LEA DX,MSG
    MOV AH, 09H
    INT 21H
ENDM

GETDCM MACRO
    MOV AH,01H
    INT 21H
    SUB AL,30H
ENDM

CODE SEGMENT
START: MOV AX,DATA
    MOV DS,AX
    PRTMSG M1
    GETDCM

    SHR AL,01H
    JC L1
    PRTMSG M3
    JMP L2
    
    L1: PRTMSG M2
    L2: MOV AH,4CH
    INT 21H
CODE ENDS
END START