DATAS SEGMENT
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
MAIN PROC FAR
    MOV AX,DATAS
    MOV DS,AX
    
START:		
	PUSH DS				
	SUB	AX, AX
	PUSH AX
	MOV	AX, DSEG
	MOV	DS, AX			
BEGIN:		
	MOV	CX, 100H		
	MOV	SI, 0
NEXT:		
	MOV	DX, 0
	MOV	AX, TABLE [SI]
COMP:		
	CMP	TABLE [SI], AX	;����һ�����ĳ��ִ���
	JNE	ADDR
	INC	DX
	ADD	SI, 2
	LOOP COMP
ADDR:		
	CMP	DX, COUNT		
	JLE	DONE
	MOV	COUNT, DX		
	MOV	DATA, AX		
DONE:		
	LOOP NEXT			
	MOV	CX, COUNT		
	MOV	AX, DATA		
	RET

    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

