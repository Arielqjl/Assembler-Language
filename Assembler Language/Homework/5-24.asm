DATAS SEGMENT
    SINGLIST	DD	 SING1
DD  SING2
DD  SING3
DD  SING4
DD  SING5
ERRMSG	DB	 ��Error! Invalid parameter!��, 0DH, 0AH, ��$��

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
    
    MAIN		PROC	FAR
ASSUME  CS: CSEG, DS: DSEG
START:		PUSH	DS				�����÷���DOS
SUB		AX, AX
PUSH	AX
MOV	AX, DSEG
MOV	DS, AX			����DS��ֵ

BEGIN:		MOV	AH, 1			���Ӽ�������ĸ������1~5
INT		21H
CMP	AL, 0DH
JZ		EXIT			���ǻس����������
SUB		AL, ��1��			����1~5��
JB		ERROR			��С��1������
CMP	AL, 4
JA		ERROR			������5������
MOV	BX, OFFSET SINGLIST
MUL	AX, 4			��(AX)=(AL)*4,ÿ������������׵�ַռ4���ֽ�
ADD	BX, AX
JMP		DWORD PTR[BX]	��תȥִ�и�������
ERROR:	MOV	DX, OFFSET ERRMSG
MOV	AH, 09H
INT		21H				����ʾ������Ϣ
JMP		BEGIN
SING1:		��
JMP		BEGIN
SING2:		��
JMP		BEGIN
SING3:		��
JMP		BEGIN
SING4:		��
JMP		BEGIN
SING5:		��
JMP		BEGIN
EXIT:		RET
MAIN		ENDP

    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

