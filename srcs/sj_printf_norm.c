/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   sj_printf_norm.c                                 .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: esidelar <esidelar@student.le-101.fr>      +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2019/12/29 10:57:50 by esidelar     #+#   ##    ##    #+#       */
/*   Updated: 2020/01/08 20:18:00 by esidelar    ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "../include/libftprintf.h"

void	sj_main_printf(t_print *t, int i, const char *s)
{
	if (i)
	{
		t->x_write.finish = sj_free_add(t->x_write.finish, '%');
		t->i += 2;
	}
	else
	{
		t->i++;
		sj_parsing(s, t);
	}
}

char	*sj_free_add(char *str, char c)
{
	char	*temp;

	if (str)
	{
		temp = ft_add_char(str, c);
		free(str);
	}
	else
		temp = ft_add_char("", c);
	return (temp);
}

char	*sj_temp_join(char *str, char *jn, int fre)
{
	char	*temp;

	temp = ft_strjoin(str, jn, 0);
	if (fre == 1)
	{
		free(str);
		free(jn);
	}
	else if (fre == 2)
		free(jn);
	else
		free(str);
	return (temp);
}

char	*sj_free_join(char *str, char *jn, int fre)
{
	char	*temp;

	if (str && jn)
		temp = sj_temp_join(str, jn, fre);
	else if (str && !jn)
	{
		temp = ft_strjoin(str, "", 0);
		if (fre != 2)
			free(str);
	}
	else if (!str && !jn)
		return (NULL);
	else
		temp = ft_strjoin("", jn, 0);
	return (temp);
}
