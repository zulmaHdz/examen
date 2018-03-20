SYS_SALIDA equ 1

SYS_LEE equ 3

SYS_PRINT equ 4

STDIN equ 0

STDOUT equ 1



segment .data

msg6 db  0xA,0xD,"el resultado es: "
	
len6 equ $- msg6

	

;--- creación de variables 	

segment .bss
	
res resb 1
res2 resb 1
res3 resb 1




section  .text
	
global _start  
_start:  
	
;---------primer termino	
mov eax, 4	
mov edx, 2
	

mul edx
	  
	
add eax, 48
	
mov [res], eax




;---segundo termino
mov eax, 2
	
mov edx, 2
	
mov ecx, 3

	
mul edx
	   
mul ecx

mov ecx, 2
div ecx

add eax, 48
	
mov [res2], eax



;------tercer termino
mov eax, 2
	
mov edx, 2
	
mov ecx, 2	
mul edx
	   
mul ecx


add eax, 48

mov [res3], eax




;--suma y resta	
mov eax,[res]
mov edx,[res2]
mov ecx,[res3]

add eax,edx
sub eax,ecx
mov [res],eax
	
mov eax, SYS_PRINT
	
mov ebx, STDOUT
	
mov ecx, msg6
	
mov edx, len6
	
int 0x80

	
mov eax, SYS_PRINT
	
mov ebx, STDOUT
	
mov ecx, res	
mov edx, 1
	
int 0x80




salir:
	
mov eax, SYS_SALIDA
	
xor ebx, ebx
	
int 0x80
