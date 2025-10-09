section .text 
global ft_strcmp

ft_strcmp:
    .loop: 
        mov al, [rdi]
        mov bl, [rsi] 
        cmp al, bl 
        jne .diff
        test al, al
        je .equal 
        inc rdi
        inc rsi 
        jmp .loop 

    .equal:
        xor rax, rax
        ret

    .diff:
        movsx rax, al 
        movsx rbx, bl
        sub rax, rbx
        ret