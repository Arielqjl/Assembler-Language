DATAS SEGMENT
    x dw 34H
    y dw 100
    z dw 0
    w dw 3BH
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    mov ax,datas
    mov ds,ax
    ;ax = w - x
    MOV AX,w
    MOV dx,x
    sub ax,dx
    
    ;ax = ax / 5
    cwd
    mov cx,5
    idiv cx
    
    ;ax = ax * y
    mov cx,y
    imul cx
    
    ;ax = ax * 2
    mov cx,2
    imul cx
    
    ;z <- ax
    mov z,ax
    
    ;�˴��������δ���
    mov ax,4c00H
    int 21H
CODES ENDS
    END START





