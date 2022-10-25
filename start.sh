#!/bin/bash
sed -i 's/DB_NAME_DEFAULT/'$DB_NAME'/g' /var/www/html/wordpress/wp-config.php
sed -i 's/DB_USER_DEFAULT/'$DB_USER'/g' /var/www/html/wordpress/wp-config.php
sed -i 's/DB_PASSWORD_DEFAULT/'$DB_PASSWORD'/g' /var/www/html/wordpress/wp-config.php
sed -i 's/DB_HOST_DEFAULT/'$DB_HOST'/g' /var/www/html/wordpress/wp-config.php

