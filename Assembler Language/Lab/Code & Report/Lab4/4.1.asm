DATAS SEGMENT
    ;�˴��������ݶδ���  
    s1 dw 0
    s2 dw 0 
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
    
    ; ��ȡ ʱ��
    mov ah,2ch
    int 21h
    
     ;�Ӱٷ��뵽bx��
    mov bx,0
  	mov cx,dx
    mov ch,0
   	add bx,cx
    
    ; ������*100��bx
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov s1,bx
 
    
    ; �ж�
 	mov ah,01h
    int 21h
    
     ; ��ȡ ʱ��
    mov ah,2ch
    int 21h
    
     ;�Ӱٷ��뵽bx��
    mov bx,0
  	mov cx,dx
    mov ch,0
   	add bx,cx
    
    ; ������*100��bx
    mov al,dh
    mov dh,100
    mul dh
    add bx,ax
    
    mov s2,bx
 	
 	mov ax,s2
 	mov bx,s1
 	sub ax,bx
 	
 	mov cx,5		;cx�б���������ֵ�λ��
    mov bl,10 		;bl�б��水��10�������
 s:
    div bl   	;��������ah���̷���al��
    
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