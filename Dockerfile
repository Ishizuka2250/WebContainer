FROM ubuntu:20.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y software-properties-common gpg

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get install -y vim git curl apache2 php8.0 php8.0-mbstring php8.0-xml php8.0-curl php8.0-mysql npm

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

RUN chmod +x $HOME/.nvm/nvm.sh && $HOME/.nvm/nvm.sh install -s node 14.19.2 && $HOME/.nvm/nvm.sh cache clear

WORKDIR /var/www/laravel

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["apachectl", "-D", "FOREGROUND"]
