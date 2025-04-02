.PHONY: all clean fclean re

# Compiler and Flags
CC = cc
CFLAGS = -Wall -Wextra -Werror

# Directories & Files
OBJ_DIR = obj/
SRCS_SERVER = server.c
SRCS_CLIENT = client.c
OBJS_SERVER = $(SRCS_SERVER:%.c=$(OBJ_DIR)%.o)
OBJS_CLIENT = $(SRCS_CLIENT:%.c=$(OBJ_DIR)%.o)

# Libraries
PRINTF = ./printf/libftprintf.a
LIBFT = ./libft/libft.a

# Binaries
SERVER = server
CLIENT = client

# Commands
RM = rm -rf

# Rules
all: $(PRINTF) $(LIBFT) $(SERVER) $(CLIENT)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o: %.c | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -I./printf -c $< -o $@

$(SERVER): $(OBJS_SERVER)
	$(CC) $(CFLAGS) $(OBJS_SERVER) $(PRINTF) $(LIBFT) -o $(SERVER)

$(CLIENT): $(OBJS_CLIENT)
	$(CC) $(CFLAGS) $(OBJS_CLIENT) $(PRINTF) $(LIBFT) -o $(CLIENT)

$(PRINTF):
	@$(MAKE) -C ./printf

$(LIBFT):
	@$(MAKE) -C ./libft

clean:
	$(RM) $(OBJ_DIR)
	@$(MAKE) -C ./printf clean
	@$(MAKE) -C ./libft clean

fclean: clean
	$(RM) $(SERVER) $(CLIENT)
	@$(MAKE) -C ./printf fclean
	@$(MAKE) -C ./libft fclean

re: fclean all
