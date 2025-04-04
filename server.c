#include "minitalk.h"

static void signal_handler(int signal)
{
	static unsigned char chr;
	static int i;

	chr = chr << 1;
	if (signal == SIGUSR1)
		chr |= 1;
	i++;
	if (i == 8)
	{
		ft_printf("%c", chr);
		i = 0;
		chr = 0;
	}
}

int main(void)
{
	pid_t server_id;

	server_id = getpid();
	ft_printf("%d\n",server_id);
	signal(SIGUSR1, signal_handler);
	signal(SIGUSR2, signal_handler);
	while (1)
		pause();
	return (0);
}