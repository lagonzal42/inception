
all:
	docker-compose up -d

clean:
	docker-compose down && docker rmi mariadb:1.0 nginx:1.0 wordpress:1.0

re: clean all
	