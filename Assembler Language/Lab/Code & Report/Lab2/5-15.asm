DATA1 SEGMENT
    M dw 5,2,6,-3,10
    data dw ?;������
    adr dw ?;���ַ 
DATA1 ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATA1
START:
    MOV AX,DATA1
    MOV DS,AX
   
    lea si,M;ȡ��ַ
    mov ax,[si];ȡֵ
    mov adr,si
    
    mov cx,5
    dec cx
    add si, 2
    
    cmp ax,0
    jns abs
    neg ax
    
abs: 
	mov bx,[si]
	cmp bx,0
	JNS comp
	neg bx
	
comp:
	cmp ax,bx
    JAE getnum
    mov ax,bx
    mov adr,si
	
getnum:
	add si,2
	loop abs
	mov data,ax	 
	   
   
    MOV AX,4C00H
    INT 21H
CODES ENDS
    END START
