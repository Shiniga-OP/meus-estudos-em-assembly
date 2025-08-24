.global _start
.section .data
texto: .asciz "texto de exemplo\n"
tam = .- texto

.section .text
_start:
	ldr x1, = texto
	mov x2, tam
	
	bl log
	sub sp, sp, tam // reserva 16 bytes
	mov x0, sp
	// copia a string
	bl copiar_string
	
	mov x0, sp  // cópia da string
	mov w1, 'o' // char alvo
	mov w2, 'X' // char novo
	bl substituir_chars
	
	mov x1, sp // string modificada
	mov x2, tam
	bl log
	bl fim
log:
	mov x0, 1
	mov x8, 64
	svc 0
	ret
fim:
    mov x0, 0
    mov x8, 93
    svc 0
copiar_string:
    ldrb w3, [x1], 1   // carrega byte e incrementar ponteiro
    strb w3, [x0], 1   // armazena byte e incrementar ponteiro
    subs x2, x2, 1  // decrementa contador
    b.gt copiar_string  // continua se não terminou
    ret
// x0: string, w1: char a substituir, w2: novo char
substituir_chars:
    ldrb w3, [x0] // carrega caractere atual
    cmp w3, 0 // verifica fim da string
    b.eq retorne
    cmp w3, w1 // verifica se é o caractere alvo
    b.ne proximo
    strb w2, [x0] // substituí pelo novo caractere
proximo:
    add x0, x0, 1 // avança para próximo caractere
    b substituir_chars
retorne:
    ret
    
