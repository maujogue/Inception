.PHONY: all up down clean fclean re

NAME				=	inception

DIR_SRC				=	srcs/

DOCKER_COMPOSE_PATH	=	$(DIR_SRC)docker-compose.yml

DOCKER_COMPOSE		=	docker compose -f $(DOCKER_COMPOSE_PATH)

VOL_PATH			=	/home/lboulatr/data/

VOLUMES				=	$(WORDPRESS_VOLUME_PATH) $(MARIADB_VOLUME_PATH)

include $(DIR_SRC).env

all: $(NAME)

$(NAME): $(VOLUMES)
		$(MAKE) up

up:
		$(DOCKER_COMPOSE) up --build

down:
		$(DOCKER_COMPOSE) down

clean:
		$(DOCKER_COMPOSE) down --volumes --rmi all

fclean: clean
		rm -rf $(VOLUMES)

re: fclean
		$(MAKE) all

$(VOLUMES):
		mkdir -p $(VOLUMES)