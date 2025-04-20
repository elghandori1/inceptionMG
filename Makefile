up:
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean:clean
	docker system prune -af
	sudo rm -rf /home/username/data/wordpress/*
	sudo rm -rf /home/username/data/mariadb/*
	sudo rm -rf /home/username/data/portainer/*

re: fclean up
