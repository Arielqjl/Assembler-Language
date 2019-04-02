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
    
    MOV	BX, 0 
	MOV	CX, 100
COMP:	
	MOV	AX, DATA[BX];取数组的第一个偶数
	ADD	BX, 2
	TEST AX, 01H	;是偶数吗？
	LOOPNZ COMP 	;不是，比较下一个数
	JNZ	STOP		;没有偶数，退出
	JCXZ STOP		;最后一个数是偶数，即为最小偶数，退出
COMP1:	
	MOV	DX, DATA[BX];取数组的下一个偶数
	ADD	BX, 2
	TEST DX, 01H	;是偶数吗？
	JNZ	NEXT		;不是，比较下一个数
	CMP	AX, DX 		;(AX)<(DX)吗？
	JLE	NEXT
	MOV	AX, DX		;(AX)<(DX)，则置换(AX)为最小偶数
NEXT:		
	LOOP	COMP1
STOP:		
	RET

    
    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


