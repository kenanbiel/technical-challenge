get-composer:
  cmd.run:
    - name: 'CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php'
    - unless: test -f /usr/local/bin/composer
    - env:
        - COMPOSER_HOME: '/root'
    - cwd: /root/

install-composer:
  cmd.wait:
    - name: mv /root/composer.phar /usr/local/bin/composer
    - cwd: /root/
    - watch:
      - cmd: get-composer

build-project:
  cmd.run:
    - name: composer install ; touch /tmp/built_project
    - cwd: /var/www/drupalsite/
    - require: 
      - cmd: install-composer
    - unless: test -e /tmp/built_project

install-cgr:
  cmd.wait:
    - name: composer global require consolidation/cgr
    - cwd: /root
    - watch:
      - cmd: install-composer

add-cgr-to-path:
  file.symlink:
    - name: /usr/local/bin/cgr
    - target: /root/.config/composer/vendor/consolidation/cgr/bin/cgr
    - user: root
    - group: root
    - require:
      - cmd: install-cgr

install-drush:
  cmd.wait:
    - name: cgr drush/drush
    - cwd: /root
    - watch:
      - file: add-cgr-to-path

add-drush-to-path:
  file.symlink:
    - name: /usr/local/bin/drush
    - target: /root/.config/composer/vendor/bin/drush
    - user: root
    - group: root
    - require:
      - cmd: install-drush
