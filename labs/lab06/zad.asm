
%include 'in_out.asm'
SECTION .data
div: DB 'Выражение: y = 10 + (31x -5) ',0
msg: DB 'Введите x: ', 0
rem: DB 'Результат: ',0
SECTION .bss
x resb 10
result resd 1
SECTION .text
GLOBAL _start
_start:
mov eax, div 
call sprintLF
mov eax, msg 
call sprint 
mov ecx, x 
mov edx, 10
call sread 
mov eax, x 
call atoi 
mov ebx , 31
imul eax, ebx
sub eax , 5  
add eax , 10 
mov edi, eax
mov eax, rem
call sprint 
mov eax, edi
call iprintLF
call quit
