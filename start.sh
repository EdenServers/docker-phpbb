#!/bin/sh

#Setting up SFTP
if ! id -u "$USERNAME" >/dev/null 2>&1; then
    PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' $PASSWORD)
    useradd -d /var/www/html --shell /usr/bin/rssh --password $PASSWORD $USERNAME
fi

./mysql_config.sh
./apache_config.sh

echo "=> Apache started..."
/usr/sbin/apache2ctl -D FOREGROUND


