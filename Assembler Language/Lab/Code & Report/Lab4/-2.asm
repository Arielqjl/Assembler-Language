DATAS SEGMENT
    ;�˴��������ݶδ���
    m dw 0  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    push ds
    mov ax,0
    push ax
    
    mov al,1ch
    mov ah,35h
    int 21h
    
    push es
    push bx
    mov ax,seg count
    mov ds,ax
    mov dx,offset count
    mov al,1ch
    mov ah,25h
    int 21h
    
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    
    int 1ch
    int 1ch
    int 1ch
    
    pop dx
    pop ds
    mov al,1ch
    mov ah,25h
    int 21h 
    
    MOV AH,4CH
    INT 21H
    
count proc near
    inc m
    iret
count endp
    
    
CODES ENDS
    END START



