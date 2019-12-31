;64bit program helloworld!------------------------------------------------------------------------

section .data
	hello db 'Hello World!',10
	helloLen: equ $-hello

section .text
global _start
_start:
	mov rax,1
	mov rdi,1
	mov rsi,hello
	mov rdx,helloLen
	syscall
	mov rax,60
	xor rdi,rdi
	syscall
  
;-------------------------------------------------------------------------------------------------  
;Output-
;student@IOE-HWLAB:~/Documents/ABHI rno.43$ nasm -f elf32 mprno43_intr1_64b.asm -o hello.o
;mprno43_pr1_64b.asm:9-15: error: instruction not supported in 32-bit mode
;student@IOE-HWLAB:~/Documents/ABHI rno.43$ nasm -f elf64 mprno43_intr1_64b.asm -o hello.o
;student@IOE-HWLAB:~/Documents/ABHI rno.43$ ld -o hello hello.o
;student@IOE-HWLAB:~/Documents/ABHI rno.43$ ./hello
;Hello World!
