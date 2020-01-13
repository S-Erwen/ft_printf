# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: esidelar <esidelar@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2019/10/18 01:30:37 by esidelar     #+#   ##    ##    #+#        #
#    Updated: 2020/01/08 22:45:55 by esidelar    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

NAME 	= 		libftprintf.a

SRCS 	= 		ft_printf.c \
				srcs/sj_parce.c \
				srcs/sj_pourcent.c \
				srcs/sj_conversion.c \
				srcs/sj_parce_main.c \
				srcs/sj_parce_s_point_fin.c \
				srcs/sj_parce_zero_mp.c \
				srcs/sj_not_flag.c \
				srcs/sj_zero.c \
				srcs/sj_reset_char.c \
				srcs/sj_minfors.c \
				srcs/sj_minus.c \
				srcs/sj_to_pf.c \
				srcs/sj_part_two.c \
				srcs/sj_part_three.c \
				srcs/sj_printf_norm.c \
				libft/ft_memset.c \
			  	libft/ft_bzero.c \
			  	libft/ft_memcpy.c \
			  	libft/ft_memccpy.c \
			  	libft/ft_memmove.c \
			  	libft/ft_memchr.c \
			  	libft/ft_memcmp.c \
			  	libft/ft_strlen.c \
			  	libft/ft_isalpha.c \
			  	libft/ft_isdigit.c \
			  	libft/ft_isalnum.c \
			  	libft/ft_isascii.c \
			  	libft/ft_isprint.c \
			  	libft/ft_toupper.c \
			  	libft/ft_tolower.c \
			  	libft/ft_strchr.c \
			  	libft/ft_strrchr.c \
			  	libft/ft_strncmp.c \
			  	libft/ft_strlcpy.c \
			  	libft/ft_strlcat.c \
			  	libft/ft_strnstr.c \
			  	libft/ft_atoi.c \
			  	libft/ft_calloc.c \
			  	libft/ft_strdup.c \
			  	libft/ft_substr.c \
			  	libft/ft_strjoin.c \
			  	libft/ft_strtrim.c \
			  	libft/ft_split.c \
			  	libft/ft_itoa.c \
			  	libft/ft_strmapi.c \
			  	libft/ft_putchar_fd.c \
			  	libft/ft_putstr_fd.c \
			  	libft/ft_putendl_fd.c \
			  	libft/ft_putnbr_fd.c \
			  	libft/ft_putnbr_base.c \
				libft/ft_putchar.c \
				libft/ft_putstr.c \
				libft/ft_itoa_base.c \
				libft/ft_add_char.c \
				libft/ft_utoa_base.c \
				libft/ft_ltoa.c \
				libft/ft_strilen.c \
				libft/ft_neg_atoi.c \
				libft/ft_strllen.c \
				libft/ft_lltoa_base.c \
				libft/ft_douilled_putstr.c \
				libft/ft_utoi.c
				
HEADER 	= 		include/libftprintf.h

LIB =			libft/libft.a

OBJS 	=		${SRCS:.c=.o}

all		:		$(NAME)

$(LIB) : 
		make -C libft

$(NAME) : $(LIB) $(OBJS) $(HEADER)
		cp libft/libft.a $(NAME)
		ar rcs $(NAME) $(OBJS) $(LIB)

%.o: %.c $(HEADER) libft/libft.h
		gcc -g -Wall -Wextra -Werror -I libft/libft.h -I include -c $< -o $@

clean:
		$(RM) $(OBJS)
		make clean -C libft

fclean: clean
		$(RM) $(NAME)
		make fclean -C libft
run:	all
		gcc -Wall -Werror -Wextra -g libftprintf.a $(SRCS) main.c -o printf
		clear
		./printf
curq:	all
		cp $(NAME) ./test/curqui_test
		make -C ./test/curqui_test
		./test/curqui_test/ft_printf_tests

re: fclean all
