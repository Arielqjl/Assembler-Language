DATAS SEGMENT
    ;此处输入数据段代码  
    num dw 14
    result dw ?
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
    
    mov ax,num
    call fib
    mov result,bx
    MOV AH,4CH
    INT 21H
    
fib proc near
	push ax
	push cx
	
	cmp ax,2
	jle less_equal_2
	cmp ax,1
	jle less_equal_1
	
	dec ax
	call fib
	mov cx,bx
	dec ax
	call fib
	add bx,cx
	
	jmp ender

less_equal_2:	
	mov bx,1
less_equal_1:	
	mov bx,1
	
ender:
	pop cx
	pop ax
	mov result,bx
	ret
	
fib endp

CODES ENDS
    END START






