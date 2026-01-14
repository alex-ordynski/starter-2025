; Програма, що виводить "Hello, world!" на екран,
; використовуючи 32-бітні системні виклики Linux.

section .data
    msg db 'Hello, world!', 0xa  ; Рядок для виводу. 0xa - це символ нового рядка (newline).
    len equ $ - msg             ; Директива EQU для обчислення довжини рядка.

section .text
    global _start               ; Оголошуємо _start глобальною точкою входу.

_start:
    ; --- Системний виклик sys_write (номер 4) ---
    ; ssize_t write(int fd, const void *buf, size_t count);
    mov eax, 4                  ; Номер системного виклику sys_write.
    mov ebx, 1                  ; Файловий дескриптор 1 (стандартний вивід, stdout).
    mov ecx, msg                ; Вказівник на початок нашого повідомлення.
    mov edx, len                ; Довжина повідомлення.
    int 0x80                    ; Виклик ядра операційної системи.

    ; --- Системний виклик sys_exit (номер 1) ---
    ; void _exit(int status);
    mov eax, 1                  ; Номер системного виклику sys_exit.
    mov ebx, 0                  ; Код завершення 0 (успіх).
    int 0x80                    ; Виклик ядра.
