;===============================================================================
; LayerCake Core - System Calls and Register Definitions
; Copyright (c) 2024-2025 LayerCake Project
; Original Creator: Rodrigue Noel (r0d30) <noel.rodrigue.7850@gmail.com>
; Licensed under MIT License with Enhanced Attribution
; 
; This file provides a complete abstraction layer for Linux syscalls and
; x86-64 register naming conventions using official documentation names.
; All syscall numbers are up-to-date with Linux kernel 6.16-rc1.
;===============================================================================

;===============================================================================
; LINUX SYSTEM CALLS (x86-64) - Official Names and Numbers
;===============================================================================

; File Operations
%define SYS_READ                0       ; sys_read
%define SYS_WRITE               1       ; sys_write  
%define SYS_OPEN                2       ; sys_open
%define SYS_CLOSE               3       ; sys_close
%define SYS_STAT                4       ; sys_newstat
%define SYS_FSTAT               5       ; sys_newfstat
%define SYS_LSTAT               6       ; sys_newlstat
%define SYS_LSEEK               8       ; sys_lseek
%define SYS_CREAT               85      ; sys_creat
%define SYS_LINK                86      ; sys_link
%define SYS_UNLINK              87      ; sys_unlink
%define SYS_SYMLINK             88      ; sys_symlink
%define SYS_READLINK            89      ; sys_readlink
%define SYS_CHMOD               90      ; sys_chmod
%define SYS_FCHMOD              91      ; sys_fchmod
%define SYS_CHOWN               92      ; sys_chown
%define SYS_FCHOWN              93      ; sys_fchown
%define SYS_LCHOWN              94      ; sys_lchown
%define SYS_UMASK               95      ; sys_umask

; Advanced File Operations
%define SYS_OPENAT              257     ; sys_openat
%define SYS_MKDIRAT             258     ; sys_mkdirat
%define SYS_MKNODAT             259     ; sys_mknodat
%define SYS_FCHOWNAT            260     ; sys_fchownat
%define SYS_FUTIMESAT           261     ; sys_futimesat
%define SYS_NEWFSTATAT          262     ; sys_newfstatat
%define SYS_UNLINKAT            263     ; sys_unlinkat
%define SYS_RENAMEAT            264     ; sys_renameat
%define SYS_LINKAT              265     ; sys_linkat
%define SYS_SYMLINKAT           266     ; sys_symlinkat
%define SYS_READLINKAT          267     ; sys_readlinkat
%define SYS_FCHMODAT            268     ; sys_fchmodat
%define SYS_FACCESSAT           269     ; sys_faccessat

; Memory Management
%define SYS_BRK                 12      ; sys_brk
%define SYS_MMAP                9       ; sys_ksys_mmap_pgoff
%define SYS_MPROTECT            10      ; sys_mprotect
%define SYS_MUNMAP              11      ; sys_munmap
%define SYS_MREMAP              25      ; sys_mremap
%define SYS_MSYNC               26      ; sys_msync
%define SYS_MINCORE             27      ; sys_mincore
%define SYS_MADVISE             28      ; sys_madvise
%define SYS_MLOCK               149     ; sys_mlock
%define SYS_MUNLOCK             150     ; sys_munlock
%define SYS_MLOCKALL            151     ; sys_mlockall
%define SYS_MUNLOCKALL          152     ; sys_munlockall
%define SYS_MLOCK2              325     ; sys_mlock2

; Process Management
%define SYS_FORK                57      ; sys_fork
%define SYS_VFORK               58      ; sys_vfork
%define SYS_CLONE               56      ; sys_clone
%define SYS_CLONE3              435     ; sys_clone3
%define SYS_EXECVE              59      ; sys_execve
%define SYS_EXECVEAT            322     ; sys_execveat
%define SYS_EXIT                60      ; sys_exit
%define SYS_EXIT_GROUP          231     ; sys_exit_group
%define SYS_WAIT4               61      ; sys_wait4
%define SYS_WAITID              247     ; sys_waitid
%define SYS_WAITPID             246     ; sys_waitpid (legacy)

; Process Information
%define SYS_GETPID              39      ; sys_getpid
%define SYS_GETPPID             110     ; sys_getppid
%define SYS_GETUID              102     ; sys_getuid
%define SYS_GETEUID             107     ; sys_geteuid
%define SYS_GETGID              104     ; sys_getgid
%define SYS_GETEGID             108     ; sys_getegid
%define SYS_GETTID              186     ; sys_gettid

; Signal Management
%define SYS_KILL                62      ; sys_kill
%define SYS_TKILL               200     ; sys_tkill
%define SYS_TGKILL              234     ; sys_tgkill
%define SYS_RT_SIGACTION        13      ; sys_rt_sigaction
%define SYS_RT_SIGPROCMASK      14      ; sys_rt_sigprocmask
%define SYS_RT_SIGRETURN        15      ; sys_rt_sigreturn
%define SYS_RT_SIGPENDING       127     ; sys_rt_sigpending
%define SYS_RT_SIGTIMEDWAIT     128     ; sys_rt_sigtimedwait
%define SYS_RT_SIGQUEUEINFO     129     ; sys_rt_sigqueueinfo
%define SYS_RT_SIGSUSPEND       130     ; sys_rt_sigsuspend

; Time Management
%define SYS_TIME                201     ; sys_time
%define SYS_GETTIMEOFDAY        96      ; sys_gettimeofday
%define SYS_SETTIMEOFDAY        164     ; sys_settimeofday
%define SYS_CLOCK_GETTIME       228     ; sys_clock_gettime
%define SYS_CLOCK_SETTIME       227     ; sys_clock_settime
%define SYS_CLOCK_GETRES        229     ; sys_clock_getres
%define SYS_CLOCK_NANOSLEEP     230     ; sys_clock_nanosleep
%define SYS_NANOSLEEP           35      ; sys_nanosleep

; I/O Operations
%define SYS_READV               19      ; sys_readv
%define SYS_WRITEV              20      ; sys_writev
%define SYS_PREAD64             17      ; sys_pread64
%define SYS_PWRITE64            18      ; sys_pwrite64
%define SYS_PREADV              295     ; sys_preadv
%define SYS_PWRITEV             296     ; sys_pwritev
%define SYS_PREADV2             327     ; sys_preadv2
%define SYS_PWRITEV2            328     ; sys_pwritev2

; Polling and Events
%define SYS_POLL                7       ; sys_poll
%define SYS_PPOLL               271     ; sys_ppoll
%define SYS_SELECT              23      ; sys_select
%define SYS_PSELECT6            270     ; sys_pselect6
%define SYS_EPOLL_CREATE        213     ; sys_epoll_create
%define SYS_EPOLL_CREATE1       291     ; sys_epoll_create1
%define SYS_EPOLL_CTL           233     ; sys_epoll_ctl
%define SYS_EPOLL_WAIT          232     ; sys_epoll_wait
%define SYS_EPOLL_PWAIT         281     ; sys_epoll_pwait
%define SYS_EPOLL_PWAIT2        441     ; sys_epoll_pwait2

; System Information
%define SYS_UNAME               63      ; sys_newuname
%define SYS_SYSINFO             99      ; sys_sysinfo
%define SYS_TIMES               100     ; sys_times
%define SYS_GETRUSAGE           98      ; sys_getrusage
%define SYS_GETRLIMIT           97      ; sys_getrlimit
%define SYS_SETRLIMIT           160     ; sys_setrlimit
%define SYS_PRLIMIT64           302     ; sys_prlimit64

; Directory Operations
%define SYS_MKDIR               83      ; sys_mkdir
%define SYS_RMDIR               84      ; sys_rmdir
%define SYS_GETDENTS            78      ; sys_getdents
%define SYS_GETDENTS64          217     ; sys_getdents64
%define SYS_GETCWD              79      ; sys_getcwd
%define SYS_CHDIR               80      ; sys_chdir
%define SYS_FCHDIR              81      ; sys_fchdir

; Pipes and FIFOs
%define SYS_PIPE                22      ; sys_pipe
%define SYS_PIPE2               293     ; sys_pipe2

; Socket Operations
%define SYS_SOCKET              41      ; sys_socket
%define SYS_CONNECT             42      ; sys_connect
%define SYS_ACCEPT              43      ; sys_accept
%define SYS_ACCEPT4             288     ; sys_accept4
%define SYS_SENDTO              44      ; sys_sendto
%define SYS_RECVFROM            45      ; sys_recvfrom
%define SYS_SENDMSG             46      ; sys_sendmsg
%define SYS_RECVMSG             47      ; sys_recvmsg
%define SYS_SHUTDOWN            48      ; sys_shutdown
%define SYS_BIND                49      ; sys_bind
%define SYS_LISTEN              50      ; sys_listen
%define SYS_GETSOCKNAME         51      ; sys_getsockname
%define SYS_GETPEERNAME         52      ; sys_getpeername
%define SYS_SOCKETPAIR          53      ; sys_socketpair
%define SYS_SETSOCKOPT          54      ; sys_setsockopt
%define SYS_GETSOCKOPT          55      ; sys_getsockopt

; Advanced System Calls
%define SYS_FUTEX               202     ; sys_futex
%define SYS_FUTEX_WAITV         449     ; sys_futex_waitv
%define SYS_FUTEX_WAKE          454     ; sys_futex_wake
%define SYS_FUTEX_WAIT          455     ; sys_futex_wait
%define SYS_FUTEX_REQUEUE       456     ; sys_futex_requeue
%define SYS_GETRANDOM           318     ; sys_getrandom
%define SYS_MEMFD_CREATE        319     ; sys_memfd_create
%define SYS_MEMFD_SECRET        447     ; sys_memfd_secret

;===============================================================================
; FILE DESCRIPTORS - Standard POSIX Names
;===============================================================================

%define STDIN_FILENO            0       ; Standard input
%define STDOUT_FILENO           1       ; Standard output  
%define STDERR_FILENO           2       ; Standard error

; Legacy aliases for compatibility
%define FD_STDIN                0
%define FD_STDOUT               1
%define FD_STDERR               2

;===============================================================================
; OPEN FLAGS - Official POSIX Names
;===============================================================================

%define O_RDONLY                0       ; Read only
%define O_WRONLY                1       ; Write only
%define O_RDWR                  2       ; Read and write
%define O_CREAT                 64      ; Create file if it doesn't exist
%define O_EXCL                  128     ; Fail if file exists
%define O_NOCTTY                256     ; Don't assign controlling terminal
%define O_TRUNC                 512     ; Truncate file to zero length
%define O_APPEND                1024    ; Append to file
%define O_NONBLOCK              2048    ; Non-blocking I/O
%define O_SYNC                  4096    ; Synchronous I/O
%define O_ASYNC                 8192    ; Asynchronous I/O notification
%define O_DIRECT                16384   ; Direct I/O
%define O_LARGEFILE             32768   ; Large file support
%define O_DIRECTORY             65536   ; Must be a directory
%define O_NOFOLLOW              131072  ; Don't follow symlinks
%define O_NOATIME               262144  ; Don't update access time
%define O_CLOEXEC               524288  ; Close on exec

;===============================================================================
; MMAP FLAGS AND PROTECTION - Official Names
;===============================================================================

; Protection flags
%define PROT_NONE               0       ; No access
%define PROT_READ               1       ; Read access
%define PROT_WRITE              2       ; Write access
%define PROT_EXEC               4       ; Execute access

; Mapping flags
%define MAP_SHARED              1       ; Share changes
%define MAP_PRIVATE             2       ; Private copy-on-write
%define MAP_FIXED               16      ; Fixed address
%define MAP_ANONYMOUS           32      ; Anonymous mapping
%define MAP_ANON                32      ; Alias for MAP_ANONYMOUS
%define MAP_GROWSDOWN           256     ; Stack-like segment
%define MAP_DENYWRITE           2048    ; Deny write access
%define MAP_EXECUTABLE          4096    ; Mark as executable
%define MAP_LOCKED              8192    ; Lock pages in memory
%define MAP_NORESERVE           16384   ; Don't reserve swap space
%define MAP_POPULATE            32768   ; Populate page tables
%define MAP_NONBLOCK            65536   ; Don't block on I/O

;===============================================================================
; SIGNAL NUMBERS - POSIX Standard Names
;===============================================================================

%define SIGHUP                  1       ; Hangup
%define SIGINT                  2       ; Interrupt (Ctrl+C)
%define SIGQUIT                 3       ; Quit (Ctrl+\)
%define SIGILL                  4       ; Illegal instruction
%define SIGTRAP                 5       ; Trace/breakpoint trap
%define SIGABRT                 6       ; Abort
%define SIGBUS                  7       ; Bus error
%define SIGFPE                  8       ; Floating point exception
%define SIGKILL                 9       ; Kill (uncatchable)
%define SIGUSR1                 10      ; User-defined signal 1
%define SIGSEGV                 11      ; Segmentation violation
%define SIGUSR2                 12      ; User-defined signal 2
%define SIGPIPE                 13      ; Broken pipe
%define SIGALRM                 14      ; Alarm clock
%define SIGTERM                 15      ; Termination
%define SIGSTKFLT               16      ; Stack fault
%define SIGCHLD                 17      ; Child status changed
%define SIGCONT                 18      ; Continue
%define SIGSTOP                 19      ; Stop (uncatchable)
%define SIGTSTP                 20      ; Terminal stop (Ctrl+Z)
%define SIGTTIN                 21      ; Background read from tty
%define SIGTTOU                 22      ; Background write to tty
%define SIGURG                  23      ; Urgent condition on socket
%define SIGXCPU                 24      ; CPU limit exceeded
%define SIGXFSZ                 25      ; File size limit exceeded
%define SIGVTALRM               26      ; Virtual alarm clock
%define SIGPROF                 27      ; Profiling alarm clock
%define SIGWINCH                28      ; Window size change
%define SIGIO                   29      ; I/O now possible
%define SIGPWR                  30      ; Power failure restart
%define SIGSYS                  31      ; Bad system call

;===============================================================================
; REGISTER ALIASES - Official x86-64 Architecture Names
;===============================================================================

; Syscall Parameter Registers (System V ABI)
%define SYSCALL_NUMBER          rax     ; Syscall number
%define PARAM_1                 rdi     ; First parameter
%define PARAM_2                 rsi     ; Second parameter  
%define PARAM_3                 rdx     ; Third parameter
%define PARAM_4                 r10     ; Fourth parameter (note: r10, not rcx!)
%define PARAM_5                 r8      ; Fifth parameter
%define PARAM_6                 r9      ; Sixth parameter
%define RETURN_VALUE            rax     ; Return value from syscall

; General Purpose Registers - Official Names
%define ACCUMULATOR             rax     ; Accumulator register
%define BASE                    rbx     ; Base register
%define COUNTER                 rcx     ; Counter register
%define DATA                    rdx     ; Data register
%define SOURCE_INDEX            rsi     ; Source index register
%define DESTINATION_INDEX       rdi     ; Destination index register
%define STACK_POINTER           rsp     ; Stack pointer register
%define BASE_POINTER            rbp     ; Base pointer register

; Extended Registers (x86-64 specific)
%define REGISTER_8              r8      ; Extended register 8
%define REGISTER_9              r9      ; Extended register 9
%define REGISTER_10             r10     ; Extended register 10
%define REGISTER_11             r11     ; Extended register 11
%define REGISTER_12             r12     ; Extended register 12
%define REGISTER_13             r13     ; Extended register 13
%define REGISTER_14             r14     ; Extended register 14
%define REGISTER_15             r15     ; Extended register 15

; Flags Register
%define FLAGS_REGISTER          rflags  ; Flags register

;===============================================================================
; SUBSTITUTION MACROS - Official Architecture and System Names Only
;===============================================================================

; These macros replace numbers and cryptic names with their official documentation names.
; No "LC_" prefixes - just the real architectural and system names.

; System Call Numbers - Official Linux Names (lowercase convenience aliases)
%define sys_read                0       ; Read from file descriptor
%define sys_write               1       ; Write to file descriptor  
%define sys_open                2       ; Open file
%define sys_close               3       ; Close file descriptor
%define sys_exit                60      ; Terminate calling process

; File Descriptors - POSIX Standard Names  
%define stdin_fd                0       ; Standard input file descriptor
%define stdout_fd               1       ; Standard output file descriptor
%define stderr_fd               2       ; Standard error file descriptor

; Register Names - Intel x86-64 Official Architecture Names (lowercase convenience)
%define syscall_num             rax     ; System call number register
%define first_param             rdi     ; First parameter register
%define second_param            rsi     ; Second parameter register
%define third_param             rdx     ; Third parameter register
%define fourth_param            r10     ; Fourth parameter register (note: r10, not rcx!)
%define fifth_param             r8      ; Fifth parameter register
%define sixth_param             r9      ; Sixth parameter register
%define return_value            rax     ; Return value register

; General Purpose Registers - Intel Official Names (lowercase convenience)
%define accumulator             rax     ; Accumulator register (A register)
%define base_reg                rbx     ; Base register (B register)
%define counter                 rcx     ; Counter register (C register)
%define data_reg                rdx     ; Data register (D register)
%define source_index            rsi     ; Source index register
%define dest_index              rdi     ; Destination index register
%define stack_ptr               rsp     ; Stack pointer register
%define base_ptr                rbp     ; Base pointer register

;===============================================================================
; EXIT STATUS CODES - POSIX Standard
;===============================================================================

%define EXIT_SUCCESS            0       ; Successful termination
%define EXIT_FAILURE            1       ; General error
%define EXIT_USAGE              64      ; Command line usage error
%define EXIT_DATAERR            65      ; Data format error
%define EXIT_NOINPUT            66      ; Cannot open input
%define EXIT_NOUSER             67      ; Addressee unknown
%define EXIT_NOHOST             68      ; Host name unknown
%define EXIT_UNAVAILABLE        69      ; Service unavailable
%define EXIT_SOFTWARE           70      ; Internal software error
%define EXIT_OSERR              71      ; System error (e.g., can't fork)
%define EXIT_OSFILE             72      ; Critical OS file missing
%define EXIT_CANTCREAT          73      ; Can't create (user) output file
%define EXIT_IOERR              74      ; Input/output error
%define EXIT_TEMPFAIL           75      ; Temporary failure; user is invited to retry
%define EXIT_PROTOCOL           76      ; Remote error in protocol
%define EXIT_NOPERM             77      ; Permission denied
%define EXIT_CONFIG             78      ; Configuration error

;===============================================================================
; ADVANCED INSTRUCTION MACROS - For Performance Optimization
;===============================================================================

; String/Memory Operations Macros
%define move_string_byte        movsb   ; Move byte from [rsi] to [rdi]
%define move_string_word        movsw   ; Move word from [rsi] to [rdi]
%define move_string_dword       movsd   ; Move doubleword from [rsi] to [rdi]
%define move_string_qword       movsq   ; Move quadword from [rsi] to [rdi]
%define store_string_byte       stosb   ; Store AL to [rdi]
%define store_string_word       stosw   ; Store AX to [rdi]
%define store_string_dword      stosd   ; Store EAX to [rdi]
%define store_string_qword      stosq   ; Store RAX to [rdi]
%define load_string_byte        lodsb   ; Load [rsi] to AL
%define load_string_word        lodsw   ; Load [rsi] to AX
%define load_string_dword       lodsd   ; Load [rsi] to EAX
%define load_string_qword       lodsq   ; Load [rsi] to RAX
%define scan_string_byte        scasb   ; Compare AL with [rdi]
%define scan_string_word        scasw   ; Compare AX with [rdi]
%define scan_string_dword       scasd   ; Compare EAX with [rdi]
%define scan_string_qword       scasq   ; Compare RAX with [rdi]
%define compare_string_byte     cmpsb   ; Compare [rsi] with [rdi] (byte)
%define compare_string_word     cmpsw   ; Compare [rsi] with [rdi] (word)
%define compare_string_dword    cmpsd   ; Compare [rsi] with [rdi] (dword)
%define compare_string_qword    cmpsq   ; Compare [rsi] with [rdi] (qword)

; Repeat Prefixes
%define repeat                  rep     ; Repeat while RCX != 0
%define repeat_equal            repe    ; Repeat while ZF=1 and RCX != 0
%define repeat_zero             repz    ; Alias for repe
%define repeat_not_equal        repne   ; Repeat while ZF=0 and RCX != 0
%define repeat_not_zero         repnz   ; Alias for repne

; Bit Manipulation
%define bit_scan_forward        bsf     ; Bit scan forward
%define bit_scan_reverse        bsr     ; Bit scan reverse
%define bit_test                bt      ; Bit test
%define bit_test_and_set        bts     ; Bit test and set
%define bit_test_and_reset      btr     ; Bit test and reset
%define bit_test_and_complement btc     ; Bit test and complement
%define leading_zero_count      lzcnt   ; Leading zero count
%define trailing_zero_count     tzcnt   ; Trailing zero count
%define population_count        popcnt  ; Population count (number of 1 bits)

; Advanced Arithmetic
%define increment               inc     ; Increment by 1
%define decrement               dec     ; Decrement by 1
%define negate                  neg     ; Two's complement negation
%define sign_extend_byte        movsx   ; Sign extend byte to register
%define sign_extend_word        movsx   ; Sign extend word to register
%define sign_extend_dword       movsxd  ; Sign extend dword to qword
%define zero_extend_byte        movzx   ; Zero extend byte to register
%define zero_extend_word        movzx   ; Zero extend word to register

; Logical Operations
%define logical_and             and     ; Bitwise AND
%define logical_or              or      ; Bitwise OR
%define logical_xor             xor     ; Bitwise XOR
%define logical_not             not     ; Bitwise NOT (one's complement)
%define shift_left              shl     ; Shift left (logical)
%define shift_right_logical     shr     ; Shift right (logical)
%define shift_right_arithmetic  sar     ; Shift right (arithmetic)
%define rotate_left             rol     ; Rotate left
%define rotate_right            ror     ; Rotate right
%define rotate_left_carry       rcl     ; Rotate left through carry
%define rotate_right_carry      rcr     ; Rotate right through carry

;===============================================================================
; END OF FILE
;===============================================================================
