DATAS SEGMENT
    store db 4 dup(?)
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
    MOV	CL, 4;�����Ĵ�
	MOV	CH, 4;ѭ���Ĵ�
	LEA BX, STORE
A10:
	MOV	DX, AX
	AND	DX, 0FH 	;ȡAX�ĵ���λ
	MOV	[BX], DL 	;����λ����STORE��
	INC	BX
	SHR	AX, CL		;�����Ĵ�
	DEC	CH
	JNZ	A10			;ѭ���Ĵ������룿
B10:
	MOV	DL, STORE	;�������ֱ����AL��BL��CL��DL��
	MOV	CL, STORE+1
	MOV	BL, STORE+2
	MOV	AL, STORE+3

    
    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

