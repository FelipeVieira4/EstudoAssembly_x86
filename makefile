all:
	nasm -f elf aula3.asm
	ld -m elf_i386 aula3.o -o run
