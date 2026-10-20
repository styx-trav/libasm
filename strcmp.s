global ft_strcmp
section .data
section .text
	;we get s1 in rdi and s2 in rsi
	;we use rdx as our inc memory checker
	;and rax, rcx as our sub s1[i], s2[i] holders
ft_strcmp:
		;first check :: are they the same pointers
	mov rax, rdi
	sub rax, rsi
	jz ender
		;is only one of them null
	xor rax, rax
	cmp rdi, 0
	je s1
	cmp rsi, 0
	je s2
		;not null, different strings :: init rdx at 0
	xor rdx, rdx
loop:
		;get s1[i] - s2[i] ; if not zero return that result
	mov al, byte [rdi + rdx]
	mov cl, byte [rsi + rdx]
	sub rax, rcx 
	jnz ender
		;get s1[i] ; if its null return our result
	cmp byte [rdi + rdx], 0
	je ender
		;otherwise i++ and start the loop again
	inc rdx
	jmp loop
s1:
	mov cl, byte [rsi]
	sub rax, rcx
	jmp ender
s2:
	mov al, byte [rdi]
ender:
	ret
