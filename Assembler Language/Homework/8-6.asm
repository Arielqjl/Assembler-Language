DATAS SEGMENT
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
    
    MOV	DI, 0
	MOV	SI, 0
BEGIN:		
	IN AL, 24H
	TES AL, 08H			;��ѯ��һ������
	JNZ	EXIT
	TES AL, 01H			;��ѯ��һ��׼��
	JZ BEGIN1
	IN AL, 26H			;�������ݲ�����BUFF1
	MOV	BUFF1[DI], AL
	INC	DI
BEGIN1:		
	IN AL, 36H
	TES AL, 08H			;��ѯ�ڶ��������
	JNZ	EXIT
	TES AL, 01H			;��ѯ�ڶ���׼����
	JZ BEGIN
	IN AL, 38H			;�������ݲ�����BUFF2
	MOV	BUFF2[SI], AL
	INC	SI
	JMP	BEGIN

    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


