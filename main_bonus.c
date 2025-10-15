
#include "libasm_bonus.h"

// BONUS //

int ft_atoi_base(char *str, char *base);


int main(void)
{
    printf("%d\n", ft_atoi_base("15", "0123456789ABCDEF"));
    printf("%d\n", atoi("15"));
    return (0);
}
