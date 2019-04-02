DATAS SEGMENT
    ;此处输入数据段代码  
    score dw 76,69,84,90,73,88,99,63,100,80
    s6 dw 0
    s7 dw 0
    s8 dw 0
    s9 dw 0
    s10 dw 0
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
	main proc far
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    
begin:
	mov cx,10
	call count
	ret
main endp

count proc near
	mov si,0
next:
	mov ax,score[si]
	mov bx,10
	div bl
	mov bl,al
	sub bx,6
	sal bx,1
	inc s6[bx]
	add si,2
	loop next
	ret
count endp
    
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


