format MZ			;����������� ���� DOS EXE (MZ EXE)
entry code_seg:start		;����� ����� � ���������
stack 200h			;������ ����� 
;--------------------------------------------------------------------
segment data_seg		;C������ ������
    hello db 'Hello, asmworld!$'    ;������
    NL db 0Ah, 0Dh, '$'
    buff db 255,0,256 dup(0)
    A db 'A$'
    k db 0
;--------------------------------------------------------------------
segment code_seg		;������� ����
start:				;����� ����� � ���������
    mov ax,data_seg		;������������� �������� DS
    mov ds,ax

    mov dx,buff
    mov ah, 0Ah 		;���������� ������
    int 21h

    xor cx,cx
    mov al,[buff+1]
    mov cl,al
    test al,al
    jz Exit

    mov ah,09
    mov dx,NL
    mov si,dx
    int 21h

    mov ah,09		       ;����� ������
    mov dx,buff
    int 21h
    mov si,buff+2

    call Cycle

    mov ah,09
    mov dx,hello;����� ������ Hello, asmworld!$
    mov si,dx
    int 21h



Cycle:
    mov dl,[si]
    cmp dl,' '
    jne Print2
    jmp Print

Print2:
    mov ah,02h
    int 21h

Print:
    jne Space
    jmp Print2

Space:
    inc si
    loop Cycle

Exit:
    mov ah,8h			;�������� ��������� ����� ����������� ���������
    int 21h

    mov ax,4C00h
    int 21h			;���������� ���������
