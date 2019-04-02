DATAS SEGMENT
    num db 5 dup(0)
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
menu:
	mov ah,01h
	int 21h
	cmp al,'1'
	jz n1
	cmp al,'2'
	jz n2
	cmp al,'3'
	jz n3
	cmp al,'4'
	jz n4
	cmp al,'5'
	jz n5
	jmp exit
	
n1:
	mov cl,num
	inc cl
	mov num[0], cl
	jmp menu
n2:
	MOV BX,1
	MOV CL,NUM[BX]
	inc cl
	mov num[bx], cl
	jmp menu
n3:
	MOV BX,2
	MOV CL,NUM[BX]
	inc cl
	mov num[bx], cl
	jmp menu
n4:
	MOV BX,3
	MOV CL,NUM[BX]
	inc cl
	mov num[bx], cl
	jmp menu
n5:
	MOV BX,4
	MOV CL,NUM[BX]
	inc cl
	mov num[bx], cl
	jmp menu
	
exit:
	mov dl,num[0]
	add dl,30h
	mov ah,02
	int 21h
	mov dl,num[1]
	add dl,30h
	mov ah,02
	int 21h
	mov dl,num[2]
	add dl,30h
	mov ah,02
	int 21h
	mov dl,num[3]
	add dl,30h
	mov ah,02
	int 21h
	mov dl,num[4]
	add dl,30h
	mov ah,02
	int 21h
	mov dl,num[5]
	add dl,30h
	mov ah,02
	int 21h
	    
    MOV AH,01H
    INT 21H
CODES ENDS
    END START




