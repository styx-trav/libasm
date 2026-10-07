global ft_strlen
section .data
section .text
ft_strlen:
	xor rax, rax
	cmp rdi, 0
	je ender
loop:
	cmp byte [rdi + rax], 0
	je ender
	inc rax
	jmp loop
ender:
	ret
