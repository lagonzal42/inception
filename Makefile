
all:
	docker-compose -f ./srcs/docker-compose.yml up -d 
down: 
	docker-compose -f ./srcs/docker-compose.yml down 
clean: down
	docker system prune -af
	docker volume rm db wordpress
	

re: clean all
	