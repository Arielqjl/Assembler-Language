DATAS SEGMENT
    ;�˴��������ݶδ���  
	time1 dw 0
	time2 dw 0
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:  
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    
	;��ȡϵͳʱ��
    mov ah,2ch
    int 21h
    
    ;1/100�뵽bx
    mov bx,0
  	mov cl,dl
    mov ch,0
   	add bx,cx
    
    ;��*100��bx����ǰ���λ
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov time1,bx
 
    ; �ж�
 	mov ah,01h
    int 21h
    
    ;��ȡϵͳʱ��
    mov ah,2ch
    int 21h
    
    ;����ʱ��
    mov bx,0
  	mov cl,dl
    mov ch,0
   	add bx,cx
    
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov time2,bx
 	
 	;ʱ�����
 	mov ax,time2
 	mov bx,time1
 	sub ax,bx
 	
 	mov cx,5		;���λ��
    mov bl,10 		;10�������

print:
    div bl   	;��������ah���̷���al��
    
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





