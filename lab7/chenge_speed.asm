STACK SEGMENT PARA 'STACK'
	DW 1024 DUP (?)
STACK ENDS

MAIN SEGMENT PARA 'CODE'

CHANGE_MIN_SPEED PROC
	IN 60h, 0F3h
	IN 60h, 1Fh
	
	MOV AH, 25h            
	MOV AL, 1Ch            
	MOV DX, offset CHANGE_MAX_SPEED
	INT 21h
	IRET
CHANGE_MIN_SPEED ENDP

CHANGE_MAX_SPEED PROC
	IN 60h, 0F3h
	IN 60h, 0h
	
	MOV AH, 25h            
	MOV AL, 1Ch            
	MOV DX, offset CHANGE_MIN_SPEED
	INT 21h
	IRET
CHANGE_MAX_SPEED ENDP

INIT:
	MOV AH, 25h            
	MOV AL, 1Ch            
	MOV DX, offset CHANGE_MIN_SPEED
	INT 21h
	MOV AX, 3100h
	MOV DX, 50h
	INT 21h

MAIN ENDS
END INIT