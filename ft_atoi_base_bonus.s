section .text
global ft_atoi_base

extern __errno_location
extern ft_strlen

# rax -> int #
# has to handle binary base / hexa base / decimal base 
# if something else then number -> Error

# int ft_atoi_base(char *str, char *base);
# RDI -> char *str 
# RSI -> char *base

ft_atoi_base:
    mov rdx, rdi
    mov rdi, rsi 
    call verif_base ; call verif_base
    test rax, rax
    jz return_0 ; if(!verif_base(base))
    mov rdi, rdx
    cmp rax, 1
    je .to_bin ; if (1 -> to_bin) 
    cmp rax, 2 
    je .to_hexa ; if (2 -> to hexa)
    jmp .to_int ; else (to int)

.verif_base:
    call ft_strlen
    cmp rax, 2
    jne .not_bin

    mov al, byte [rdi]
    cmp al, '0'
    jne return_0
    mov al, byte [rdi + 1]
    cmp al, '1'
    jne return_0
    
    mov rax, 1
    ret

.not_bin:    
    call ft_strlen
    cmp rax, 10
    jne .not_decimal
    xor rcx, rcx
    .loop_deci:
        cmp rcx, 10
        je return_3
        mov al, byte [rdi + rcx]
        mov bl, '0'
        add bl, cl
        cmp al, bl
        jne return_0
        inc rcx
        jmp .loop
    
.not_decimal:
    xor rcx, rcx
    call ft_strlen
    cmp rax, 16
    jne return_0
    .loop:
        cmp rcx, 16
        je return_2


return_0: 
    xor rax, rax
    ret

return_2:
    mov rax, 2
    ret

return_3:
    mov rax, 3
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