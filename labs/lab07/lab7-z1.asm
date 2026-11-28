%include 'in_out.asm'

SECTION .data
    msg_x:   DB 'Введите x: ',0
    msg_a:   DB 'Введите a: ',0
    msg_res: DB 'Результат f(x): ',0

SECTION .bss
    x_buf: RESB 10
    a_buf: RESB 10
    x_num: RESD 1
    a_num: RESD 1

SECTION .text
    GLOBAL _start

_start:
    ; --- Ввод x ---
    mov eax, msg_x
    call sprint
    mov ecx, x_buf
    mov edx, 10
    call sread
    mov eax, x_buf
    call atoi        ; преобразуем строку в число
    mov [x_num], eax ; сохраняем x

    ; --- Ввод a ---
    mov eax, msg_a
    call sprint
    mov ecx, a_buf
    mov edx, 10
    call sread
    mov eax, a_buf
    call atoi        ; преобразуем строку в число
    mov [a_num], eax ; сохраняем a

    ; --- Вычисление f(x) ---
    mov eax, [x_num]
    cmp eax, [a_num] ; сравниваем x и a
    jg greater       ; если x > a, переход на метку greater

    ; --- Ветвь x <= a: f(x) = a + x ---
    mov eax, [a_num]
    add eax, [x_num]
    jmp output       ; переход к выводу

greater:
    ; --- Ветвь x > a: f(x) = a ---
    mov eax, [a_num]

output:
    ; --- Вывод результата ---
    mov edi, eax     ; сохраняем результат в edi, чтобы sprint не затёр eax
    mov eax, msg_res
    call sprint
    mov eax, edi
    call iprintLF
    call quit
