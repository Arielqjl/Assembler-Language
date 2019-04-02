DATAS SEGMENT
    store db 4 dup(?)
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
    
    MOV	CL, 4;右移四次
	MOV	CH, 4;循环四次
	LEA BX, STORE
A10:
	MOV	DX, AX
	AND	DX, 0FH 	;取AX的低四位
	MOV	[BX], DL 	;低四位存入STORE中
	INC	BX
	SHR	AX, CL		;右移四次
	DEC	CH
	JNZ	A10			;循环四次完了码？
B10:
	MOV	DL, STORE	;四组数分别放在AL、BL、CL和DL中
	MOV	CL, STORE+1
	MOV	BL, STORE+2
	MOV	AL, STORE+3

    
    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

