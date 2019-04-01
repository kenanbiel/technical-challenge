accept-java-eula:
  cmd.run:
    - name: "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections; touch /tmp/oracle-java"
    - unless: "test -e /tmp/oracle-java"

add-oracle:
  pkgrepo.managed:
    - ppa: webupd8team/java

oracle-java8-installer:
  pkg.installed:
    - require: 
      - pkgrepo: add-oracle

/var/log/kibana:
  file.directory:
    - name: /var/log/kibana
    - user: kibana
    - group: kibana
    - mode: 644
    - dir_mode: 755
    - makedirs: True

/var/log/kibana/kibana.log:
  cmd.run:
    - name: touch /var/log/kibana/kibana.log ; chown kibana. /var/log/kibana/kibana.log
    - require:
      - file: /var/log/kibana
    - unless: test -e /var/log/kibana/kibana.log
