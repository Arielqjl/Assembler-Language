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
    
    MOV	BX, 0 
	MOV	CX, 100
COMP:	
	MOV	AX, DATA[BX];ȡ����ĵ�һ��ż��
	ADD	BX, 2
	TEST AX, 01H	;��ż����
	LOOPNZ COMP 	;���ǣ��Ƚ���һ����
	JNZ	STOP		;û��ż�����˳�
	JCXZ STOP		;���һ������ż������Ϊ��Сż�����˳�
COMP1:	
	MOV	DX, DATA[BX];ȡ�������һ��ż��
	ADD	BX, 2
	TEST DX, 01H	;��ż����
	JNZ	NEXT		;���ǣ��Ƚ���һ����
	CMP	AX, DX 		;(AX)<(DX)��
	JLE	NEXT
	MOV	AX, DX		;(AX)<(DX)�����û�(AX)Ϊ��Сż��
NEXT:		
	LOOP	COMP1
STOP:		
	RET

    
    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


