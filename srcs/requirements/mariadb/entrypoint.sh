if [ -d "/var/run/mysqld" ]; then
	echo "mysqld exists, skipping creation"
else
	echo "mysqld not found, creating...."
	mkdir -p var/run/mysqld
	chown -R mysql:mysql /var/run/mysqld
	chmod 777 /var/run/mysqld
fi

service mysql start

if [ -d /var/lib/mysql/mysql ]; then
	echo "A mariadb database already exists, skipping creation"
else
	echo "A mariadb database does not exist, creating..."

	mysql_install_db --user=root --ldata=/var/lib/mysql > /dev/null


	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql

	mysql < db1.sql
fi

exec /usr/bin/mysqld --user=root --console --skip-name-resolve --skip-networking=0 "$@"
