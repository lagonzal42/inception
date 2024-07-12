USERNAME=${USER}


all:
	sudo mkdir -p /home/$(USERNAME)/data/db /home/$(USERNAME)/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d 
down: 
	docker-compose -f ./srcs/docker-compose.yml down 
rebuild_wp: down
	docker rmi wordpress
	docker rm wordpress
	docker volume rm wordpress
	rm -fr /home/$(USERNAME)/data/wordpress
	mkdir -p /home/$(USERNAME)/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d
clean: down
	docker system prune -af
	docker volume rm db wordpress
	sudo rm -fr /home/$(USERNAME)/data/db /home/$(USERNAME)/data/wordpress
	

re: clean all
	
