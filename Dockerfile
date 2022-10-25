FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install curl  \  
    software-properties-common  \
    ca-certificates  \
    nginx \
    php-curl php-fpm php-imagick php-mbstring php-mysql php-xml php-zip -y
COPY wordpress /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/ && unlink /etc/nginx/sites-enabled/default && service php8.1-fpm start && nginx -t
RUN curl https://fa.wordpress.org/latest-fa_IR.tar.gz --output /latest-fa_IR.tar.gz && tar xzvf /latest-fa_IR.tar.gz && cp -a /wordpress/. /var/www/html/wordpress
COPY wp-config.php /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress/* && chmod -R 755 /var/www/html/wordpress/*
COPY start.sh /
ENTRYPOINT /bin/bash -x /start.sh && service php8.1-fpm start && nginx -g 'daemon off;'
