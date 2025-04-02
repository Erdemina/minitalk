#include "minitalk.h"

static void send_signal(pid_t id, char *message)
{
	int i;
	int j;
	char result;

	i = 0;
	while (message[i] != '\0')
	{
		j = 7;
		while (j >= 0)
		{
			result = (message[i] >> j) & 1;
			if (result == 1)
				kill(id, SIGUSR1);
			else if (result == 0)
				kill(id, SIGUSR2);
			usleep(200);
			j--;
		}
		i++;
	}
}

int main(int argc, char *argv[])
{
	pid_t server_id;

	if (argc == 3)
	{
		server_id = ft_atoi(argv[1]);
		send_signal(server_id, ft_strjoin(argv[2],"\n"));
	}
	else
		ft_printf("Count of arguments are not good.\n"); 
	
	return (0);
}
