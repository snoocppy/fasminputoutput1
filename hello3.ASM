format MZ			;����������� ���� DOS EXE (MZ EXE)
entry code_seg:start		;����� ����� � ���������
stack 200h

segment data_seg		;C������ ������
    hello db 'Hello, asmworld!$'    ;������
segment code_seg
start:
    ;write your code here
    
    mov ah,09
    mov dx,hello
    int 21h
    
    mov ah,08
    int 21h
    
    xor eax, eax
    ret