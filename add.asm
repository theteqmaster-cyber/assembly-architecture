section .data
    msg1 db "Enter first number: "
    len1 equ $ - msg1

    msg2 db "Enter second number: "
    len2 equ $ - msg2

    result_msg db "Sum is: "
    result_len equ $ - result_msg

section .bss
    num1 resb 2
    num2 resb 2
    sum  resb 2

section .text
    global _start

_start:
    ; Ask for first number
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, len1
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 2
    syscall

    ; Ask for second number
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 2
    syscall

    ; Convert ASCII → number
    mov al, [num1]
    sub al, '0'

    mov bl, [num2]
    sub bl, '0'

    ; Add numbers
    add al, bl
    add al, '0'
    mov [sum], al

    ; Print result
    mov rax, 1
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, result_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, sum
    mov rdx, 1
    syscall

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall
