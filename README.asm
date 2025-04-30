section .data
    msg     db 'why are you reading this', 0xA
    msglen  equ $ - msg
section .text
    global _start
_start:
    mov eax, 4          
    mov ebx, 1          
    mov ecx, msg        
    mov edx, msglen     
    int 0x80            
    mov eax, 1          
    xor ebx, ebx        
    int 0x80            
