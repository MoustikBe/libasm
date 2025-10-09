section .text
global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy



ft_strdup:
    push rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc 
    test rax, rax 
    je .malloc_fail
    pop rsi
    mov rdi, rax 
    call ft_strcpy
    ret 


.malloc_fail:
    pop rsi 
    xor rax, rax 
    ret