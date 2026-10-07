global ft_strcpy
section .data
section .text
ft_strcpy:
		;if our pointers are the same or NULL, return
	cmp rsi, rdi
	je ender
	cmp rdi, 0
	je ender
	cmp rsi, 0
	je ender
		;init rax at 0
	xor rax, rax
	xor rcx, rcx
loop:
		;copy the current byte ; if it's \0, return
	mov cl, byte [rsi + rax]
	mov [rdi + rax], cl
	cmp byte [rsi + rax], 0
	je ender
		;otherwise, inc
	inc rax
	jmp loop
ender:
	mov rax, rdi
	ret
