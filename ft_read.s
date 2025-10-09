section .text
global ft_read

extern __errno_location

ft_read:
    mov rax, 0
    syscall
    cmp rax, 0
    jl .error
    ret

.error:
    call __errno_location ; En gros ici c'est une sorte de macro qu'il faut call
    mov dword [rax], 9 ; Sa c'est la reference du code d'erreur 
    mov rax, -1
    ret
