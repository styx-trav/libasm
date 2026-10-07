extern __errno_location
global ft_read
section .data
section .text
		;arguments go :: rdi fd; rsi buf; rdx buflen
		;syscall goes :: rax 0; rdi fd; rsi buf; rdx buflen
ft_read:
	xor rax, rax
	syscall
		;if error, rax is set to -errno value
	cmp rax, 0
	jl on_error
	ret
on_error:
	neg rax
	mov r8, rax
	call __errno_location wrt ..plt
		;rax now holds errno's address, r8 its value
	mov [rax], r8
	mov rax, 1
	neg rax
	ret
