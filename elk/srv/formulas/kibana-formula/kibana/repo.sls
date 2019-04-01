# Setup Elastic Repo
{% from "kibana/map.jinja" import kibana with context %}

kibana-repo:
  pkgrepo.managed:
    - humanname: Kibana Repo
    - name: deb {{ kibana.repo_url }} stable main
    - file: /etc/apt/sources.list.d/elasticsearch.list
    - gpgcheck: 1
    - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch
    - require_in:
      - pkg: kibana
    - clean_file: true
    - refresh: true
