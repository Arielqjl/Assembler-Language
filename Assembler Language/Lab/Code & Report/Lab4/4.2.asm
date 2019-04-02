DATAS SEGMENT
    ;此处输入数据段代码  
    m db 0
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
 
main proc far
	push ds
	mov ax,0
	push ax
	
	mov al,1ch
	mov ah,35h
	int 21h
	
	push es
	push bx
	
	mov dx,offset count
	mov ax,seg count
	mov ds,ax
	mov al,1ch
	mov ah,25h
	int 21h
	
	mov ax,DATAS
	mov ds,ax
	
	int 1ch
	int 1ch
	int 1ch
	int 1ch
	
	pop dx
	pop ds
	mov al,1ch
	mov ah,25h
	
	int 21h
	ret
	main endp
count :
	inc M
 	iret
	 
    INT 21H
CODES ENDS
    END START

