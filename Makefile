
all:
	sudo mkdir -p /home/data/db /home/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d 
down: 
	docker-compose -f ./srcs/docker-compose.yml down 
clean: down
	docker system prune -af
	docker volume rm db wordpress
	sudo rm -fr /home/data/db /home/data/wordpress
	

re: clean all
	