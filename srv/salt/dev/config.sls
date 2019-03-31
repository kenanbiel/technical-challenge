drupal-site-conf:
  file.managed:
    - name: /etc/apache2/sites-available/drupal-site.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://dev/files/drupal-site.conf.jinja
    - template: jinja
    - context:
        drupal: {{ salt['pillar.get']('drupal:lookup') }}
    - require:
      - pkg: apache2

enable-drupal-site:
  apache_site.enabled:
    - name: drupal-site.conf
    - require:
      - pkg: apache2
      - file: drupal-site-conf

deploy-drupal:
  cmd.run:
    - name: drush -y site-install --db-url=mysql://drupaluser:drupalpassword@localhost:3306/drupaldatabase ; touch /tmp/deploy_drupal
    - cwd: /var/www/drupalsite
    - require:
      - apache_site: enable-drupal-site
      - pkg: apache2
    - unless: test -e /tmp/deploy_drupal
