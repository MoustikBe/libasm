section .text
global ft_strcpy

ft_strcpy:
    mov rax, rdi ; On bouge rdi donc dest dans rax 
    .loop: ; C'est while en gros   
        mov dl, [rsi] ; On bouge dans une sorte de bloc memoire temporaire le bit ou de src dans dl
        mov [rdi], dl ; On mets dans dst la valeur de la val temporarire stocker dans dl
        inc rsi ; on avance l'index de src et dst
        inc rdi
        test dl, dl ; sa je crois en mode sa regarde si dl a ete mis a jour ou un truc comme sa 
        jnz .loop ; Ici si c'est pas finis on boucle 
        ret ; return si jamais finis 
