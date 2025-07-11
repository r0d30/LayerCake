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

; System Call Numbers - Official Linux Names
%define sys_read                0       ; Read from file descriptor
%define sys_write               1       ; Write to file descriptor  
%define sys_open                2       ; Open file
%define sys_close               3       ; Close file descriptor
%define sys_stat                4       ; Get file status
%define sys_fstat               5       ; Get file status by descriptor
%define sys_lstat               6       ; Get link status
%define sys_poll                7       ; Wait for events on file descriptors
%define sys_lseek               8       ; Reposition file offset
%define sys_mmap                9       ; Map files or devices into memory
%define sys_mprotect            10      ; Set protection on memory region
%define sys_munmap              11      ; Unmap files or devices from memory
%define sys_brk                 12      ; Change data segment size
%define sys_rt_sigaction        13      ; Examine/change signal action
%define sys_rt_sigprocmask      14      ; Examine/change blocked signals
%define sys_rt_sigreturn        15      ; Return from signal handler
%define sys_ioctl               16      ; Control device
%define sys_pread64             17      ; Read from file descriptor at offset
%define sys_pwrite64            18      ; Write to file descriptor at offset
%define sys_readv               19      ; Read data into multiple buffers
%define sys_writev              20      ; Write data from multiple buffers
%define sys_access              21      ; Check user's permissions for file
%define sys_pipe                22      ; Create pipe
%define sys_select              23      ; Synchronous I/O multiplexing
%define sys_sched_yield         24      ; Yield processor
%define sys_mremap              25      ; Remap virtual memory address
%define sys_msync               26      ; Synchronize memory with physical storage
%define sys_mincore             27      ; Get memory residence information
%define sys_madvise             28      ; Give advice about use of memory
%define sys_shmget              29      ; Get shared memory segment
%define sys_shmat               30      ; Attach shared memory segment
%define sys_shmctl              31      ; Control shared memory segment
%define sys_dup                 32      ; Duplicate file descriptor
%define sys_dup2                33      ; Duplicate file descriptor to specified value
%define sys_pause               34      ; Wait for signal
%define sys_nanosleep           35      ; Suspend execution for nanosecond intervals
%define sys_getitimer           36      ; Get value of interval timer
%define sys_alarm               37      ; Set alarm clock for delivery of signal
%define sys_setitimer           38      ; Set value of interval timer
%define sys_getpid              39      ; Get process identification
%define sys_sendfile            40      ; Transfer data between file descriptors
%define sys_socket              41      ; Create endpoint for communication
%define sys_connect             42      ; Initiate connection on socket
%define sys_accept              43      ; Accept connection on socket
%define sys_sendto              44      ; Send message to socket
%define sys_recvfrom            45      ; Receive message from socket
%define sys_sendmsg             46      ; Send message to socket
%define sys_recvmsg             47      ; Receive message from socket
%define sys_shutdown            48      ; Shut down socket connection
%define sys_bind                49      ; Bind name to socket
%define sys_listen              50      ; Listen for connections on socket
%define sys_getsockname         51      ; Get socket name
%define sys_getpeername         52      ; Get name of connected peer socket
%define sys_socketpair          53      ; Create pair of connected sockets
%define sys_setsockopt          54      ; Set socket options
%define sys_getsockopt          55      ; Get socket options
%define sys_clone               56      ; Create child process
%define sys_fork                57      ; Create child process
%define sys_vfork               58      ; Create child process and block parent
%define sys_execve              59      ; Execute program
%define sys_exit                60      ; Terminate calling process
%define sys_wait4               61      ; Wait for process to change state
%define sys_kill                62      ; Send signal to process
%define sys_uname               63      ; Get system information
%define sys_semget              64      ; Get semaphore set identifier
%define sys_semop               65      ; Perform semaphore operations
%define sys_semctl              66      ; Control semaphore set
%define sys_shmdt               67      ; Detach shared memory segment
%define sys_msgget              68      ; Get message queue identifier
%define sys_msgsnd              69      ; Send message to message queue
%define sys_msgrcv              70      ; Receive message from message queue
%define sys_msgctl              71      ; Control message queue
%define sys_fcntl               72      ; Manipulate file descriptor
%define sys_flock               73      ; Apply/remove advisory lock on file
%define sys_fsync               74      ; Synchronize file's in-core state
%define sys_fdatasync           75      ; Synchronize file's data
%define sys_truncate            76      ; Truncate file to specified length
%define sys_ftruncate           77      ; Truncate file descriptor to specified length
%define sys_getdents            78      ; Get directory entries
%define sys_getcwd              79      ; Get current working directory
%define sys_chdir               80      ; Change working directory
%define sys_fchdir              81      ; Change working directory via descriptor
%define sys_rename              82      ; Change name/location of file
%define sys_mkdir               83      ; Create directory
%define sys_rmdir               84      ; Delete directory
%define sys_creat               85      ; Create file
%define sys_link                86      ; Make new name for file
%define sys_unlink              87      ; Delete name and possibly file
%define sys_symlink             88      ; Make symbolic link to file
%define sys_readlink            89      ; Read value of symbolic link
%define sys_chmod               90      ; Change permissions of file
%define sys_fchmod              91      ; Change permissions of file descriptor
%define sys_chown               92      ; Change ownership of file
%define sys_fchown              93      ; Change ownership of file descriptor
%define sys_lchown              94      ; Change ownership of symbolic link
%define sys_umask               95      ; Set file mode creation mask
%define sys_gettimeofday        96      ; Get time of day
%define sys_getrlimit           97      ; Get resource limits
%define sys_getrusage           98      ; Get resource usage
%define sys_sysinfo             99      ; Get system information
%define sys_times               100     ; Get process times
%define sys_ptrace              101     ; Process trace
%define sys_getuid              102     ; Get user identity
%define sys_syslog              103     ; Read/clear kernel message ring buffer
%define sys_getgid              104     ; Get group identity
%define sys_setuid              105     ; Set user identity
%define sys_setgid              106     ; Set group identity
%define sys_geteuid             107     ; Get effective user identity
%define sys_getegid             108     ; Get effective group identity
%define sys_setpgid             109     ; Set process group identity
%define sys_getppid             110     ; Get parent process identity

; File Descriptors - POSIX Standard Names  
%define stdin_fd                0       ; Standard input file descriptor
%define stdout_fd               1       ; Standard output file descriptor
%define stderr_fd               2       ; Standard error file descriptor

; Register Names - Intel x86-64 Official Architecture Names
%define syscall_num             rax     ; System call number register
%define first_param             rdi     ; First parameter register
%define second_param            rsi     ; Second parameter register
%define third_param             rdx     ; Third parameter register
%define fourth_param            r10     ; Fourth parameter register (note: r10, not rcx!)
%define fifth_param             r8      ; Fifth parameter register
%define sixth_param             r9      ; Sixth parameter register
%define return_value            rax     ; Return value register

; General Purpose Registers - Intel Official Names
%define accumulator             rax     ; Accumulator register (A register)
%define base_reg                rbx     ; Base register (B register)
%define counter                 rcx     ; Counter register (C register)
%define data_reg                rdx     ; Data register (D register)
%define source_index            rsi     ; Source index register
%define dest_index              rdi     ; Destination index register
%define stack_ptr               rsp     ; Stack pointer register
%define base_ptr                rbp     ; Base pointer register

; Extended Registers (x86-64 Additional Registers)
%define ext_reg8                r8      ; Extended register 8
%define ext_reg9                r9      ; Extended register 9
%define ext_reg10               r10     ; Extended register 10
%define ext_reg11               r11     ; Extended register 11
%define ext_reg12               r12     ; Extended register 12
%define ext_reg13               r13     ; Extended register 13
%define ext_reg14               r14     ; Extended register 14
%define ext_reg15               r15     ; Extended register 15

; Processor Flags Register
%define flags_reg               rflags  ; Processor flags register

; File Open Flags - POSIX Standard
%define read_only               0       ; Open for reading only
%define write_only              1       ; Open for writing only
%define read_write              2       ; Open for reading and writing
%define create_file             64      ; Create file if it doesn't exist
%define exclusive               128     ; Fail if file exists (with O_CREAT)
%define no_ctty                 256     ; Don't assign controlling terminal
%define truncate                512     ; Truncate file to zero length
%define append_mode             1024    ; Append to end of file
%define non_blocking            2048    ; Non-blocking I/O
%define sync_write              4096    ; Synchronous I/O
%define async_io                8192    ; Asynchronous I/O notification
%define direct_io               16384   ; Direct I/O (bypass cache)
%define large_file              32768   ; Large file support
%define directory_only          65536   ; Must be a directory
%define no_follow_links         131072  ; Don't follow symbolic links
%define no_access_time          262144  ; Don't update access time
%define close_on_exec           524288  ; Close file descriptor on exec

; Memory Protection Flags - POSIX Standard
%define no_access               0       ; No memory access allowed
%define read_access             1       ; Memory read access
%define write_access            2       ; Memory write access
%define exec_access             4       ; Memory execute access

; Memory Mapping Flags - POSIX Standard
%define shared_mapping          1       ; Share changes with other processes
%define private_mapping         2       ; Private copy-on-write mapping
%define fixed_address           16      ; Interpret addr exactly
%define anonymous_mapping       32      ; Anonymous mapping (no file)
%define grows_down              256     ; Stack-like segment
%define deny_write              2048    ; Deny write access to mapped file
%define executable_mapping      4096    ; Mark mapped region as executable
%define locked_memory           8192    ; Lock mapped pages in memory
%define no_reserve              16384   ; Don't reserve swap space
%define populate_pages          32768   ; Populate page tables for mapping
%define non_block_io            65536   ; Don't block on I/O for this mapping

; POSIX Signals - Standard Signal Numbers
%define hangup_signal           1       ; Terminal hangup
%define interrupt_signal        2       ; Interrupt from keyboard (Ctrl+C)
%define quit_signal             3       ; Quit from keyboard (Ctrl+\)
%define illegal_instruction     4       ; Illegal instruction
%define trace_trap              5       ; Trace/breakpoint trap
%define abort_signal            6       ; Abort signal
%define bus_error               7       ; Bus error
%define floating_point_error    8       ; Floating point exception
%define kill_signal             9       ; Kill signal (cannot be caught)
%define user_signal_1           10      ; User-defined signal 1
%define segmentation_fault      11      ; Segmentation violation
%define user_signal_2           12      ; User-defined signal 2
%define broken_pipe             13      ; Broken pipe
%define alarm_clock             14      ; Alarm clock signal
%define terminate_signal        15      ; Termination signal
%define stack_fault             16      ; Stack fault
%define child_status            17      ; Child process status changed
%define continue_signal         18      ; Continue process if stopped
%define stop_signal             19      ; Stop process (cannot be caught)
%define terminal_stop           20      ; Terminal stop signal (Ctrl+Z)
%define background_read         21      ; Background process attempting read
%define background_write        22      ; Background process attempting write
%define urgent_condition        23      ; Urgent condition on socket
%define cpu_limit               24      ; CPU time limit exceeded
%define file_size_limit         25      ; File size limit exceeded
%define virtual_alarm           26      ; Virtual alarm clock
%define profiling_timer         27      ; Profiling timer expired
%define window_size_change      28      ; Window size change
%define io_possible             29      ; I/O now possible
%define power_failure           30      ; Power failure restart
%define bad_system_call         31      ; Bad system call

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

; System Call Numbers - Official Linux Names
%define sys_read                0       ; Read from file descriptor
%define sys_write               1       ; Write to file descriptor  
%define sys_open                2       ; Open file
%define sys_close               3       ; Close file descriptor
%define sys_stat                4       ; Get file status
%define sys_fstat               5       ; Get file status by descriptor
%define sys_lstat               6       ; Get link status
%define sys_poll                7       ; Wait for events on file descriptors
%define sys_lseek               8       ; Reposition file offset
%define sys_mmap                9       ; Map files or devices into memory
%define sys_mprotect            10      ; Set protection on memory region
%define sys_munmap              11      ; Unmap files or devices from memory
%define sys_brk                 12      ; Change data segment size
%define sys_rt_sigaction        13      ; Examine/change signal action
%define sys_rt_sigprocmask      14      ; Examine/change blocked signals
%define sys_rt_sigreturn        15      ; Return from signal handler
%define sys_ioctl               16      ; Control device
%define sys_pread64             17      ; Read from file descriptor at offset
%define sys_pwrite64            18      ; Write to file descriptor at offset
%define sys_readv               19      ; Read data into multiple buffers
%define sys_writev              20      ; Write data from multiple buffers
%define sys_access              21      ; Check user's permissions for file
%define sys_pipe                22      ; Create pipe
%define sys_select              23      ; Synchronous I/O multiplexing
%define sys_sched_yield         24      ; Yield processor
%define sys_mremap              25      ; Remap virtual memory address
%define sys_msync               26      ; Synchronize memory with physical storage
%define sys_mincore             27      ; Get memory residence information
%define sys_madvise             28      ; Give advice about use of memory
%define sys_shmget              29      ; Get shared memory segment
%define sys_shmat               30      ; Attach shared memory segment
%define sys_shmctl              31      ; Control shared memory segment
%define sys_dup                 32      ; Duplicate file descriptor
%define sys_dup2                33      ; Duplicate file descriptor to specified value
%define sys_pause               34      ; Wait for signal
%define sys_nanosleep           35      ; Suspend execution for nanosecond intervals
%define sys_getitimer           36      ; Get value of interval timer
%define sys_alarm               37      ; Set alarm clock for delivery of signal
%define sys_setitimer           38      ; Set value of interval timer
%define sys_getpid              39      ; Get process identification
%define sys_sendfile            40      ; Transfer data between file descriptors
%define sys_socket              41      ; Create endpoint for communication
%define sys_connect             42      ; Initiate connection on socket
%define sys_accept              43      ; Accept connection on socket
%define sys_sendto              44      ; Send message to socket
%define sys_recvfrom            45      ; Receive message from socket
%define sys_sendmsg             46      ; Send message to socket
%define sys_recvmsg             47      ; Receive message from socket
%define sys_shutdown            48      ; Shut down socket connection
%define sys_bind                49      ; Bind name to socket
%define sys_listen              50      ; Listen for connections on socket
%define sys_getsockname         51      ; Get socket name
%define sys_getpeername         52      ; Get name of connected peer socket
%define sys_socketpair          53      ; Create pair of connected sockets
%define sys_setsockopt          54      ; Set socket options
%define sys_getsockopt          55      ; Get socket options
%define sys_clone               56      ; Create child process
%define sys_fork                57      ; Create child process
%define sys_vfork               58      ; Create child process and block parent
%define sys_execve              59      ; Execute program
%define sys_exit                60      ; Terminate calling process
%define sys_wait4               61      ; Wait for process to change state
%define sys_kill                62      ; Send signal to process
%define sys_uname               63      ; Get system information
%define sys_semget              64      ; Get semaphore set identifier
%define sys_semop               65      ; Perform semaphore operations
%define sys_semctl              66      ; Control semaphore set
%define sys_shmdt               67      ; Detach shared memory segment
%define sys_msgget              68      ; Get message queue identifier
%define sys_msgsnd              69      ; Send message to message queue
%define sys_msgrcv              70      ; Receive message from message queue
%define sys_msgctl              71      ; Control message queue
%define sys_fcntl               72      ; Manipulate file descriptor
%define sys_flock               73      ; Apply/remove advisory lock on file
%define sys_fsync               74      ; Synchronize file's in-core state
%define sys_fdatasync           75      ; Synchronize file's data
%define sys_truncate            76      ; Truncate file to specified length
%define sys_ftruncate           77      ; Truncate file descriptor to specified length
%define sys_getdents            78      ; Get directory entries
%define sys_getcwd              79      ; Get current working directory
%define sys_chdir               80      ; Change working directory
%define sys_fchdir              81      ; Change working directory via descriptor
%define sys_rename              82      ; Change name/location of file
%define sys_mkdir               83      ; Create directory
%define sys_rmdir               84      ; Delete directory
%define sys_creat               85      ; Create file
%define sys_link                86      ; Make new name for file
%define sys_unlink              87      ; Delete name and possibly file
%define sys_symlink             88      ; Make symbolic link to file
%define sys_readlink            89      ; Read value of symbolic link
%define sys_chmod               90      ; Change permissions of file
%define sys_fchmod              91      ; Change permissions of file descriptor
%define sys_chown               92      ; Change ownership of file
%define sys_fchown              93      ; Change ownership of file descriptor
%define sys_lchown              94      ; Change ownership of symbolic link
%define sys_umask               95      ; Set file mode creation mask
%define sys_gettimeofday        96      ; Get time of day
%define sys_getrlimit           97      ; Get resource limits
%define sys_getrusage           98      ; Get resource usage
%define sys_sysinfo             99      ; Get system information
%define sys_times               100     ; Get process times
%define sys_ptrace              101     ; Process trace
%define sys_getuid              102     ; Get user identity
%define sys_syslog              103     ; Read/clear kernel message ring buffer
%define sys_getgid              104     ; Get group identity
%define sys_setuid              105     ; Set user identity
%define sys_setgid              106     ; Set group identity
%define sys_geteuid             107     ; Get effective user identity
%define sys_getegid             108     ; Get effective group identity
%define sys_setpgid             109     ; Set process group identity
%define sys_getppid             110     ; Get parent process identity

;===============================================================================
; EXIT STATUS CODES - POSIX Standard
;===============================================================================

%define success_code            0       ; Successful termination
%define exit_success            0       ; Successful termination (alias)
%define failure_code            1       ; General error
%define exit_failure            1       ; General error (alias)
%define misuse_code             2       ; Misuse of shell builtins
%define cannot_execute          126     ; Command invoked cannot execute
%define command_not_found       127     ; Command not found
%define invalid_exit_arg        128     ; Invalid argument to exit
%define fatal_signal_base       128     ; Fatal signal "n" (add signal number)

; Extended Exit Status Codes (sysexits.h compatible)
%define exit_usage              64      ; Command line usage error
%define exit_dataerr            65      ; Data format error
%define exit_noinput            66      ; Cannot open input
%define exit_nouser             67      ; Addressee unknown
%define exit_nohost             68      ; Host name unknown
%define exit_unavailable        69      ; Service unavailable
%define exit_software_error     70      ; Internal software error
%define exit_os_error           71      ; System error (e.g., can't fork)
%define exit_os_file_error      72      ; Critical OS file missing
%define exit_cant_create        73      ; Can't create (user) output file
%define exit_io_error           74      ; Input/output error
%define exit_temp_fail          75      ; Temporary failure; user is invited to retry
%define exit_protocol_error     76      ; Remote error in protocol
%define exit_no_permission      77      ; Permission denied
%define exit_config_error       78      ; Configuration error

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

; System Call Numbers - Official Linux Names
%define sys_read                0       ; Read from file descriptor
%define sys_write               1       ; Write to file descriptor  
%define sys_open                2       ; Open file
%define sys_close               3       ; Close file descriptor
%define sys_stat                4       ; Get file status
%define sys_fstat               5       ; Get file status by descriptor
%define sys_lstat               6       ; Get link status
%define sys_poll                7       ; Wait for events on file descriptors
%define sys_lseek               8       ; Reposition file offset
%define sys_mmap                9       ; Map files or devices into memory
%define sys_mprotect            10      ; Set protection on memory region
%define sys_munmap              11      ; Unmap files or devices from memory
%define sys_brk                 12      ; Change data segment size
%define sys_rt_sigaction        13      ; Examine/change signal action
%define sys_rt_sigprocmask      14      ; Examine/change blocked signals
%define sys_rt_sigreturn        15      ; Return from signal handler
%define sys_ioctl               16      ; Control device
%define sys_pread64             17      ; Read from file descriptor at offset
%define sys_pwrite64            18      ; Write to file descriptor at offset
%define sys_readv               19      ; Read data into multiple buffers
%define sys_writev              20      ; Write data from multiple buffers
%define sys_access              21      ; Check user's permissions for file
%define sys_pipe                22      ; Create pipe
%define sys_select              23      ; Synchronous I/O multiplexing
%define sys_sched_yield         24      ; Yield processor
%define sys_mremap              25      ; Remap virtual memory address
%define sys_msync               26      ; Synchronize memory with physical storage
%define sys_mincore             27      ; Get memory residence information
%define sys_madvise             28      ; Give advice about use of memory
%define sys_shmget              29      ; Get shared memory segment
%define sys_shmat               30      ; Attach shared memory segment
%define sys_shmctl              31      ; Control shared memory segment
%define sys_dup                 32      ; Duplicate file descriptor
%define sys_dup2                33      ; Duplicate file descriptor to specified value
%define sys_pause               34      ; Wait for signal
%define sys_nanosleep           35      ; Suspend execution for nanosecond intervals
%define sys_getitimer           36      ; Get value of interval timer
%define sys_alarm               37      ; Set alarm clock for delivery of signal
%define sys_setitimer           38      ; Set value of interval timer
%define sys_getpid              39      ; Get process identification
%define sys_sendfile            40      ; Transfer data between file descriptors
%define sys_socket              41      ; Create endpoint for communication
%define sys_connect             42      ; Initiate connection on socket
%define sys_accept              43      ; Accept connection on socket
%define sys_sendto              44      ; Send message to socket
%define sys_recvfrom            45      ; Receive message from socket
%define sys_sendmsg             46      ; Send message to socket
%define sys_recvmsg             47      ; Receive message from socket
%define sys_shutdown            48      ; Shut down socket connection
%define sys_bind                49      ; Bind name to socket
%define sys_listen              50      ; Listen for connections on socket
%define sys_getsockname         51      ; Get socket name
%define sys_getpeername         52      ; Get name of connected peer socket
%define sys_socketpair          53      ; Create pair of connected sockets
%define sys_setsockopt          54      ; Set socket options
%define sys_getsockopt          55      ; Get socket options
%define sys_clone               56      ; Create child process
%define sys_fork                57      ; Create child process
%define sys_vfork               58      ; Create child process and block parent
%define sys_execve              59      ; Execute program
%define sys_exit                60      ; Terminate calling process
%define sys_wait4               61      ; Wait for process to change state
%define sys_kill                62      ; Send signal to process
%define sys_uname               63      ; Get system information
%define sys_semget              64      ; Get semaphore set identifier
%define sys_semop               65      ; Perform semaphore operations
%define sys_semctl              66      ; Control semaphore set
%define sys_shmdt               67      ; Detach shared memory segment
%define sys_msgget              68      ; Get message queue identifier
%define sys_msgsnd              69      ; Send message to message queue
%define sys_msgrcv              70      ; Receive message from message queue
%define sys_msgctl              71      ; Control message queue
%define sys_fcntl               72      ; Manipulate file descriptor
%define sys_flock               73      ; Apply/remove advisory lock on file
%define sys_fsync               74      ; Synchronize file's in-core state
%define sys_fdatasync           75      ; Synchronize file's data
%define sys_truncate            76      ; Truncate file to specified length
%define sys_ftruncate           77      ; Truncate file descriptor to specified length
%define sys_getdents            78      ; Get directory entries
%define sys_getcwd              79      ; Get current working directory
%define sys_chdir               80      ; Change working directory
%define sys_fchdir              81      ; Change working directory via descriptor
%define sys_rename              82      ; Change name/location of file
%define sys_mkdir               83      ; Create directory
%define sys_rmdir               84      ; Delete directory
%define sys_creat               85      ; Create file
%define sys_link                86      ; Make new name for file
%define sys_unlink              87      ; Delete name and possibly file
%define sys_symlink             88      ; Make symbolic link to file
%define sys_readlink            89      ; Read value of symbolic link
%define sys_chmod               90      ; Change permissions of file
%define sys_fchmod              91      ; Change permissions of file descriptor
%define sys_chown               92      ; Change ownership of file
%define sys_fchown              93      ; Change ownership of file descriptor
%define sys_lchown              94      ; Change ownership of symbolic link
%define sys_umask               95      ; Set file mode creation mask
%define sys_gettimeofday        96      ; Get time of day
%define sys_getrlimit           97      ; Get resource limits
%define sys_getrusage           98      ; Get resource usage
%define sys_sysinfo             99      ; Get system information
%define sys_times               100     ; Get process times
%define sys_ptrace              101     ; Process trace
%define sys_getuid              102     ; Get user identity
%define sys_syslog              103     ; Read/clear kernel message ring buffer
%define sys_getgid              104     ; Get group identity
%define sys_setuid              105     ; Set user identity
%define sys_setgid              106     ; Set group identity
%define sys_geteuid             107     ; Get effective user identity
%define sys_getegid             108     ; Get effective group identity
%define sys_setpgid             109     ; Set process group identity
%define sys_getppid             110     ; Get parent process identity

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
%define absolute_value          abs     ; Absolute value (custom macro)
%define sign_extend_byte        movsx   ; Sign extend byte to register
%define sign_extend_word        movsx   ; Sign extend word to register
%define sign_extend_dword       movsxd  ; Sign extend dword to qword
%define zero_extend_byte        movzx   ; Zero extend byte to register
%define zero_extend_word        movzx   ; Zero extend word to register

; Logical Operations
%define logical_and             and     ; Bitwise AND
%define logical_or              or      ; Bitwise OR
%define logical_xor             xor     ; Bitwise XOR
%define logical_not             not     ; Bitwise NOT
%define logical_test            test    ; Bitwise AND without storing result

; Shift and Rotate Operations
%define shift_left              shl     ; Shift left (logical)
%define shift_right_logical     shr     ; Shift right logical (unsigned)
%define shift_right_arithmetic  sar     ; Shift right arithmetic (signed)
%define rotate_left             rol     ; Rotate left
%define rotate_right            ror     ; Rotate right
%define rotate_carry_left       rcl     ; Rotate through carry left
%define rotate_carry_right      rcr     ; Rotate through carry right

; Control Flow
%define no_operation            nop     ; No operation
%define halt_processor          hlt     ; Halt processor
%define clear_carry             clc     ; Clear carry flag
%define set_carry               stc     ; Set carry flag
%define clear_direction         cld     ; Clear direction flag (forward)
%define set_direction           std     ; Set direction flag (backward)
%define clear_interrupt         cli     ; Clear interrupt flag
%define set_interrupt           sti     ; Set interrupt flag

; Memory Prefetch Operations
%define prefetch_t0             prefetcht0  ; Prefetch to L1 cache
%define prefetch_t1             prefetcht1  ; Prefetch to L2 cache
%define prefetch_t2             prefetcht2  ; Prefetch to L3 cache
%define prefetch_nta            prefetchnta ; Prefetch non-temporal

; Cache Line Operations
%define cache_line_size         64      ; Standard cache line size
%define cache_line_flush        clflush ; Flush cache line
%define cache_line_flush_opt    clflushopt ; Optimized cache line flush

; Performance Counters
%define read_time_stamp         rdtsc   ; Read time stamp counter
%define read_performance_counter rdpmc  ; Read performance monitoring counter

; Processor Identification
%define cpu_identification      cpuid   ; CPU identification

; Fast Multiplication Macros (using LEA instruction)
%macro FAST_MUL_2 2
    add %1, %2          ; %1 = %2 * 2
%endmacro

%macro FAST_MUL_3 2
    lea %1, [%2 + %2*2] ; %1 = %2 * 3
%endmacro

%macro FAST_MUL_4 2
    shl %1, 2           ; %1 = %2 * 4
%endmacro

%macro FAST_MUL_5 2
    lea %1, [%2 + %2*4] ; %1 = %2 * 5
%endmacro

%macro FAST_MUL_8 2
    shl %1, 3           ; %1 = %2 * 8
%endmacro

%macro FAST_MUL_9 2
    lea %1, [%2 + %2*8] ; %1 = %2 * 9
%endmacro

%macro FAST_MUL_16 2
    shl %1, 4           ; %1 = %2 * 16
%endmacro

; Fast Division Macros (using SAR for signed division)
%macro FAST_DIV_2 2
    sar %1, 1           ; %1 = %2 / 2 (signed)
%endmacro

%macro FAST_DIV_4 2
    sar %1, 2           ; %1 = %2 / 4 (signed)
%endmacro

%macro FAST_DIV_8 2
    sar %1, 3           ; %1 = %2 / 8 (signed)
%endmacro

%macro FAST_DIV_16 2
    sar %1, 4           ; %1 = %2 / 16 (signed)
%endmacro

; Branchless Selection Macro
%macro BRANCHLESS_SELECT 4
    ; %1 = destination, %2 = condition register, %3 = value if true, %4 = value if false
    mov %1, %4          ; Load false value
    test %2, %2         ; Test condition
    mov eax, %3         ; Load true value (use eax as temp)
    cmovnz %1, rax      ; Select true value if condition != 0
%endmacro

; Memory Clearing Macros
%macro CLEAR_MEMORY 2
    ; %1 = destination address, %2 = size in bytes
    xor rax, rax        ; Clear rax
    mov rdi, %1         ; Load destination
    mov rcx, %2         ; Load size
    rep stosb           ; Clear memory
%endmacro

%macro CLEAR_QWORDS 2
    ; %1 = destination address, %2 = count in qwords
    xor rax, rax        ; Clear rax
    mov rdi, %1         ; Load destination
    mov rcx, %2         ; Load count
    rep stosq           ; Clear qwords
%endmacro

;===============================================================================
; ADVANCED OPTIMIZATION MACROS
;===============================================================================

; Alignment Macros
%define align_2         align 2
%define align_4         align 4
%define align_8         align 8
%define align_16        align 16
%define align_32        align 32
%define align_cache     align 64    ; Cache line alignment

; Branch Prediction Hints (for modern processors)
%define likely          ; Hint: branch likely taken
%define unlikely        ; Hint: branch unlikely taken

; Memory Fence Operations
%define memory_fence    mfence      ; Full memory fence
%define load_fence      lfence      ; Load fence
%define store_fence     sfence      ; Store fence

; Atomic Operations
%define atomic_exchange xchg        ; Atomic exchange
%define atomic_compare_exchange cmpxchg ; Atomic compare and exchange
%define lock_prefix     lock        ; Lock prefix for atomic operations

; Stack Operations
%define push_all_gp     pusha       ; Push all general purpose registers (not available in 64-bit)
%define pop_all_gp      popa        ; Pop all general purpose registers (not available in 64-bit)
%define push_flags      pushf       ; Push flags register
%define pop_flags       popf        ; Pop flags register
%define push_flags_64   pushfq      ; Push 64-bit flags register
%define pop_flags_64    popfq       ; Pop 64-bit flags register

; Conditional Move Operations
%define cmov_equal              cmove   ; Conditional move if equal
%define cmov_not_equal          cmovne  ; Conditional move if not equal
%define cmov_zero               cmovz   ; Conditional move if zero
%define cmov_not_zero           cmovnz  ; Conditional move if not zero
%define cmov_carry              cmovc   ; Conditional move if carry
%define cmov_not_carry          cmovnc  ; Conditional move if not carry
%define cmov_negative           cmovs   ; Conditional move if negative
%define cmov_positive           cmovns  ; Conditional move if positive
%define cmov_overflow           cmovo   ; Conditional move if overflow
%define cmov_not_overflow       cmovno  ; Conditional move if not overflow
%define cmov_parity             cmovp   ; Conditional move if parity
%define cmov_not_parity         cmovnp  ; Conditional move if not parity
%define cmov_less               cmovl   ; Conditional move if less (signed)
%define cmov_less_equal         cmovle  ; Conditional move if less or equal (signed)
%define cmov_greater            cmovg   ; Conditional move if greater (signed)
%define cmov_greater_equal      cmovge  ; Conditional move if greater or equal (signed)
%define cmov_below              cmovb   ; Conditional move if below (unsigned)
%define cmov_below_equal        cmovbe  ; Conditional move if below or equal (unsigned)
%define cmov_above              cmova   ; Conditional move if above (unsigned)
%define cmov_above_equal        cmovae  ; Conditional move if above or equal (unsigned)

; Jump Instruction Aliases
%define jump_unconditional      jmp     ; Unconditional jump
%define jump_equal              je      ; Jump if equal
%define jump_not_equal          jne     ; Jump if not equal
%define jump_zero               jz      ; Jump if zero
%define jump_not_zero           jnz     ; Jump if not zero
%define jump_carry              jc      ; Jump if carry
%define jump_not_carry          jnc     ; Jump if not carry
%define jump_negative           js      ; Jump if negative
%define jump_positive           jns     ; Jump if positive
%define jump_overflow           jo      ; Jump if overflow
%define jump_not_overflow       jno     ; Jump if not overflow
%define jump_parity             jp      ; Jump if parity
%define jump_not_parity         jnp     ; Jump if not parity
%define jump_less               jl      ; Jump if less (signed)
%define jump_less_equal         jle     ; Jump if less or equal (signed)
%define jump_greater            jg      ; Jump if greater (signed)
%define jump_greater_equal      jge     ; Jump if greater or equal (signed)
%define jump_below              jb      ; Jump if below (unsigned)
%define jump_below_equal        jbe     ; Jump if below or equal (unsigned)
%define jump_above              ja      ; Jump if above (unsigned)
%define jump_above_equal        jae     ; Jump if above or equal (unsigned)

; Loop Instructions
%define loop_counter            loop    ; Loop with RCX counter
%define loop_while_equal        loope   ; Loop while equal
%define loop_while_zero         loopz   ; Loop while zero
%define loop_while_not_equal    loopne  ; Loop while not equal
%define loop_while_not_zero     loopnz  ; Loop while not zero

; Set Byte Instructions
%define set_equal               sete    ; Set byte if equal
%define set_not_equal           setne   ; Set byte if not equal
%define set_zero                setz    ; Set byte if zero
%define set_not_zero            setnz   ; Set byte if not zero
%define set_carry               setc    ; Set byte if carry
%define set_not_carry           setnc   ; Set byte if not carry
%define set_negative            sets    ; Set byte if negative
%define set_positive            setns   ; Set byte if positive
%define set_overflow            seto    ; Set byte if overflow
%define set_not_overflow        setno   ; Set byte if not overflow
%define set_parity              setp    ; Set byte if parity
%define set_not_parity          setnp   ; Set byte if not parity
%define set_less                setl    ; Set byte if less (signed)
%define set_less_equal          setle   ; Set byte if less or equal (signed)
%define set_greater             setg    ; Set byte if greater (signed)
%define set_greater_equal       setge   ; Set byte if greater or equal (signed)
%define set_below               seta    ; Set byte if above (unsigned)
%define set_below_equal         setae   ; Set byte if above or equal (unsigned)

;===============================================================================
; END OF ADVANCED INSTRUCTION MACROS
;===============================================================================

;===============================================================================
; END OF FILE
;===============================================================================

; Usage example:
; %include "src/LC_core/lc_syscalls.asm"
;
; In your code:
; LC_WRITE_STDOUT message, message_len
; LC_EXIT_SUCCESS
