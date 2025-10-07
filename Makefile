NAME    = libasm.a
S	    = nasm
SFLAG	= -f elf64
AR		= ar rcs
RM      = rm -rf
OBJDIR  = obj
SOURCES = ft_write.s ft_strlen.s ft_read.s

OBJECTS = $(SOURCES:%.s=$(OBJDIR)/%.o)

$(OBJDIR)/%.o: %.s
	@mkdir -p $(dir $@)
	@$(S) $(SFLAG) $< -o $@

$(NAME): $(OBJECTS)
	@$(AR) $(NAME) $(OBJECTS)
	@echo "\
	\033[0;32m ___   _____          ___   ____   ___\n\
	) __( )__ __(        )_ _( /  _ \\ / _( \n\
	| _)    | |          _| |_ )  ' / ))_  \n\
	)_(     )_(  _____  )_____(|_()_\\ \\__( \n\
	            )_____(                   "
	@echo "\nLibasm compiled -> cc main.c libasm.a"

clean : 
	@$(RM) -r $(OBJDIR)  > /dev/null 2>&1

fclean : clean
	@$(RM) $(NAME)


all : $(NAME)

re: fclean all

.PHONY: clean all re fclean