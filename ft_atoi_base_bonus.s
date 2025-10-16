; rax -> int ;
; has to handle binary base / hexa base / decimal base 
; if something else then number -> Error

; int ft_atoi_base(char *str, char *base);
; RDI -> char *str 
; RSI -> char *base

section .text
global ft_atoi_base

extern __errno_location
extern ft_strlen

ft_atoi_base:
    push rdi ; Donc la on push str dans la stack je crois 
    push rsi
    mov rdi, rsi 
    call .verif_base
    test rax, rax
    jz .cleanup_return_0
    pop rsi
    pop rdi
    jmp .to_int

.cleanup_return_0:
    pop rsi
    pop rdi
    jmp .return_0

.to_int: ; Ce modele devrait fonctionner pour int et binaire mais peut être pas pour hexa car il ne sait pas que E = 14
    push rdi ; On mets str dans la stack
    mov rdi, rsi
    call ft_strlen ; donc base_len est dans rax
    mov r8, rax 
    pop rdi
    xor rbx, rbx
    xor r10, r10 
    .loop_convert:
        movzx rcx, byte[rdi + r10] ; on stock dans rcx la valeur du char dans lequel on est
        cmp rcx, 0 ; on le compare au char 0
        je .return_val ; si c'est le char 0 on arrete la et return la valeur

        cmp rcx, '0'  
        jb .return_0 ; Si le nombre est moins haut que le char '0' pas bon error
        cmp rcx, '9' ; Si le char est en dessous c'est good ca veut dire c'est un nombre  
        jle .digit ; On boucle las bas 
        cmp rcx, 'F' 
        jle .upper ; Ici on check si jamais c'est un hexa en dessosus de F
        jmp .return_val 
    
    .digit:
        sub rcx, '0' ; Couvertir dans sa valeur numerique  
        jmp .store ; On jump dans le store 

    .upper:
        sub rcx, 'A' 
        add rcx, 10 ; Converir dans sa valeur numerique
        jmp .store ; On jump dans store 

    .store:
        imul rbx, r8 ; Ici c'est la partie de result = result * [base]
        add rbx, rcx ; Ici c'est ( + j) de la formule donc on add le char actuel transformer
        inc r10 ; On incremente de 1 
        jmp .loop_convert ; on reviens a la boucle pour continuer 

.return_val:
    mov rax, rbx
    ret

.verif_base:
    push rdi
    call ft_strlen
    pop rdi 
    cmp rax, 2
    jne .not_bin

    mov al, byte[rdi]
    cmp al, '0'
    jne .return_0
    mov al, byte [rdi + 1]
    cmp al, '1'
    jne .return_0
    
    mov rax, 1
    ret

.not_bin:    
    call ft_strlen
    cmp rax, 10
    jne .not_decimal
    xor rcx, rcx
    .loop_deci:
        cmp rcx, 10
        je .return_1
        mov al, byte [rdi + rcx]
        mov bl, '0'
        add bl, cl
        cmp al, bl
        jne .return_0
        inc rcx
        jmp .loop_deci
    
.not_decimal:
    call ft_strlen
    cmp rax, 16
    jne .return_0
    xor rcx, rcx
    .loop_hexa:
        cmp rcx, 10
        je .decimal_next
        mov al, byte [rdi + rcx]
        mov bl, '0'
        add bl, cl
        cmp al, bl
        jne .return_0
        inc rcx
        jmp .loop_hexa

.decimal_next:
    mov rcx, 10
    .loop_letter:
        cmp rcx, 16
        je .return_1
        mov al, byte [rdi + rcx]
        mov bl, 'A'
        mov dl, cl
        sub dl, 10
        add bl, dl
        cmp al, bl
        jne .return_0
        inc rcx
        jmp .loop_letter

.return_0: 
    xor rax, rax
    ret

.return_1:
    mov rax, 1
    ret



;if(strlen(base) == 10 || strlen(base) == 16)
;    {
;        int i = 0
;        while(i < 10)
;        {
;            if(base[i] != '0' + i) 
;                return 0
;            i++
;        }
;        if(strlen(base) == 10)
;            return(3)
;        i = 0
;        while(i < 6)
;        {
;            if(base[10 + i] != 'A' + i)
;                return(0)
;            i++
;        }
;        return(2)
;    }
;    return(0)