NAME=Aula2

all:
	nasm -f elf $(NAME).asm
	ld -m elf_i386 $(NAME).o -o ../bin/$(NAME)
	rm -rf $(NAME).o
	../bin/$(NAME)
