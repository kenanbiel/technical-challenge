{% set username = salt['pillar.get']('drupal:lookup:user', 'drupaladmin') %}
{{ username }}:
  user:
    - present
    - name: {{ username }}
    - shell: /bin/bash
    - groups: [www-data]
