DATAS SEGMENT
    ;�˴��������ݶδ��� 
    xx db ' ssasdh'
    nn db ' ' 
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
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



