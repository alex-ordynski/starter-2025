; =============================================================================
; A simple "Hello, agent!" program for 64-bit Linux
; Author: Architect
; Mission: Protocol "Awakening"
; =============================================================================

section .data
    ; -- Our message to be printed
    msg db 'Hello, agent! Welcome to the system.', 0xa  ; 0xa is the newline character
    ; -- Calculate the length of our message
    len equ $ - msg

section .text
    global _start       ; This is the entry point of our program

_start:
    ; --- Syscall to write our message to the console (stdout) ---
    ; rax: syscall number (1 for 'write')
    ; rdi: file descriptor (1 for stdout)
    ; rsi: pointer to the message
    ; rdx: length of the message

    mov rax, 1          ; syscall for write
    mov rdi, 1          ; stdout
    mov rsi, msg        ; our message
    mov rdx, len        ; its length
    syscall             ; Execute the system call

    ; --- Syscall to exit the program gracefully ---
    ; rax: syscall number (60 for 'exit')
    ; rdi: exit code (0 for success)

    mov rax, 60         ; syscall for exit
    mov rdi, 0          ; exit code 0 (success)
    syscall             ; Execute the system call
