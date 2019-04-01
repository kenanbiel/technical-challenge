{%- if grains['os_family'] == 'Debian' %}

logstash-repo:
  pkgrepo.managed:
    - humanname: Logstash Debian Repository
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - file: /etc/apt/sources.list.d/elastic-6.x.list
    - refresh: True

{%- elif grains['os_family'] == 'RedHat' %}

logstash-repo:
  pkgrepo.managed:
    - humanname: Elastic repository for 6.x packages
    - baseurl: https://artifacts.elastic.co/packages/6.x/yum
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - enabled: 1

{%- endif %}
