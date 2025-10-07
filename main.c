#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#define BUFFER_SIZE 5

ssize_t ft_strlen(const char *str);
size_t ft_write(int fd, const void *buf, size_t count);
size_t ft_read(int fd, const void *buf, size_t count);

int main(void)
{
    char *save = malloc(sizeof(char) * BUFFER_SIZE + 1);
    char *str = "hello wolrd";
    int fd = open("test.txt", O_WRONLY);
    //printf("Reponse de l'assembleur -> %zu\n", ft_strlen(str));
    //ft_write(fd, "Hello", ft_strlen("Hello"));
    
    printf("val -> %zu\n", read(0, save, BUFFER_SIZE));
    printf("val -> %zu\n", ft_read(0, save, BUFFER_SIZE));
    free(save);
}
