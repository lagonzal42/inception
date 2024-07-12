#!/bin/sh

# if [ -d /var/lib/mysql/$DB_NAME ]; then
# 	echo "MySQL directory already present /var/lib/mysql/$DB_NAME  , skipping creation"
# 	mysqld_safe
# else
# 	echo "Creating database"
# 	sed -i 's|DB_NAME|'${DB_NAME}'|g' /tmp/init.sql
# 	sed -i 's|DB_USER|'${DB_USER}'|g' /tmp/init.sql
# 	sed -i 's|DB_PASSWORD|'${DB_PASSWORD}'|g' /tmp/init.sql
# 	mysql_install_db

# 	# Initialize mysqld using the temp SQL file created
# 	mysqld  < /tmp/init.sql
# fi

# # Keep the MariaDB server running in the foreground
# exec mysqld --user=$DB_USER --console

#!/bin/sh

sed -i 's|DB_NAME|'${DB_NAME}'|g' /tmp/init.sql
sed -i 's|DB_USER|'${DB_USER}'|g' /tmp/init.sql
sed -i 's|DB_PASSWORD|'${DB_PASSWORD}'|g' /tmp/init.sql
sed -i 's|DB_ROOT_PASSWORD|'${DB_ROOT_PASSWORD}'|g' /tmp/init.sql

if [ -d "/var/lib/mysql/$DB_NAME" ]

then
  echo "Database exists."
  mysqld_safe

else
  mysql_install_db
  mysqld --init-file="/tmp/init.sql"

fi

mysqld --user=mysql --console