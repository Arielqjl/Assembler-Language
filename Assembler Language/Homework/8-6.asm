DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
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
	TES AL, 08H			;查询第一个结束
	JNZ	EXIT
	TES AL, 01H			;查询第一个准备
	JZ BEGIN1
	IN AL, 26H			;输入数据并存入BUFF1
	MOV	BUFF1[DI], AL
	INC	DI
BEGIN1:		
	IN AL, 36H
	TES AL, 08H			;查询第二个否结束
	JNZ	EXIT
	TES AL, 01H			;查询第二个准备好
	JZ BEGIN
	IN AL, 38H			;输入数据并存入BUFF2
	MOV	BUFF2[SI], AL
	INC	SI
	JMP	BEGIN

    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


