section .data

	title db "---Positive And Negative Values In Array Counter---",10
	titlelen: equ $-title
	posmsg db "-Positive Values In Array = ",10
	posmsglen: equ $-posmsg
	negmsg db "-Negative Values In Array = ",10
	negmsglen: equ $-negmsg
	
	arr dd 1000H,-121H,0045H,34H,-12H,121H,-4543H,98H,-8999H	
	arrcnt equ 9	
	pcnt dw 0
	ncnt dw 0

		
section .bss
	dis_buffer resb 2

	
section .text
	global _start
	_start:
					;Program Title Display
					mov rax,1
					mov rdi,1
					mov rsi,title
					mov rdx,titlelen
					syscall
					
					mov rsi,arr
					mov rcx, arrcnt
					
					UP:
						bt word[rsi],15
						jnc PNEXT
						inc byte[ncnt]
						jmp PSKIP
					PNEXT:
						inc byte[pcnt]
					PSKIP:
						inc rsi
						inc rsi
						loop UP
					
									
					;Program +ve Count MSG Display
					mov rax,1
					mov rdi,1
					mov rsi,posmsg
					mov rdx,posmsglen
					syscall			
					
					mov bl, [pcnt]	
					;call _HEX2ASCII
					
								
					;Program NewLine Display
					mov rax,1
					mov rdi,1
					mov rsi,10
					mov rdx,1
					syscall	
					
					
					;Program -ve Count MSG Display
					mov rax,1
					mov rdi,1
					mov rsi,negmsg
					mov rdx,negmsglen
					syscall					
					
					mov bl, [ncnt]
					;call _HEX2ASCII
					
					mov rax,60
					xor rdi,rdi
					
	;_HEX2ASCII:
	
