#ifndef LIBASM_H
# define LIBASM_H

/* -- Extern libs -- */
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
/* -- Extern libs -- */

/* -- Function of libasm mendatory -- */
ssize_t     ft_strlen(const char *str);
ssize_t     ft_write(int fd, const void *buf, size_t count);
ssize_t     ft_read(int fd, const void *buf, size_t count);
int         ft_strcmp(const char *s1, const char *s2);
char        *ft_strcpy(char *dest, const char *src);
char        *ft_strdup(const char *s);
/* -- Function of libasm mendatory -- */

#endif