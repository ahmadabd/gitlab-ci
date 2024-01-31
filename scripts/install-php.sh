#!/usr/bin/env ash

# Installing Composer
echo "====================================test0"
install-php-extensions @composer-${COMPOSER_VERSION} imagick
# note: install-php-extensions installs are much easier than docker-php-ext-install

echo "====================================test1"

# Installing PHP Extensions
docker-php-ext-configure opcache --enable-opcache
echo "====================================test2"
docker-php-ext-configure zip --with-libzip
docker-php-ext-install -j "$(nproc)" \
  sockets \
  bz2 \
  bcmath \
  exif

echo "====================================test3"

docker-php-ext-install -j "$(nproc)" mysqli pdo pdo_mysql
echo "====================================test4"
docker-php-ext-install -j "$(nproc)" zip
echo "====================================test5"
install-php-extensions redis
echo "====================================test6"
install-php-extensions intl
echo "====================================test7"
install-php-extensions imap
echo "====================================test8"
install-php-extensions exif
echo "====================================test9"

docker-php-ext-configure pcntl --enable-pcntl &&
  docker-php-ext-install pcntl &&
  docker-php-ext-enable pcntl

echo "====================================test10"

docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
echo "====================================test11"
# note: for some reason if we build gd with the rest of the extensions it will trow an error in php -v
docker-php-ext-install -j "$(nproc)" gd
echo "====================================test12"

docker-php-ext-install -j "$(nproc)" sockets
echo "====================================test13"
