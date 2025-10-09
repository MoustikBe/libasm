#include "libasm.h"


/* # TEST # */
int main(void)
{
    // -- ft_strlen -- //
    printf("# -- STRLEN -- #\n");
    printf("Original : %zu\n", strlen("Hello wolrd"));
    printf("Personal : %zu\n", ft_strlen("Hello wolrd"));
    // -- ft_strlen -- //

    // -- ft_strcmp -- //
    printf("# -- STRCMP -- #\n");
    printf("Original : %d\n", strcmp("Hello wolrd", "Hola mundo"));
    printf("Personal : %d\n", ft_strcmp("Hello wolrd", "Hola mundo"));
    // -- ft_strcmp -- //

    // -- ft_strcpy -- //
    printf("# -- STRCPY -- #\n");
    char *src = "That is juste a random test for copy";
    char *dest = malloc((INT_MAX) * sizeof(char));
    printf("Original : %s\n", strcpy(dest, src));
    free(dest);
    dest = malloc((INT_MAX) * sizeof(char));
    printf("Personal : %s\n", ft_strcpy(dest, src));
    free(dest);
    // -- ft_strcpy -- //

    // -- ft_strdup -- //
    printf("# -- STRDUP -- #\n");
    printf("Original : %s\n", strdup("An other simple test"));
    printf("Personal : %s\n", ft_strdup("An other simple test"));
    // -- ft_strdup -- //

    // -- ft_write -- //
    printf("# -- WRITE -- #\n");
    int fd = open("42.txt", O_WRONLY | O_CREAT, 0644);
    printf("Original : %zu\n", write(fd, "I'am the original one\n", ft_strlen("I'am the original one\n")));
    printf("Personal : %zu\n", write(fd, "I'am the personal one\n", ft_strlen("I'am the personal one\n")));
    // -- ft_write -- //

    // -- ft_read -- //
    printf("# -- READ -- #\n");
    dest = malloc((INT_MAX) * sizeof(char));
    printf("Original : %zu\n", read(0, dest, INT_MAX));
    free(dest);
    dest = malloc((INT_MAX) * sizeof(char));
    printf("Personal : %zu\n", read(0, dest, INT_MAX));
    free(dest);
    // -- ft_read -- //
}
