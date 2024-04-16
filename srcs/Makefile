
all:
	docker-compose up -d
down: 
	docker-compose down
clean:
	docker-compose down && docker rmi mariadb:1.0 nginx:1.0 wordpress:1.0
	sudo rm -fr /home/larra/data/wordpress/* && sudo rm -fr /home/larra/data/db/*
	

re: clean all
	