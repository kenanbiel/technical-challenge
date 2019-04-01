{% if grains['os_family'] == 'Debian' %}
filebeat_repo:
  pkgrepo.managed:
    - humanname: Filebeat Repository
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - file: /etc/apt/sources.list.d/elastic-6.x.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - refresh: True
    - require_in:
      - pkg: filebeat
      
{% elif grains['os_family'] == 'RedHat' %}
filebeat_repo:
  pkgrepo.managed:
    - humanname: Elastic repository for 6.x packages
    - baseurl: https://artifacts.elastic.co/packages/6.x/yum
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - enabled: True
    - require_in:
      - pkg: filebeat
{% endif %}

filebeat:
  pkg.installed:
    - name: filebeat
    - require:
      - pkgrepo: filebeat_repo

filebeat_service:
  service.running:
    - name: filebeat
    - enable: True
    - restart: True
    - require:
      - pkg: filebeat
    - watch:
      - file: filebeat_config
