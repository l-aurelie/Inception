NAME = inception

all: $(NAME)

$(NAME):
	mkdir -p /home/aleconte/data/code
	mkdir -p /home/aleconte/data/data

	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose --file ./srcs/docker-compose.yml down
	docker volume  rm srcs_database
	docker volume rm srcs_website
	sudo rm -rf /home/aleconte/data/data
	sudo rm -rf /home/aleconte/data/code

fclean:	clean

re:	clean all

.PHONY:	all clean fclean re
