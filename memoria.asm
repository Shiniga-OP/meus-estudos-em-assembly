.global _start
.section .text
_start:
	sub sp, sp, 16 // reservando 16 bytes na pilha
	mov x2, sp // guardando o início
	
	// escrevendo no array
	mov w1, 'o'
	strb w1, [x2], 1 // escrevendo na pilha
	
	mov w1, 'l'
	strb w1, [x2], 1
	
	mov w1, 'a'
	strb w1, [x2], 1
	
	mov x0, 1
	mov x1, sp // passando o ponteiro pra escrever
	sub x2, x2, x1 // calculando o tamanho (início - fim)
	mov x8, 64 // instrução de escrita
	svc 0
	// finalização do programa
	mov x0, 0
	mov x8, 93
	svc 0
	
