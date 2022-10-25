# Persian Wordpress Dockerized
This is an easy Persian Wordpress setup with Docker and Docker Compose
# Requirements
Make sure you have the latest versions of Docker and Docker Compose installed on your machine.
# Build Image 
Clone this repository and cd into the folder.
Run this command to build the image
```
docker build -t wordpress-rtl .
```
`wordpress-rtl` is name of the image that will made.
# Docker
Wordpress require a database which i use MariaDB in this example.
Run this command to create and run a MariaDB container 
```
docker run -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpressdb -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=password --name wordpress-db -v "$PWD/database":/var/lib/mysql -d mariadb:latest
```
`MYSQL_ROOT_PASSWORD` is your MariaDB root password. \
`MYSQL_DATABASE` is your wordpress's database name. \
`MYSQL_USER` is your wordpress's database user. \
`MYSQL_PASSWORD` is your wordpress's database password

Then run this command to create and run wordpress container from the image you built
```
docker run -dit --name wordpress-rtl --link wordpress-db:mysql -p 80:80 -e Server_Name=localhost -e DB_NAME='wordpressdb' -e DB_USER='wordpress' -e DB_PASSWORD='password' -e DB_HOST='wordpress-db' wordpress-rtl
```
`Server_Name` is your domain name. \
`DB_NAME` is your database name for wordpress. \
`DB_USER` is your database user. \
`DB_PASSWORD` is your database password. \
`DB_HOST` the database host ( Here is the MariaDB's container hostname )
# Docker-Compose
Change the variables in docker-compose.yml file of your own then run this command
```
docker-compose  up -d
```








