DATAS SEGMENT
    ;此处输入数据段代码  
	time1 dw 0
	time2 dw 0
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
    
	;获取系统时间
    mov ah,2ch
    int 21h
    
    ;1/100秒到bx
    mov bx,0
  	mov cl,dl
    mov ch,0
   	add bx,cx
    
    ;秒*100到bx，与前面错位
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov time1,bx
 
    ; 中断
 	mov ah,01h
    int 21h
    
    ;获取系统时间
    mov ah,2ch
    int 21h
    
    ;处理时间
    mov bx,0
  	mov cl,dl
    mov ch,0
   	add bx,cx
    
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov time2,bx
 	
 	;时间相减
 	mov ax,time2
 	mov bx,time1
 	sub ax,bx
 	
 	mov cx,5		;输出位数
    mov bl,10 		;10进制输出

print:
    div bl   	;余数放在ah，商放在al中
    
    mov dl,ah
    add dl,30h
    push dx
    mov bh,al
    mov al,bh
    mov ah,0
    loop print
    
    mov cx,5
exit:
	pop dx
    mov ah,2h
    int 21h
    loop exit
    
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START





