#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>
#include "libasm.h"

int main(void){
  char index[] = "here a string to show\n";
  char index2[] = "here a string to show\n";
  char in[] = "and another\n";
  char *dest;// = malloc(sizeof(char)*12);
  //char *test = NULL;
  //printf("%d\n", ft_strlen(test));
  //ft_write(2, index, ft_strlen(index));
  int res = ft_write(1, in, ft_strlen(in));
  //checking write return
  printf("%d\n", res);
  //printf("copied: %s\n", ft_strcpy(dest, in));
  dest = ft_strdup(in);
  printf("the old and the new:\n%s;\n%s", in, dest);
  free(dest);
  //willingly triggering a write error to see errno
  res = ft_write(2, in, ft_strlen(in));
  printf("%d, errno: %d, ebadf: %d\n", res, errno, EBADF);
  int fd = open("mytext.txt", O_RDONLY);
  res = ft_read(fd, in, 4);
  printf("%s", in);
  printf("%d, errno: %d, ebadf: %d\n", res, errno, EBADF);
  close(fd);
  res = ft_read(0, in, 4);
  printf("%s", in);
  printf("%d, errno: %d, ebadf: %d\n", res, errno, EBADF);
  char *a = ft_calloc(4, 4);
  printf("%s, %d, %d\n", a, errno, EINVAL);
  free(a);
  return 0;
}
