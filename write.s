extern __errno_location
global ft_write
section .data
section .text
		;arguments are received :: rdi fd; rsi str; rdx strlen
		;syscall write requires :: rax 1; rdi fd; rsi str; rdx strlen
ft_write:
	mov rax, 1	;syscall write number
	syscall
			;if syscall returns an error, rax set to -errno
	cmp rax, 0
	jl on_error
			;otherwise, rax holds the size_t written
	ret
on_error:
	neg rax
	mov r8, rax
	call __errno_location wrt ..plt
		;now rax should be the memory location of errno
	mov [rax], r8
	mov rax, -1
	ret
