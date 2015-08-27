#!/bin/bash

if [ ! -f /mysql_configured ]; then
    echo "=> MySQL not configured yet, configuring MySQL ..."

    echo "=> Setting MySQL bind address to have access from the Docker host"
    sed -i 's/^bind-address\s*=.*$/bind-address = "0.0.0.0"/' /etc/mysql/my.cnf

    echo "=> Starting MySQL"
    /etc/init.d/mysql start &

    echo "=> Waiting till MySQL is started"
    mysqladmin --wait=30 ping > /dev/null 2>&1

    echo "=> Creating phpBB db"
    mysqladmin create phpbb

    echo "=> Creating MySQL WP user and granting external access";
    mysql -uroot -e "CREATE USER 'phpbb'@'%' IDENTIFIED BY 'phpbb';"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'phpbb'@'%' WITH GRANT OPTION;"

    touch /mysql_configured
else
    echo "=> MySQL is already configured"

    echo "=> Starting MySQL"
    /etc/init.d/mysql start
fi
