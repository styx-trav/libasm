CC=nasm -felf64
NAME=libasm.a
SRC=read.s\
	write.s\
	strcmp.s\
	strcpy.s\
	strdup.s\
	strlen.s\
	calloc.s
OBJ = $(SRC:.s=.o)
T=tester
T_OBJ=main.o
T_SRC=main.c

all: $(NAME)

%.o: %.s
	$(CC) $< -o $@

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

test: $(T)

$(T_OBJ): $(T_SRC)
	gcc -I . -c $< -o $@

$(T): $(T_OBJ) $(NAME)
	gcc -static -z noexecstack -o $(T) $(T_OBJ) $(NAME)

clean:
	rm -f $(OBJ) $(T_OBJ)

fclean: clean
	rm -f libasm.a $(T)

re: fclean all

.PHONY: all clean fclean re test
