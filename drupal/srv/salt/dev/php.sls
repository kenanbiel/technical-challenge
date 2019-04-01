php7_repo:
  pkgrepo.managed:
    - ppa: ondrej/php

php_packages:
  pkg.installed:
    - pkgs:
      - php7.2
      - php7.2-cli
      - php7.2-common
      - php7.2-mbstring
      - php7.2-gd
      - php7.2-intl
      - php7.2-xml
      - php7.2-mysql
      - php7.2-zip
      - php7.2-curl
      - php7.2-opcache
    - require:
      - pkgrepo: php7_repo
