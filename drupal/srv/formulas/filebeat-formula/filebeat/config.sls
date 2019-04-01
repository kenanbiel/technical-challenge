{% from "filebeat/map.jinja" import conf with context %}

{% if salt['pillar.get']('filebeat:logstash:tls:enabled', False)  %}

{{ salt['pillar.get']('filebeat:logstash:tls:ssl_cert_path', '/etc/pki/tls/certs/logstash-forwarder.crt') }}:
  file.managed:
    - source: {{ salt['pillar.get']('filebeat:logstash:tls:ssl_cert', 'salt://filebeat/files/ca.pem') }}
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - file: filebeat_config

{% endif %}

filebeat_config:
  file.managed:
    - name: {{ conf.config_path }}
    - source: {{ conf.config_source }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: filebeat
