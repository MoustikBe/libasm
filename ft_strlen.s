
section .text ; C'est pour dire ici on commence le code 
global ft_strlen ; On rend ft_strlen disponible pour les autre fichiers etc...


ft_strlen: ; Definition de la fonction 
    xor rax, rax ; De ce que je comprends sa mets a 0 le registre rax, en mode tu contiendra 0 en binaire ou un truc comme sa non ? 
    .loop: ; C'est while en gros   
        cmp byte [rdi + rax], 0 ; if(str[i]) existe en gros 
        je done ; Si jamais pas de valeur ont changer donc on arrive a la fin de la ligne ca va a la fonction done 
        inc rax  ; incremente de 1 du coup rax  
        jmp .loop ; Retourne a loop 

done:
    ret ; Retourne rax
