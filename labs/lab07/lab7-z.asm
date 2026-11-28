%include 'in_out.asm'

SECTION .data
    msg_out: DB 'Наименьшее число: ',0
    ; Задаем значения переменных для варианта 9
    a: DD 24
    b: DD 98
    c: DD 15

SECTION .bss
    min_num: RESD 1

SECTION .text
    GLOBAL _start

_start:
    ; --- Предполагаем, что min = a ---
    mov eax, [a]
    mov [min_num], eax

    ; --- Сравниваем с b ---
    mov eax, [b]
    cmp eax, [min_num]
    jge check_c      ; если b >= min, переходим к проверке c
    mov [min_num], eax ; иначе min = b

check_c:
    ; --- Сравниваем с c ---
    mov eax, [c]
    cmp eax, [min_num]
    jge output       ; если c >= min, переходим к выводу
    mov [min_num], eax ; иначе min = c

output:
    ; --- Вывод результата ---
    mov eax, msg_out
    call sprint
    mov eax, [min_num]
    call iprintLF
    call quit
