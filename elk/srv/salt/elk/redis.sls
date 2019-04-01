redis-server:
  pkg.installed:
    - name: redis-server
  file.replace:
    - name: /etc/redis/redis.conf
    - pattern: "bind 127.0.0.1 ::1"
    - repl: "bind 0.0.0.0"
    - append_if_not_found: True
  service.running:
    - name: redis-server
    - enable: True
    - restart: True
    - require:
      - pkg: redis-server
    - watch:
      - file: redis-server
        

  
