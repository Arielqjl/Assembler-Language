DATAS SEGMENT
    ;�˴��������ݶδ��� 
    buffer db 10 dup(?) 
    passw  db 7,5,9,1,3,6,8,0,2,4
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
main proc far
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    
    mov si,0
    lea bx,passw

loop1:
	mov ah,01h
	int 21h
	cmp al,0dh
	jz exit
	sub al,48
	jb loop1
	cmp al,09h
	ja loop1
	xlat
	mov buffer[si],al
	inc si
	loop loop1

exit:
    MOV AH,4CH
    INT 21H
main endp
CODES ENDS
    END START

