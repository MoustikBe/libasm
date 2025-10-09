section .text 
global ft_strcmp

ft_strcmp:
    .loop: ; le while 
        mov al, [rdi] ; On recupere les valeur au index et on les mets dans al et bl
        mov bl, [rsi] ; la meme 
        cmp al, bl ; on compare les deux 
        jne .diff ; on regarde si c'est different
        test al, al ; on regarde si al est == '\0'
        je .equal ; on verifie la valeur de retour 
        inc rdi  ; on incremente de 1
        inc rsi ; la meme 
        jmp .loop ; on loop 

    .equal:
        xor rax, rax ; Reset de rax a 0 et envois de 0
        ret

    .diff:
        movsx rax, al ; le soustraction classique 
        movsx rbx, bl
        sub rax, rbx
        ret
    

; RDI -> str1 
; RSI -> str2