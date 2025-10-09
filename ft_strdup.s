section .text
global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy



ft_strdup:
    push rdi ; On mets l'addresse de la src dans la pile pour la "save"
    call ft_strlen  ; On appelle ft_strlen donc rax la valeur par defaut est egal a la valeur de retour de ft_strlen 
    inc rax ; on fait +1 pour le char nul
    mov rdi, rax ; On sauvegarde la valeur de rax dans rdi car c'est comme si malloc allais faire malloc(rdi);
    call malloc ; On call malloc, donc la valeur de retour sera contenus dans rax et la taille est decider par rdi 
    test rax, rax ; Omn verifie si le malloc a bien changer la valeur de rax et allouer de la memoire 
    je .malloc_fail ; Si ca fait on va la bas donc on verif si c'est la meme val
    pop rsi ; Alors si j'ai bien compris ici le premier element de la pile etait le save de la src, donc on le recupere et on le save dans rsi pour le call de strcpy
    mov rdi, rax ; on va mettre la valeur de rax donc la chaine dest dans rdi afin que sa devienent le premier argument donc la destination 
    call ft_strcpy ; Et ici ca fait ft_strcpy(1EmeArgParConventionAssembly -> rdi(dest), 2EmeArgParConventionAssembly -> rsi(source)); sont return va dans rax
    ret ; on return rax 


.malloc_fail:
    pop rsi 
    xor rax, rax 
    ret