DATAS SEGMENT
    x db 7
    y db 3
    ;�˴��������ݶδ���  
DATAS ENDS

;STACKS SEGMENT
    ;�˴������ջ�δ���
;STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS;,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
    ;bl = x;cl = y
    mov bl,x
    mov cl,y
    
    ;ax = bl
    mov ax,bx
    
    ;ax = ax / cl = bl / cl
    idiv cl
    
    ;ax = ax * 2
    add ax,ax
    
    ;dx = ax
    mov dl,al
    
    ;�˴��������δ���
    MOV AX,4C00H
    INT 21H
CODES ENDS
    END START



