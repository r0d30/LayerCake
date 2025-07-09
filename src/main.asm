;===============================================================================
; LayerCake Compiler - Main Entry Point
; Copyright (c) 2024-2025 LayerCake Project
; Original Creator: Rodrigue Noel (r0d30) <noel.rodrigue.7850@gmail.com>
; Licensed under MIT License with Enhanced Attribution
; 
; This file is part of the LayerCake programming language project.
; See LICENSE file in project root for full license terms.
; 
; IMPORTANT: Commercial sale of LayerCake or renamed forks is PROHIBITED.
; Attribution required for any software compiled with LayerCake.
; Contact: noel.rodrigue.7850@gmail.com for commercial licensing.
;===============================================================================

section .data
    hello db 'Hello, world!', 0xA  ; message with newline
    hello_len equ $ - hello

section .text
    global _start

_start:
    ; write(1, hello, hello_len)
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 = stdout
    mov ecx, hello      ; pointer to message
    mov edx, hello_len  ; message length
    int 0x80            ; call kernel

    ; exit(0)
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80