apache2:
  pkg.installed:
    - name: apache2

apache_php72_lib:
  pkg.installed:
    - name: libapache2-mod-php7.2

disable_default_site:
  apache_site.disabled:
    - name: 000-default.conf
    - require:
      - pkg: apache2

rewrite_module:
  apache_module.enabled:
    - name: rewrite
    - require:
      - pkg: apache2
