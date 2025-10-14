NAME    = libasm.a
S	    = nasm
SFLAG	= -f elf64
AR		= ar rcs
RM      = rm -rf
OBJDIR  = obj
SOURCES = ft_write.s ft_strlen.s ft_read.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_atoi_base_bonus.s

OBJECTS = $(SOURCES:%.s=$(OBJDIR)/%.o)

$(OBJDIR)/%.o: %.s
	@mkdir -p $(dir $@)
	@$(S) $(SFLAG) $< -o $@

$(NAME): $(OBJECTS)
	@$(AR) $(NAME) $(OBJECTS)
	@echo "\033[0;32m💻LIBASM💻"
	@echo "Libasm compiled -> cc main.c libasm.a"

clean : 
	@$(RM) -r $(OBJDIR)  > /dev/null 2>&1

fclean : clean
	@$(RM) $(NAME)
	@echo "\033[0;32mAll file deleted !"


all : $(NAME)

re: fclean all

# bonus : 


.PHONY: clean all re fclean