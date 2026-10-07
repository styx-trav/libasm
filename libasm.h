#ifndef LIBASM_H
# define LIBASM_H

ssize_t ft_write(int, const void*, size_t); //put in rdi, rsi, rdx respectively
//on error returns -1 and sets errno to syscall return

size_t ft_strlen(char *s); //string found in rdi
//rax used for i increases and return
//s=NULL protected

int ft_strcmp(const char *, const char *); //put in rdi, rsi respectively 
//several NULL protections were added, which is why its so long and commented

char *ft_strcpy(char *restrict, char *restrict); //put in rdi, rsi respectively
//rax should return dst, so rdi given
//NULL protected

char *ft_strdup(const char *); //put in rdi
//rax should return dst, where a copy of the string is stored
//NULL protected

ssize_t ft_read(int fd, void *, size_t); //put in rdi, rsi and rdx respectively
//on error returns -1 and sets errno to syscall return

void *ft_calloc(size_t, size_t); //put in rdi, rsi
//on error returns NULL and sets errno to EINVAL (overflow) or malloc errno ENOMEM

#endif
