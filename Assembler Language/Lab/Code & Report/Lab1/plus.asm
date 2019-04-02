DATAS SEGMENT
    x db 7
    y db 3
    ;此处输入数据段代码  
DATAS ENDS

;STACKS SEGMENT
    ;此处输入堆栈段代码
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
    
    ;此处输入代码段代码
    MOV AX,4C00H
    INT 21H
CODES ENDS
    END START



