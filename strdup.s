global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
section .data
section .text
ft_strdup:
		;NULL protection
	xor rax, rax
	cmp rdi, 0
	je ender
		;first, we save our og string
	push rdi
		;then, store the size in rax from slen
	call ft_strlen
	mov rdi, rax
		;set up the stack for malloc call
	push rbp
	mov rbp, rsp
		;stack alignment, i think ? for the local variables or sthg idk
	sub rsp, 8
	call malloc wrt ..plt
	leave
		;stack realigned, if malloc returns NULL return NULL
	cmp rax, 0
	je ender
		;else send our new destination and our original string to scpy
	mov rdi, rax
	pop rsi
	call ft_strcpy
ender:
	ret
