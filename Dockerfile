# Forge: Drupal 8

FROM robloach/forge
MAINTAINER Rob Loach <robloach@gmail.com>

# Drush

RUN composer global require drush/drush:~7.0.0@alpha
RUN ln -sf ~/.composer/vendor/bin/drush /usr/bin/drush


# PHP Web Server
# @todo Switch to nginx

ADD configs/php/supervisor.conf /etc/supervisor/conf.d/php.conf


# MySQL

RUN apt-get install mysql-client mysql-server php5-mysql -y
ADD configs/mysql/my.cnf /etc/mysql/conf.d/my.cnf
ADD configs/mysql/mysql-run.sh /mysql-run.sh
ADD configs/mysql/supervisor.conf /etc/supervisor/conf.d/mysql.conf
RUN chmod +x /mysql-run.sh


# Drupal

RUN apt-get install sqlite3 php5-sqlite sendmail -y
ADD configs/drupal/drupal-setup.sh /drupal-setup.sh
RUN chmod +x /drupal-setup.sh
ADD configs/drupal/supervisor.conf /etc/supervisor/conf.d/drupal.conf


# Start

WORKDIR "/var/www"
VOLUME ["/profile"]
EXPOSE 22 80 3306
CMD ["supervisord", "-n"]
