org	100h			; code starts at offset 100h
jmp start ;������ ������� start
use16				; use 16-bit code

Message db 'Hello world!$' ;������ ��� ������
buff db 80,0,80 dup(0)
msg db 'Just a word!$'

start:
    mov     ah,9      ;������� � ������� ah 9
    mov     dx,Message	;������� � dx ��������� ���� DB � ��� Message
    int     21h  ;���������� ���������� 21h, ����� ���������� Message

    mov     ah,08; ����� ��������, ����� ��������� COM, ��� EXE
    int     21h ;���������, ����� �������� ����� �������� ah,08

    mov     dx,buff
    mov     ah, 0Ah ;����� ������, ���������� ������
    int     21h
    xor     cx,cx
    mov     al,[buff+1]
    mov     cl, al
    test    al, al

    call    print
    ;call    message

    mov     si,buff+2

    mov     ah,08; ����� ��������, ����� ��������� COM, ��� EXE
    int     21h ;���������, ����� �������� ����� �������� ah,08  d


    mov     ax,4C00h
    int     20h ;���������� ��������� ���� COM

print:
    mov ah, 02h
    mov dx, msg
    int 21h

message:
    mov  ah, 9
    mov  dx, msg
    int 21h
    ret