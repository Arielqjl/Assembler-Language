DATAS SEGMENT
    ;此处输入数据段代码  
    s1 dw 0
    s2 dw 0 
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    
    ; 获取 时间
    mov ah,2ch
    int 21h
    
     ;加百分秒到bx中
    mov bx,0
  	mov cx,dx
    mov ch,0
   	add bx,cx
    
    ; 加上秒*100到bx
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov s1,bx
 
    
    ; 中断
 	mov ah,01h
    int 21h
    
     ; 获取 时间
    mov ah,2ch
    int 21h
    
     ;加百分秒到bx中
    mov bx,0
  	mov cx,dx
    mov ch,0
   	add bx,cx
    
    ; 加上秒*100到bx
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov s2,bx
 	
 	mov ax,s2
 	mov bx,s1
 	sub ax,bx
 	
 	mov cx,5		;cx中保存输出数字的位数
    mov bl,10 		;bl中保存按照10进制输出
 s:
    div bl   	;余数放在ah，商放在al中
    
    mov dl,ah
    add dl,30h
    push dx
    mov bh,al
    mov al,bh
    mov ah,0
    loop s
    
    mov cx,5
t:
	pop dx
    mov ah,2h
    int 21h
    loop t
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START