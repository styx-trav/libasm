extern __errno_location
extern malloc
global ft_calloc
section .data
section .text
ft_calloc:
		;first check for overflow
	mov rax, rdi
		;mul expects its first operand in rax
	mul rsi
		;mul stashes its result in rax (lower) and rdx (higher) for overflow
	cmp rdx, 0
	jne on_error
	mov rdi, rax
		;stack set up
	push rbp
	mov rbp, rsp
	sub rsp, 8
	call malloc wrt ..plt
		;stack realignment
	leave
		;on null return
	cmp rax, 0
	je ender
memloop:
		;loop from end of allocated array to the start address
	dec r8
	mov byte [rax + r8], 0
	cmp r8, 0
	je ender
	jmp memloop
on_error:
	call __errno_location wrt ..plt
		;22 is EINVAL, the errno value for calloc overflow
	mov qword [rax], 22
	xor rax, rax
ender:
	ret
