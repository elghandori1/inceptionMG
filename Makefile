up:
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean:clean
	docker system prune -af
	sudo rm -rf /home/moel-gha/data/wordpress/*
	sudo rm -rf /home/moel-gha/data/mariadb/*
	sudo rm -rf /home/moel-gha/data/portainer/*

re: fclean up
