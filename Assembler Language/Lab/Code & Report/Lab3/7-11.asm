DATAS SEGMENT
    ;此处输入数据段代码 
    xx db ' ssasdh'
    nn db ' ' 
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    INT 21H
    if nn-xx GT 5
    	rept 10
    		add ax,ax
    	endm
    endif
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START



