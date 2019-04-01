disable_nginx_default_site:
  cmd.run:
    - name: rm -rf /etc/nginx/sites-enabled/default
    - unless: test ! -e /etc/nginx/sites-enabled/default

json_encode_plugin:
  cmd.run:
    - name: /usr/share/logstash/bin/logstash-plugin install logstash-filter-json_encode
    - unless: /usr/share/logstash/bin/logstash-plugin list | grep logstash-filter-json_encode
    - require:
      - pkg: logstash-pkg
