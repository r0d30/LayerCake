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

; Include LayerCake syscall definitions and macros
%include "src/lc_syscalls.asm"

section .data
    hello db 'Hello, world!', 0xA  ; message with newline
    hello_len equ $ - hello

section .text
    global _start

_start:
    ; write(stdout, hello, hello_len) - using official architecture names
    mov syscall_num, sys_write              ; system call number for write
    mov first_param, stdout_fd              ; file descriptor for standard output
    mov second_param, hello                 ; pointer to message
    mov third_param, hello_len              ; message length
    syscall                                 ; invoke system call

    ; exit(0) - using official architecture names  
    mov syscall_num, sys_exit               ; system call number for exit
    mov first_param, EXIT_SUCCESS           ; exit code for success
    syscall
