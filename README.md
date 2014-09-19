# Docker: Drupal 8

[Docker](http://docker.com) container aimed for [Drupal](http://drupal.org) 8 development, through [Docker Forge](http://github.com/robloach/forge).

http://github.com/kalamuna/kaladock


## Features

* [Docker Forge](http://github.com/robloach/forge)
* [PHP Web Server](http://php.net/manual/en/features.commandline.webserver.php)
* [MySQL](http://mysql.com) 5.5
* [phpMyAdmin](http://phpmyadmin.net) 4.0.10
* [Drush](http://github.com/drush-ops/drush) 7


## Usage

### Install

```
git clone https://github.com/kalamuna/k-stack.git
cd k-stack
docker build -t kalamuna/k-stack .
```

### Run

Run the image, binding associated ports, and mounting the present working
directory:

```
docker run -p 880:80 -p 222:22 -v $(pwd)/kaladock:/var/www/html:rw kalamuna/k-stack
```


### Todo

* Switch to MySQL
* Switch to Nginx
