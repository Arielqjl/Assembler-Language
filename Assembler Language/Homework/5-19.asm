DATAS SEGMENT
    A dw 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28
    B dw 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
    cc dw 15 dup(?)
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
    mov si,0
    mov bx,0
    mov cx,15
   
loop1:
	push cx
	mov cx,20
	mov di,0
	mov ax,A[si]
    
loop2:
	cmp B[di],ax
	JNZ continue
	mov cc[bx],ax;相等的时候move
	add bx,2
	
continue:
	add di,2
	loop loop2
	add si,2
	pop cx
	loop loop1
	
	
    
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START










