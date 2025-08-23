.global _start

.section .data
msg: .asciz "olá mundo"
tam = . - msg // tamanho da mensagem

.section .text
_start:
	mov x0, 1 // saída
	ldr x1, = msg // carregando a mensagem da memória
	mov x2, tam // carregando o tamamho da mensagem
	mov x8, 64 // instrução pra escrever
	svc 0 // executando
	
	// finalização do programa
	mov x0, 0
	mov x8, 93 // instrução para finalizar o programa
	svc 0
